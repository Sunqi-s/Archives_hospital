package com.archives.archive.service.impl;

import com.archives.archive.domain.*;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.archive.mapper.ArchiveRuleMapper;
import com.archives.archive.service.IArchiveInfoService;
import com.archives.common.core.domain.entity.SysDept;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.core.domain.model.LoginUser;
import com.archives.common.core.redis.RedisCache;
import com.archives.common.exception.ServiceException;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import com.archives.system.domain.SysOss;
import com.archives.system.mapper.SysDeptMapper;
import com.archives.system.mapper.SysOssMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
/**
 * 档案信息Service业务层处理
 *
 * @author é«å°å·
 * @date 2024-07-11
 */
@Service
public class ArchiveInfoServiceImpl implements IArchiveInfoService
{
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;

    @Autowired
    private SysOssMapper sysOssMapper;

    @Autowired
    private PlaceonfileLogServiceImpl placeonfileLogService;

    @Autowired
    private SysDeptMapper sysDeptMapper;

    @Autowired
    private ArchiveRuleMapper archiveRuleMapper;

    @Autowired
    private final ExecutorService executorService = Executors.newFixedThreadPool(10); // 创建一个固定大小的线程池
    @Autowired
    private RedisCache redisCache;

    public ArchiveInfoServiceImpl(ArchiveInfoMapper archiveInfoMapper, SysOssMapper sysOssMapper) {
        this.archiveInfoMapper = archiveInfoMapper;
        this.sysOssMapper = sysOssMapper;
    }

    /**
     * 查询档案信息
     *
     * @param id 档案信息主键
     * @return 档案信息
     */
    @Override
    public ArchiveInfo selectArchiveInfoById(Long id)
    {
        ArchiveInfo archiveInfo = archiveInfoMapper.selectArchiveInfoById(id);
        if (archiveInfo != null) {
            SysOss sysOss = new SysOss();
            sysOss.setFid(String.valueOf(id));
            List<SysOss> sysOssList = sysOssMapper.selectSysOssList(sysOss);
            archiveInfo.setSysOssList(sysOssList);
        }
        return archiveInfo;
    }

    /**
     * 查询档案信息列表
     *
     * @param archiveInfo 档案信息
     * @return 档案信息
     */
    @Override
    public List<ArchiveInfo> selectArchiveInfoList(ArchiveInfo archiveInfo)
    {
        String[] dataPermiList = getDataPermit();
        String searchValue = archiveInfo.getSearchValue();
        Long categoryId = archiveInfo.getCategoryId();
        Long archiveStatus = archiveInfo.getArchiveStatus();
        if (searchValue != null && !searchValue.isEmpty()) {
            return archiveInfoMapper.selectArchiveInfoListByKeyword(searchValue,categoryId,archiveStatus, dataPermiList);
        }
        return archiveInfoMapper.beachSearch(archiveInfo, dataPermiList);
    }

    /**
     * 新增档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    @Override
    public int insertArchiveInfo(ArchiveInfo archiveInfo)
    {
        archiveInfo.setDataPermit( String.valueOf(archiveInfo.getDepartment()));
        archiveInfo.setCreateTime(DateUtils.getNowDate());
        int cnt = archiveInfoMapper.insertArchiveInfo(archiveInfo);
        Long fid = archiveInfo.getId();
        int ossStatus = archiveInfo.getOssStatus();
        if(!archiveInfo.getSysOssList().isEmpty()) {
            ossStatus = 1;
            for(SysOss sysOss : archiveInfo.getSysOssList()) {
                sysOss.setFid(String.valueOf(fid));
                sysOssMapper.insertSysOss(sysOss);
            }
            archiveInfoMapper.insertOssStatus(ossStatus, fid);
        }else {
            ossStatus = 2;
            archiveInfoMapper.insertOssStatus(ossStatus, fid);
        }
        return cnt;
    }

    /**
     * 修改档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    @Override
    public int updateArchiveInfo(ArchiveInfo archiveInfo)
    {
        archiveInfo.setUpdateTime(DateUtils.getNowDate());
        Long fid = archiveInfo.getId();

        SysOss sysOss = new SysOss();
        sysOss.setFid(String.valueOf(fid));
        // 获取数据库中的附件列表
        List<SysOss> originalSysOssList = sysOssMapper.selectSysOssList(sysOss);

        // 新附件列表
        List<SysOss> newSysOssList = archiveInfo.getSysOssList();

        // 将原附件列表转换为附件ID的集合
        Set<Long> originalFileIds = originalSysOssList.stream()
                .map(SysOss::getId)
                .collect(Collectors.toSet());

        // 将新附件列表转换为附件ID的集合
        Set<Long> newFileIds = newSysOssList.stream()
                .map(SysOss::getId)
                .collect(Collectors.toSet());

        // 找出需要删除的附件ID
        Set<Long> idsToDelete = new HashSet<>(originalFileIds);
        idsToDelete.removeAll(newFileIds);

        // 删除原有附件中不再存在于新列表的附件
        if (!idsToDelete.isEmpty()) {
            sysOssMapper.deleteSysOssByIds(new ArrayList<>(idsToDelete).toArray(new Long[0]));
        }

        // 找出需要添加的附件
        Set<Long> idsToAdd = new HashSet<>(newFileIds);
        idsToAdd.removeAll(originalFileIds);

        // 插入新附件
        for (SysOss newSysOss : newSysOssList) {
            if (idsToAdd.contains(newSysOss.getId())) {
                newSysOss.setFid(String.valueOf(fid));
                sysOssMapper.insertSysOss(newSysOss);
            }
        }

        // 更新oss状态
        SysOss sysOss1 = new SysOss();
        sysOss1.setFid(String.valueOf(fid));
        List<SysOss> sysOssList1 = sysOssMapper.selectSysOssList(sysOss1);
        int length = sysOssList1.size();
        if(length > 0) {
            int ossStatus = 1;
            archiveInfo.setOssStatus(ossStatus);
        }else {
            int ossStatus = 2;
            archiveInfo.setOssStatus(ossStatus);
        }

        archiveInfo.setDataPermit(archiveInfo.getDepartment());
        // 更新归档信息
        return archiveInfoMapper.updateArchiveInfo(archiveInfo);
    }

    @Override
    public int updateArchiveStatusByIds(SearchJson searchJson) {
        ArchiveInfo archiveInfoStatus = new ArchiveInfo();
        archiveInfoStatus.setArchiveDate(DateUtils.getNowDate());
        return archiveInfoMapper.updateArchiveStatusByIds(searchJson.getIds(),archiveInfoStatus);
    }

    //归档档案信息
    @Override
    public int updateArchiveStatusById(SearchJson searchJson)
    {
        Long[] ids = searchJson.getIds();
        PlaceonfileLog placeonfileLog = buildPlaceonfileLog(Arrays.asList(ids), Long.valueOf(searchJson.getCategoryId()), null,null);
        placeonfileLog.setType(searchJson.getArchiveStatus());

        placeonfileLogService.insertPlaceonfileLog(placeonfileLog);

        ArchiveInfo archiveInfoStatus = new ArchiveInfo();
        archiveInfoStatus.setArchiveDate(DateUtils.getNowDate());
        return archiveInfoMapper.updateArchiveStatusByIds(ids,archiveInfoStatus);
    }

    @Override
    public int updateArchiveStatusAll(ArchiveInfo archiveInfo) {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList = getDataPermit();

        // 获取需要更新的档案ID列表
        List<Long> ids = getIdsToArchive(archiveInfo, dataPermiList);

        // 如果没有找到需要更新的档案，直接返回0
        if (ids.isEmpty()) {
            return 0;
        }
        Long categoryId = archiveInfo.getCategoryId();
        Long time = (Long) new Date().getTime();
        Date archiveDate = DateUtils.getNowDate();
        // 构建PlaceonfileLog对象
        for (int i = 0; i < ids.size(); i += 3000) {
            List<Long> subList = ids.subList(i, Math.min(i + 3000, ids.size()));
            PlaceonfileLog placeonfileLog = buildPlaceonfileLog(subList, categoryId, time, archiveDate);
            // 设置日志类型
            placeonfileLog.setType(archiveInfo.getArchiveStatus() == 1 ? "huidang" : "guidang");
            // 插入日志
            placeonfileLogService.insertPlaceonfileLog(placeonfileLog);
        }

        // 更新归档信息
        archiveInfo.setArchiveDate(DateUtils.getNowDate());
        return archiveInfoMapper.updateArchiveStatusByIds(ids.toArray(new Long[0]), archiveInfo);
    }

    @Override
    public int sendArchiveInfoByIds(SearchJson searchJson) {
        Long[] ids = searchJson.getIds();
        PlaceonfileLog placeonfileLog = buildPlaceonfileLog(Arrays.asList(ids), Long.valueOf(searchJson.getCategoryId()), null,null);
        placeonfileLog.setType(searchJson.getArchiveStatus());

        placeonfileLogService.insertPlaceonfileLog(placeonfileLog);

        return archiveInfoMapper.sendArchiveInfo(ids);
    }

    /**
     * 批量删除档案信息
     *
     * @param ids 需要删除的档案信息主键
     * @return 结果
     */
    @Override
    public int deleteArchiveInfoByIds(Long[] ids)
    {
        return archiveInfoMapper.deleteArchiveInfoByIds(ids);
    }

    /**
     * 删除档案信息信息
     *
     * @param id 档案信息主键
     * @return 结果
     */
    @Override
    public int deleteArchiveInfoById(Long id)
    {
        return archiveInfoMapper.deleteArchiveInfoById(id);
    }

    /**
     * 批量新增档案信息
     *
     * @param archiveInfoList 档案信息列表
     * @return 影响的行数
     */
    @Override
    public CompletableFuture<List<ArchiveInfo>> insertArchiveInfoList(List<ArchiveInfo> archiveInfoList) {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        List<SysDept> deptList = sysDeptMapper.selectDeptList(new SysDept());

        //拿到数据权限
        return CompletableFuture.supplyAsync(() -> {

            if (archiveInfoList == null || archiveInfoList.isEmpty()) {
                throw new ServiceException("导入用户数据不能为空！");
            }

            for (ArchiveInfo archiveInfo : archiveInfoList) {
                if(archiveInfo.getCategoryId() == null) {archiveInfo.setCategoryId(Long.valueOf(0));}
                if(archiveInfo.getArchiver() == null) {archiveInfo.setArchiver("");}
                if(archiveInfo.getFondsNumber() == null){archiveInfo.setFondsNumber("");}
                if(archiveInfo.getFondsName() == null){archiveInfo.setFondsName("");}
                if(archiveInfo.getRetentionPeriod() == null){archiveInfo.setRetentionPeriod("");}
                if(archiveInfo.getItemNumber() == null){archiveInfo.setItemNumber("");}
                if(archiveInfo.getArchiveNumber() == null){archiveInfo.setArchiveNumber("");}
                if(archiveInfo.getArchiveDate() == null){archiveInfo.setArchiveDate(null);}
                if(archiveInfo.getRemarks() == null){archiveInfo.setRemarks("");}
                if(archiveInfo.getArchiveStatus() == null){archiveInfo.setArchiveStatus(Long.valueOf(0));}
                if(archiveInfo.getCategoryCode() == null){archiveInfo.setCategoryCode("");}
                if(archiveInfo.getField1() == null){archiveInfo.setField1("");}
                if(archiveInfo.getField2() == null){archiveInfo.setField2("");}
                if(archiveInfo.getField3() == null){archiveInfo.setField3("");}
                if(archiveInfo.getField4() == null){archiveInfo.setField4("");}
                if(archiveInfo.getField5() == null){archiveInfo.setField5("");}
                if(archiveInfo.getField6() == null){archiveInfo.setField6("");}
                if(archiveInfo.getField7() == null){archiveInfo.setField7("");}
                if(archiveInfo.getField8() == null){archiveInfo.setField8("");}
                if(archiveInfo.getField9() == null){archiveInfo.setField9("");}
                if(archiveInfo.getField10() == null){archiveInfo.setField10("");}
                if(archiveInfo.getField11() == null){archiveInfo.setField11("");}
                if(archiveInfo.getField12() == null){archiveInfo.setField12("");}
                if(archiveInfo.getField13() == null){archiveInfo.setField13("");}
                if(archiveInfo.getField14() == null){archiveInfo.setField14("");}
                if(archiveInfo.getField15() == null){archiveInfo.setField15("");}
                if(archiveInfo.getField16() == null){archiveInfo.setField16("");}
                if(archiveInfo.getField17() == null){archiveInfo.setField17("");}
                if(archiveInfo.getField18() == null){archiveInfo.setField18("");}
                if(archiveInfo.getField19() == null){archiveInfo.setField19("");}
                if(archiveInfo.getField20() == null){archiveInfo.setField20("");}
                if(archiveInfo.getField21() == null){archiveInfo.setField21("");}
                if(archiveInfo.getField22() == null){archiveInfo.setField22("");}
                if(archiveInfo.getField23() == null){archiveInfo.setField23("");}
                if(archiveInfo.getField24() == null){archiveInfo.setField24("");}
                if(archiveInfo.getField25() == null){archiveInfo.setField25("");}
                if(archiveInfo.getField26() == null){archiveInfo.setField26("");}
                if(archiveInfo.getField27() == null){archiveInfo.setField27("");}
                if(archiveInfo.getField28() == null){archiveInfo.setField28("");}
                if(archiveInfo.getField29() == null){archiveInfo.setField29("");}
                if(archiveInfo.getField30() == null){archiveInfo.setField30("");}

                String deptIds = String.valueOf(deptList.stream().filter(dept -> dept.getDeptName().equals(archiveInfo.getDepartment())).findFirst().map(SysDept::getDeptId).orElse(null));

                if(deptIds != null&&deptIds != "null"){
                    archiveInfo.setDataPermit(deptIds);
                    archiveInfo.setDepartment(deptIds);
                }else{
                    throw new ServiceException("导入信息中归档部门与部门信息不匹配！");
                }
                archiveInfo.setCreateTime(DateUtils.getNowDate());
                archiveInfo.setCreateBy(currentUser.getNickName());
            }
            // 调用mapper里写好的批量插入方法
            int rows = archiveInfoMapper.insertArchiveInfoList(archiveInfoList);

            // 更新每个档案信息的文件列表中的fid
            for (ArchiveInfo archiveInfo : archiveInfoList) {
                Long archiveId = archiveInfo.getId();
                List<SysOss> sysOssList = archiveInfo.getSysOssList();
                if (sysOssList != null) {
                    for (SysOss sysOss : sysOssList) {
                        sysOss.setFid(String.valueOf(archiveId));
                    }
                }
            }

            return archiveInfoList;
        }, executorService);
    }

    @Override
    public int sendArchiveAll(ArchiveInfo archiveInfo) {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList = getDataPermit();

        // 获取需要更新的档案ID列表
        List<Long> ids = getIdsToArchive(archiveInfo, dataPermiList);

        // 如果没有找到需要更新的档案，直接返回0
        if (ids.isEmpty()) {
            return 0;
        }
        Long time = (Long) new Date().getTime();
        Date createTime = DateUtils.getNowDate();
        // 如果ids数量超过3000，则拆分成多个List
        int maxIdsSize = 3000;
        for (int i = 0; i < ids.size(); i += maxIdsSize) {
            List<Long> subList = ids.subList(i, Math.min(i + maxIdsSize, ids.size()));
            PlaceonfileLog placeonfileLog = buildPlaceonfileLog(subList, archiveInfo.getCategoryId(), time, createTime);
            placeonfileLog.setType("liyong");
            placeonfileLog.setPlaceonfileBy("系统");
            placeonfileLog.setDataPermit("all");
            placeonfileLogService.insertPlaceonfileLog(placeonfileLog);
        }

        return archiveInfoMapper.sendArchiveInfo(ids.toArray(new Long[0]));
    }

    @Override
    public List<ArchiveInfo> beachSearch(ArchiveInfo archiveInfo) {
        String[] dataPermiList = getDataPermit();
        return archiveInfoMapper.beachSearch(archiveInfo, dataPermiList);
    }

    //获取档案信息数量
    @Override
    public int getDeleteCount(ArchiveInfo archiveInfo) {
        String[] dataPermiList = getDataPermit();
        if(archiveInfo.getSearchValue() != null && !archiveInfo.getSearchValue().isEmpty()){
            return archiveInfoMapper.delByQuerySearch(archiveInfo,dataPermiList);
        }else{
            return archiveInfoMapper.delArchiveInfo(archiveInfo,dataPermiList);
        }

    }


    @Override
    public List<ArchiveInfo> selectArchiveInfoByIds(List<Long> ids) {
        return archiveInfoMapper.selectArchiveInfoByIds(ids);
    }

    @Async("asyncSecurityTaskExecutor") // 标记为异步方法
    @Override
    public void updateArchiveNumber(ArchiveInfo archiveInfo) {
        try {
        redisCache.setCacheObject("updateArchiveNumber", String.valueOf(archiveInfo.getCategoryId()));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        SysUser currentUser = loginUser.getUser();
        String[] dataPermiList;
        if ("all".equals(currentUser.getDataPermi())) {
            dataPermiList = new String[0];
        } else {
            dataPermiList = (currentUser.getDataPermi().split(","));
            for (int i = 0; i < dataPermiList.length; i++) {
                dataPermiList[i] = "%" + dataPermiList[i] + "%";
            }
        }
            ArchiveRule archiveRule = new ArchiveRule();
            archiveRule.setCategoryId(archiveInfo.getCategoryId());
            List<ArchiveRule> ruleList = archiveRuleMapper.selectArchiveRuleList(archiveRule);
            if (ruleList.isEmpty()) {
                throw new ServiceException("档号规则不存在！");
            }
            ArchiveRule archiveRule1 = ruleList.get(0);
            // 定义需要获取的列
            List<String> columns = Arrays.asList(archiveRule1.getRuleItem().split(","));
            String[] rule = archiveRule1.getRuleJoin().split(",");
            String[] item = archiveRule1.getItemName().split(",");
            String[] count = archiveRule1.getNumberCount().split(",");
            List<ArchiveInfo> archiveInfoList = columns.stream()
                    .map(column -> archiveInfoMapper.getColumn(column, archiveInfo.getCategoryId()))
                    .collect(Collectors.toList());
            for (int i = 0; i < columns.size(); i++) {
                archiveInfoList.get(i).setField3("field" + (i + 1));
            }

            // 获取查询结果
            List<ArchiveInfo> resultList;
            if (archiveInfo.getSearchValue() != null && !archiveInfo.getSearchValue().isEmpty()) {
                resultList = archiveInfoMapper.getNumberByKeyword(
                        archiveInfoList,
                        archiveInfo.getSearchValue(),
                        archiveInfo.getCategoryId(),
                        archiveInfo.getArchiveStatus(),
                        dataPermiList
                );
            } else {
                resultList = archiveInfoMapper.getNumberBeachSearch(archiveInfoList, archiveInfo, dataPermiList);
            }
            if (resultList.isEmpty()) {
                redisCache.deleteObject("updateArchiveNumber");
            }
            // 更新档案编号
            resultList.forEach(archiveInfo1 -> {
                String newNumberStr = buildArchiveNumber(archiveInfoList, archiveInfo1, rule, item, count);
                archiveInfo1.setArchiveNumber(newNumberStr);
            });
            // 更新数据库中的档案编号
            int updateResult = archiveInfoMapper.updateArchiveNumber(resultList);
            redisCache.deleteObject("updateArchiveNumber");
        } catch (Exception e) {
            System.err.println("Error updating archive number: " + e.getMessage());
            throw new ServiceException("更新档号时发生错误");
        }
    }

    @Override
    public String getUpdateStatus() {
        String updateStatus = (String) redisCache.getCacheObject("updateArchiveNumber");
        return updateStatus;
    }

    private String buildArchiveNumber(List<ArchiveInfo> mapList, ArchiveInfo archiveInfo, String[] rule, String[] item, String[] count) {
        StringBuilder newNumberStrBuilder = new StringBuilder();
        for (int i = 0; i < rule.length; i++) {
            String fieldStr = String.valueOf(archiveInfo.getField(i + 1));
            String newNumber1 = getString(fieldStr, item[i],count[i]);
            newNumberStrBuilder.append(newNumber1).append(rule[i]);
        }
        return newNumberStrBuilder.toString();
    }

    private static String getString(String fieldStr, String item, String count) {
        if (Objects.equals(item, "1") && fieldStr.matches("\\d+")) { // 检查是否为纯数字
            int length = fieldStr.length();
            int countInt = Integer.parseInt(count);
            return length > countInt ? fieldStr.substring(length - countInt) : String.format("%0" + countInt + "d", Integer.parseInt(fieldStr));
        } else {
            return fieldStr; // 如果不是纯数字，则保持不变
        }
    }


    // 根据搜索条件获取需要归档的档案ID列表
    private List<Long> getIdsToArchive(ArchiveInfo archiveInfo, String[] dataPermiList) {
        if (archiveInfo.getSearchValue() != null && !archiveInfo.getSearchValue().isEmpty()) {
            return archiveInfoMapper.selectIdListByKeyword(
                    archiveInfo.getSearchValue(),
                    archiveInfo.getCategoryId(),
                    archiveInfo.getArchiveStatus(),
                    dataPermiList
            );
        } else {
            return archiveInfoMapper.selectIdList(archiveInfo, dataPermiList);
        }
    }

    public String[] getDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if("all".equals(currentUser.getDataPermi())){
            dataPermiList = new String[0];
        }else {
            dataPermiList = (currentUser.getDataPermi().split(","));
            for (int i = 0; i < dataPermiList.length; i++){
                dataPermiList[i] = "%" + dataPermiList[i] + "%";
            }
        }
        return dataPermiList;
    }

    // 构建PlaceonfileLog对象
    private PlaceonfileLog buildPlaceonfileLog(List<Long> ids, Long categoryId, Long oddNumbers, Date createTime) {
        PlaceonfileLog placeonfileLog = new PlaceonfileLog();
        placeonfileLog.setPlaceonfileInfo(Long.valueOf(ids.size()));
        placeonfileLog.setInfoId(ids.stream().map(String::valueOf).collect(Collectors.joining(",")));
        placeonfileLog.setOddNumbers(Long.valueOf(oddNumbers != null ? oddNumbers : new Date().getTime()));
        placeonfileLog.setCategoryId(Math.toIntExact(categoryId));
        placeonfileLog.setCreateTime(createTime != null ? createTime : DateUtils.getNowDate());
        return placeonfileLog;
    }

    private PlaceonfileLog buildPlaceonfileLog(List<Long> ids, Long categoryId) {
        return buildPlaceonfileLog(ids, categoryId, null, null);
    }
}

