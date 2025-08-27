package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveRestorations;
import org.apache.ibatis.annotations.Param;

/**
 * 归还Mapper接口
 *
 * @author é«å°å·
 * @date 2025-08-26
 */
public interface ArchiveRestorationsMapper
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
     * @param archiveRestorations 归还
     * @return 结果
     */
    public int insertArchiveRestorations(ArchiveRestorations archiveRestorations);

    /**
     * 修改归还
     *
     * @param archiveRestorations 归还
     * @return 结果
     */
    public int updateArchiveRestorations(ArchiveRestorations archiveRestorations);

    /**
     * 删除归还
     *
     * @param id 归还主键
     * @return 结果
     */
    public int deleteArchiveRestorationsById(Long id);

    /**
     * 批量删除归还
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveRestorationsByIds(Long[] ids);

    public int batchInsertArchiveRestorations(@Param("archiveRestorations") List<ArchiveRestorations> archiveRestorations);
}
