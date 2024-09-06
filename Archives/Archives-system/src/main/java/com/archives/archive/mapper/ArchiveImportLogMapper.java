package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveImportLog;

/**
 * 数据导入日志Mapper接口
 * 
 * @author 孙
 * @date 2024-08-30
 */
public interface ArchiveImportLogMapper 
{
    /**
     * 查询数据导入日志
     * 
     * @param id 数据导入日志主键
     * @return 数据导入日志
     */
    public ArchiveImportLog selectArchiveImportLogById(Long id);

    /**
     * 查询数据导入日志列表
     * 
     * @param archiveImportLog 数据导入日志
     * @return 数据导入日志集合
     */
    public List<ArchiveImportLog> selectArchiveImportLogList(ArchiveImportLog archiveImportLog);

    /**
     * 新增数据导入日志
     * 
     * @param archiveImportLog 数据导入日志
     * @return 结果
     */
    public int insertArchiveImportLog(ArchiveImportLog archiveImportLog);

    /**
     * 修改数据导入日志
     * 
     * @param archiveImportLog 数据导入日志
     * @return 结果
     */
    public int updateArchiveImportLog(ArchiveImportLog archiveImportLog);

    /**
     * 删除数据导入日志
     * 
     * @param id 数据导入日志主键
     * @return 结果
     */
    public int deleteArchiveImportLogById(Long id);

    /**
     * 批量删除数据导入日志
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveImportLogByIds(Long[] ids);
}
