package com.archives.archive.service.impl;

import java.util.List;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveImportLogMapper;
import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.service.IArchiveImportLogService;

/**
 * 数据导入日志Service业务层处理
 *
 * @author 孙
 * @date 2024-08-30
 */
@Service
public class ArchiveImportLogServiceImpl implements IArchiveImportLogService
{
    @Autowired
    private ArchiveImportLogMapper archiveImportLogMapper;

    /**
     * 查询数据导入日志
     *
     * @param id 数据导入日志主键
     * @return 数据导入日志
     */
    @Override
    public ArchiveImportLog selectArchiveImportLogById(Long id)
    {
        String dataPermit = selectSearchByDataPermit().toString();
        return archiveImportLogMapper.selectArchiveImportLogById(id);
    }

    /**
     * 查询数据导入日志列表
     *
     * @param archiveImportLog 数据导入日志
     * @return 数据导入日志
     */
    @Override
    public List<ArchiveImportLog> selectArchiveImportLogList(ArchiveImportLog archiveImportLog)
    {
        return archiveImportLogMapper.selectArchiveImportLogList(archiveImportLog);
    }

    /**
     * 新增数据导入日志
     *
     * @param archiveImportLog 数据导入日志
     * @return 结果
     */
    @Override
    public ArchiveImportLog insertArchiveImportLog(ArchiveImportLog archiveImportLog)
    {
        String dataPermit = selectSearchByDataPermit().toString();
        archiveImportLog.setCreateTime(DateUtils.getNowDate());
        archiveImportLog.setDataPermit(dataPermit);
        archiveImportLogMapper.insertArchiveImportLog(archiveImportLog);
        return archiveImportLog;
    }

    /**
     * 修改数据导入日志
     *
     * @param archiveImportLog 数据导入日志
     * @return 结果
     */
    @Override
    public int updateArchiveImportLog(ArchiveImportLog archiveImportLog)
    {
        archiveImportLog.setUpdateTime(DateUtils.getNowDate());
        return archiveImportLogMapper.updateArchiveImportLog(archiveImportLog);
    }

    /**
     * 批量删除数据导入日志
     *
     * @param ids 需要删除的数据导入日志主键
     * @return 结果
     */
    @Override
    public int deleteArchiveImportLogByIds(Long[] ids)
    {
        return archiveImportLogMapper.deleteArchiveImportLogByIds(ids);
    }

    /**
     * 删除数据导入日志信息
     *
     * @param id 数据导入日志主键
     * @return 结果
     */
    @Override
    public int deleteArchiveImportLogById(Long id)
    {
        return archiveImportLogMapper.deleteArchiveImportLogById(id);
    }

    public Long selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        Long dataPermit = currentUser.getDeptId();
        return dataPermit;
    }
}
