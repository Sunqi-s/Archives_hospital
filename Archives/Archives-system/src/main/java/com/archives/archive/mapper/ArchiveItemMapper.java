package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveItem;
import org.apache.ibatis.annotations.Param;

/**
 * 档案信息模板Mapper接口
 *
 * @author 高小川
 * @date 2024-07-06
 */
public interface ArchiveItemMapper
{
    /**
     * 查询档案信息模板
     *
     * @param id 档案信息模板主键
     * @return 档案信息模板
     */
    public ArchiveItem selectArchiveItemById(Long id);

    /**
     * 查询档案信息模板
     *
     * @param categoryId 档案分类id
     * @return 档案信息模板
     */
    public List<ArchiveItem> selectArchiveItemListByCategoryId(Long categoryId);

    /**
     * 查询档案信息模板列表
     *
     * @param archiveItem 档案信息模板
     * @return 档案信息模板集合
     */
    public List<ArchiveItem> selectArchiveItemList(ArchiveItem archiveItem);


    /**
     * 查询档案信息表的列信息
     *
     * @return 表的列信息
     */
    public List<ArchiveItem> selectDbTableColumnsForArchiveInfo();

    /**
     * 新增档案信息模板
     *
     * @param archiveItem 档案信息模板
     * @return 结果
     */
    public int insertArchiveItem(ArchiveItem archiveItem);


    /**
     * 批量插入档案信息模板
     *
     * @param archiveItems 档案信息模板集合
     * @return 影响的行数
     */
    int insertArchiveItemsBatch(@Param("list") List<ArchiveItem> archiveItems);

    /**
     * 修改档案信息模板
     *
     * @param archiveItem 档案信息模板
     * @return 结果
     */
    public int updateArchiveItem(ArchiveItem archiveItem);

    /**
     * 删除档案信息模板
     *
     * @param id 档案信息模板主键
     * @return 结果
     */
    public int deleteArchiveItemById(Long id);

    /**
     * 批量删除档案信息模板
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveItemByIds(Long[] ids);
}
