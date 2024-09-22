package com.archives.archive.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

import com.archives.common.exception.ServiceException;
import com.archives.common.utils.DateUtils;
import com.archives.system.domain.SysOss;
import com.archives.system.mapper.SysOssMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.service.IArchiveInfoService;

import java.util.concurrent.CompletableFuture;
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
    private final ExecutorService executorService = Executors.newFixedThreadPool(10); // 创建一个固定大小的线程池

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
        String searchValue = archiveInfo.getSearchValue();
        if (searchValue != null && !searchValue.isEmpty()) {
            return archiveInfoMapper.selectArchiveInfoListByKeyword(searchValue);
        }
        return archiveInfoMapper.selectArchiveInfoList(archiveInfo);

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
        System.out.println("originalFileIds: " + originalFileIds);

        // 将新附件列表转换为附件ID的集合
        Set<Long> newFileIds = newSysOssList.stream()
                .map(SysOss::getId)
                .collect(Collectors.toSet());
        System.out.println("newFileIds: " + newFileIds);
        // 找出需要删除的附件ID
        Set<Long> idsToDelete = new HashSet<>(originalFileIds);
        idsToDelete.removeAll(newFileIds);
        System.out.println("idsToDelete: " + idsToDelete);

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
        // 更新归档信息
        return archiveInfoMapper.updateArchiveInfo(archiveInfo);
    }

    @Override
    public int updateArchiveStatusByIds(Long[] ids) {
        return archiveInfoMapper.updateArchiveStatusByIds(ids);
    }

    @Override
    public int updateArchiveStatusById(Long id) {
        return archiveInfoMapper.updateArchiveStatusById(id);
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
        return CompletableFuture.supplyAsync(() -> {
            if (archiveInfoList == null || archiveInfoList.isEmpty()) {
                throw new ServiceException("导入用户数据不能为空！");
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
    public int sendArchiveInfo(Long[] ids) {
        return archiveInfoMapper.sendArchiveInfo(ids);
    }
}

