package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveIdentify;

/**
 * 鉴定记录Mapper接口
 * 
 * @author é«å°å·
 * @date 2025-08-05
 */
public interface ArchiveIdentifyMapper 
{
    /**
     * 查询鉴定记录
     * 
     * @param id 鉴定记录主键
     * @return 鉴定记录
     */
    public ArchiveIdentify selectArchiveIdentifyById(Long id);

    /**
     * 查询鉴定记录列表
     * 
     * @param archiveIdentify 鉴定记录
     * @return 鉴定记录集合
     */
    public List<ArchiveIdentify> selectArchiveIdentifyList(ArchiveIdentify archiveIdentify);

    /**
     * 新增鉴定记录
     * 
     * @param archiveIdentify 鉴定记录
     * @return 结果
     */
    public int insertArchiveIdentify(ArchiveIdentify archiveIdentify);

    /**
     * 修改鉴定记录
     * 
     * @param archiveIdentify 鉴定记录
     * @return 结果
     */
    public int updateArchiveIdentify(ArchiveIdentify archiveIdentify);

    /**
     * 删除鉴定记录
     * 
     * @param id 鉴定记录主键
     * @return 结果
     */
    public int deleteArchiveIdentifyById(Long id);

    /**
     * 批量删除鉴定记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveIdentifyByIds(Long[] ids);
}
