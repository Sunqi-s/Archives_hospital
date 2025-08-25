package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveOpen;
import org.apache.ibatis.annotations.Param;

/**
 * 公开记录Mapper接口
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
public interface ArchiveOpenMapper
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
     * @param archiveOpen 公开记录
     * @return 结果
     */
    public int insertArchiveOpen(ArchiveOpen archiveOpen);

    /**
     * 修改公开记录
     *
     * @param archiveOpen 公开记录
     * @return 结果
     */
    public int updateArchiveOpen(ArchiveOpen archiveOpen);

    /**
     * 删除公开记录
     *
     * @param id 公开记录主键
     * @return 结果
     */
    public int deleteArchiveOpenById(Long id);

    /**
     * 批量删除公开记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveOpenByIds(Long[] ids);

    public int openArchiveInfo(@Param("id") Long id, @Param("newPermit") String newPermit);

    public Long[] selectArchiveIdByIds(@Param("ids") Long[] ids);
}
