package com.archives.archive.service.impl;

import java.util.List;

import com.archives.common.core.redis.RedisCache;
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
    @Autowired
    private RedisCache redisCache;

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
        List<ArchiveItem> itemValues = redisCache.getCacheList(String.valueOf(categoryId));
        if(itemValues!=null && !itemValues.isEmpty()){
            return itemValues;
        }else {
            List<ArchiveItem> archiveItemList = archiveItemMapper.selectArchiveItemListByCategoryId(categoryId);
            redisCache.setCacheList(String.valueOf(categoryId),archiveItemList);
            return archiveItemList;
        }
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
        List<ArchiveItem> itemValue = redisCache.getCacheList("archives:item:value");
        if(itemValue!=null && !itemValue.isEmpty()){
            return itemValue;
        }else {
            List<ArchiveItem> archiveItemList = archiveItemMapper.selectArchiveItemList(archiveItem);
            redisCache.setCacheList("archives:item:value",archiveItemList);
            return archiveItemList;
        }
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
        Long categoryId = archiveItem.getCategoryId();
        redisCache.deleteObject(String.valueOf(categoryId));
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
        long categoryId = archiveItems.get(0).getCategoryId();
        redisCache.deleteObject(String.valueOf(categoryId));
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
