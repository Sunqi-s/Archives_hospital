package com.archives.archive.service.impl;

import java.util.List;
import com.archives.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveItemMapper;
import com.archives.archive.domain.ArchiveItem;
import com.archives.archive.service.IArchiveItemService;

/**
 * 档案信息模板Service业务层处理
 *
 * @author 高小川
 * @date 2024-07-06
 */
@Service
public class ArchiveItemServiceImpl implements IArchiveItemService
{
    @Autowired
    private ArchiveItemMapper archiveItemMapper;

    /**
     * 查询档案信息模板
     *
     * @param id 档案信息模板主键
     * @return 档案信息模板
     */
    @Override
    public ArchiveItem selectArchiveItemById(Long id)
    {
        return archiveItemMapper.selectArchiveItemById(id);
    }

    /**
     * 查询档案信息模板
     *
     * @param categoryId 档案分类id
     * @return 档案信息模板
     */
    @Override
    public List<ArchiveItem> selectArchiveItemListByCategoryId(Long categoryId) {
        return archiveItemMapper.selectArchiveItemListByCategoryId(categoryId);
    }

    /**
     * 查询档案信息模板列表
     *
     * @param archiveItem 档案信息模板
     * @return 档案信息模板
     */
    @Override
    public List<ArchiveItem> selectArchiveItemList(ArchiveItem archiveItem)
    {
        return archiveItemMapper.selectArchiveItemList(archiveItem);
    }

    /**
     * 新增档案信息模板
     *
     * @param archiveItem 档案信息模板
     * @return 结果
     */
    @Override
    public int insertArchiveItem(ArchiveItem archiveItem)
    {
        archiveItem.setCreateTime(DateUtils.getNowDate());
        return archiveItemMapper.insertArchiveItem(archiveItem);
    }

    /**
     * 修改档案信息模板
     *
     * @param archiveItems 档案信息模板
     * @return 结果
     */
    @Override
    public int updateArchiveItem(List<ArchiveItem> archiveItems)
    {

        //更新画面填写的项目
        for (ArchiveItem archiveItem : archiveItems) {
            // 更新每个archiveItem的逻辑
            archiveItem.setUpdateTime(DateUtils.getNowDate());
            archiveItemMapper.updateArchiveItem(archiveItem);
        }

        return 1;
    }

    /**
     * 批量删除档案信息模板
     *
     * @param ids 需要删除的档案信息模板主键
     * @return 结果
     */
    @Override
    public int deleteArchiveItemByIds(Long[] ids)
    {
        return archiveItemMapper.deleteArchiveItemByIds(ids);
    }

    /**
     * 删除档案信息模板信息
     *
     * @param id 档案信息模板主键
     * @return 结果
     */
    @Override
    public int deleteArchiveItemById(Long id)
    {
        return archiveItemMapper.deleteArchiveItemById(id);
    }
}
