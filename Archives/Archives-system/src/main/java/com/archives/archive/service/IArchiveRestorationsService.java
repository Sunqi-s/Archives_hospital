package com.archives.archive.service;

import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.ArchiveRestorations;

/**
 * 归还Service接口
 *
 * @author é«å°å·
 * @date 2025-08-26
 */
public interface IArchiveRestorationsService
{
    /**
     * 查询归还
     *
     * @param id 归还主键
     * @return 归还
     */
    public ArchiveRestorations selectArchiveRestorationsById(Long id);

    /**
     * 查询归还列表
     *
     * @param archiveRestorations 归还
     * @return 归还集合
     */
    public List<ArchiveRestorations> selectArchiveRestorationsList(ArchiveRestorations archiveRestorations);

    /**
     * 新增归还
     *
     * @param archiveInfos 归还
     * @return 结果
     */
    public int insertArchiveRestorations(List<ArchiveInfo> archiveInfos);

    /**
     * 修改归还
     *
     * @param archiveRestorations 归还
     * @return 结果
     */
    public int updateArchiveRestorations(ArchiveRestorations archiveRestorations);

    /**
     * 批量删除归还
     *
     * @param ids 需要删除的归还主键集合
     * @return 结果
     */
    public int deleteArchiveRestorationsByIds(Long[] ids);

    /**
     * 删除归还信息
     *
     * @param id 归还主键
     * @return 结果
     */
    public int deleteArchiveRestorationsById(Long id);
}
