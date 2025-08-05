package com.archives.archive.service;

import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.ArchiveOpen;

/**
 * 公开记录Service接口
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
public interface IArchiveOpenService
{
    /**
     * 查询公开记录
     *
     * @param id 公开记录主键
     * @return 公开记录
     */
    public ArchiveOpen selectArchiveOpenById(Long id);

    /**
     * 查询公开记录列表
     *
     * @param archiveOpen 公开记录
     * @return 公开记录集合
     */
    public List<ArchiveOpen> selectArchiveOpenList(ArchiveOpen archiveOpen);

    /**
     * 新增公开记录
     *
     * @param archiveInfos 公开记录
     * @return 结果
     */
    public int insertArchiveOpen(List<ArchiveInfo> archiveInfos);

    /**
     * 修改公开记录
     *
     * @param archiveOpen 公开记录
     * @return 结果
     */
    public int updateArchiveOpen(ArchiveOpen archiveOpen);

    /**
     * 批量删除公开记录
     *
     * @param ids 需要删除的公开记录主键集合
     * @return 结果
     */
    public int deleteArchiveOpenByIds(Long[] ids);

    /**
     * 删除公开记录信息
     *
     * @param id 公开记录主键
     * @return 结果
     */
    public int deleteArchiveOpenById(Long id);
}
