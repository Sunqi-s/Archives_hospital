package com.archives.archive.service.impl;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.PlaceonfileLogMapper;
import com.archives.archive.domain.PlaceonfileLog;
import com.archives.archive.service.IPlaceonfileLogService;

/**
 * placeonlogService业务层处理
 *
 * @author unknow
 * @date 2024-12-27
 */
@Service
public class PlaceonfileLogServiceImpl implements IPlaceonfileLogService
{
    @Autowired
    private PlaceonfileLogMapper placeonfileLogMapper;

    /**
     * 查询placeonlog
     *
     * @param placeonfileId placeonlog主键
     * @return placeonlog
     */
    @Override
    public PlaceonfileLog selectPlaceonfileLogByPlaceonfileId(Long placeonfileId)
    {
        return placeonfileLogMapper.selectPlaceonfileLogByPlaceonfileId(placeonfileId);
    }

    /**
     * 查询placeonlog列表
     *
     * @param placeonfileLog placeonlog
     * @return placeonlog
     */
    @Override
    public List<PlaceonfileLog> selectPlaceonfileLogList(PlaceonfileLog placeonfileLog) {
        String[] dataPermiList = selectSearchByDataPermit();
        Date createTime = placeonfileLog.getCreateTime();
        if (placeonfileLog.getCreateTime() != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy-MM-dd HH:mm:ss");
            String formattedDate = formatter.format(LocalDateTime.ofInstant(createTime.toInstant(), ZoneId.systemDefault()));

            // 设置格式化后的日期字符串回到 placeonfileLog 中
            placeonfileLog.setFormatCreateTime(formattedDate);
        }
        return placeonfileLogMapper.selectPlaceonfileLogList(placeonfileLog, dataPermiList);
    }

    /**
     * 新增placeonlog
     *
     * @param placeonfileLog placeonlog
     * @return 结果
     */
    @Override
    public int insertPlaceonfileLog(PlaceonfileLog placeonfileLog) {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        placeonfileLog.setPlaceonfileBy(currentUser.getNickName());
        placeonfileLog.setDataPermit(String.valueOf(currentUser.getDeptId()));
        return placeonfileLogMapper.insertPlaceonfileLog(placeonfileLog);
    }

    /**
     * 修改placeonlog
     *
     * @param placeonfileLog placeonlog
     * @return 结果
     */
    @Override
    public int updatePlaceonfileLog(PlaceonfileLog placeonfileLog)
    {
        placeonfileLog.setUpdateTime(DateUtils.getNowDate());
        return placeonfileLogMapper.updatePlaceonfileLog(placeonfileLog);
    }

    /**
     * 批量删除placeonlog
     *
     * @param placeonfileIds 需要删除的placeonlog主键
     * @return 结果
     */
    @Override
    public int deletePlaceonfileLogByPlaceonfileIds(Long[] placeonfileIds)
    {
        return placeonfileLogMapper.deletePlaceonfileLogByPlaceonfileIds(placeonfileIds);
    }

    /**
     * 删除placeonlog信息
     *
     * @param placeonfileId placeonlog主键
     * @return 结果
     */
    @Override
    public int deletePlaceonfileLogByPlaceonfileId(Long placeonfileId)
    {
        return placeonfileLogMapper.deletePlaceonfileLogByPlaceonfileId(placeonfileId);
    }

    @Override
    public List<String> selectPlaceonfileLogByOddNumbers(Long oddNumbers) {
        String[] dataPermiList = selectSearchByDataPermit();
        return placeonfileLogMapper.getIdByOddNumbers(oddNumbers, dataPermiList);
    }

    public String[] selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if ("all".equals(currentUser.getDataPermi())) {
            dataPermiList = new String[0];
        } else {
            dataPermiList = (currentUser.getDataPermi().split(","));
        }
        return dataPermiList;
    }
}
