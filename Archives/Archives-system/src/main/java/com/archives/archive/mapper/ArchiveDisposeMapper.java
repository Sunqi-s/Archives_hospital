package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveDispose;

/**
 * 处置记录Mapper接口
 *
 * @author é«å°å·
 * @date 2025-08-04
 */
public interface ArchiveDisposeMapper
{
    /**
     * 查询处置记录
     *
     * @param id 处置记录主键
     * @return 处置记录
     */
    public ArchiveDispose selectArchiveDisposeById(Long id);

    /**
     * 查询处置记录列表
     *
     * @param archiveDispose 处置记录
     * @return 处置记录集合
     */
    public List<ArchiveDispose> selectArchiveDisposeList(ArchiveDispose archiveDispose);

    /**
     * 新增处置记录
     *
     * @param archiveDispose 处置记录
     * @return 结果
     */
    public int insertArchiveDispose(ArchiveDispose archiveDispose);

    /**
     * 修改处置记录
     *
     * @param archiveDispose 处置记录
     * @return 结果
     */
    public int updateArchiveDispose(ArchiveDispose archiveDispose);

    /**
     * 删除处置记录
     *
     * @param id 处置记录主键
     * @return 结果
     */
    public int deleteArchiveDisposeById(Long id);

    /**
     * 批量删除处置记录
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveDisposeByIds(Long[] ids);

    public int insertArchiveDisposeBatch(List<ArchiveDispose> archiveDisposes);
}
