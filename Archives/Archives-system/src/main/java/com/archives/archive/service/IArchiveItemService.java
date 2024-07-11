package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveItem;

/**
 * 档案信息模板Service接口
 *
 * @author 高小川
 * @date 2024-07-06
 */
public interface IArchiveItemService
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
     * 新增档案信息模板
     *
     * @param archiveItem 档案信息模板
     * @return 结果
     */
    public int insertArchiveItem(ArchiveItem archiveItem);

    /**
     * 修改档案信息模板
     *
     * @param archiveItem 档案信息模板
     * @return 结果
     */
    public int updateArchiveItem(List<ArchiveItem> archiveItems);

    /**
     * 批量删除档案信息模板
     *
     * @param ids 需要删除的档案信息模板主键集合
     * @return 结果
     */
    public int deleteArchiveItemByIds(Long[] ids);

    /**
     * 删除档案信息模板信息
     *
     * @param id 档案信息模板主键
     * @return 结果
     */
    public int deleteArchiveItemById(Long id);
}
