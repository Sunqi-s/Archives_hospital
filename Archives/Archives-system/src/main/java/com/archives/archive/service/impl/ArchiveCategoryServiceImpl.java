package com.archives.archive.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import com.archives.archive.domain.ArchiveItem;
import com.archives.archive.mapper.ArchiveItemMapper;
import com.archives.archive.service.IArchiveItemService;
import com.archives.archive.util.ArchiveUtils;
import com.archives.common.constant.ArchiveConstants;
import com.archives.common.core.redis.RedisCache;
import com.archives.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveCategoryMapper;
import com.archives.archive.domain.ArchiveCategory;
import com.archives.archive.service.IArchiveCategoryService;

/**
 * 档案分类Service业务层处理
 *
 * @作者 高小川
 * @日期 2024-07-06
 */
@Service
public class ArchiveCategoryServiceImpl implements IArchiveCategoryService {
    @Autowired
    private ArchiveCategoryMapper archiveCategoryMapper;

    @Autowired
    private ArchiveItemMapper archiveItemMapper;

    @Autowired
    private RedisCache redisCache;
    /**
     * 查询档案分类
     *
     * @param id 档案分类主键
     * @return 档案分类
     */
    @Override
    public ArchiveCategory selectArchiveCategoryById(Long id) {
        return archiveCategoryMapper.selectArchiveCategoryById(id);
    }

    /**
     * 查询档案分类列表
     *
     * @param archiveCategory 档案分类
     * @return 档案分类列表
     */
    @Override
    public List<ArchiveCategory> selectArchiveCategoryList(ArchiveCategory archiveCategory) {
        List<ArchiveCategory> categoryValue = redisCache.getCacheList("hospital:category:value");
        if(categoryValue!= null &&!categoryValue.isEmpty()){
            return categoryValue;
        }else {
            List<ArchiveCategory> categoryList = archiveCategoryMapper.selectArchiveCategoryList(archiveCategory);
            redisCache.setCacheList("hospital:category:value", categoryList);
            return categoryList;
        }
    }

    /**
     * 新增档案分类
     *
     * @param archiveCategory 档案分类
     * @return 结果
     */
    @Override
    public int insertArchiveCategory(ArchiveCategory archiveCategory) {
        // 设置创建时间
        archiveCategory.setCreateTime(DateUtils.getNowDate());
        int insertcnt = archiveCategoryMapper.insertArchiveCategory(archiveCategory);

        // 如果档案类型是"档案库"，插入档案项目信息
        if (ArchiveConstants.ARCHIVE_TYPE_LIBRARY.equals(archiveCategory.getType())) {
            insertArchiveItemsForCategory(archiveCategory);
        }
        redisCache.deleteObject("hospital:category:value");

        return insertcnt;
    }

    /**
     * 修改档案分类
     *
     * @param archiveCategory 档案分类
     * @return 结果
     */
    @Override
    public int updateArchiveCategory(ArchiveCategory archiveCategory) {
        // 设置更新时间
        archiveCategory.setUpdateTime(DateUtils.getNowDate());

        // 判断档案类型
        if (ArchiveConstants.ARCHIVE_TYPE_LIBRARY.equals(archiveCategory.getType())) {
            List<ArchiveItem>  archiveItemList = archiveItemMapper.selectArchiveItemListByCategoryId(archiveCategory.getId());
            if(archiveItemList == null || archiveItemList.size()==0) {
                // 如果档案类型是"档案库"，插入档案项目信息
                insertArchiveItemsForCategory(archiveCategory);
            }
        } else {
            // 如果档案类型是"档案节点"，删除档案项目信息
            deleteArchiveItemsForCategory(archiveCategory);
        }
        redisCache.deleteObject("hospital:category:value");

        return archiveCategoryMapper.updateArchiveCategory(archiveCategory);
    }

    /**
     * 批量删除档案分类
     *
     * @param ids 需要删除的档案分类主键
     * @return 结果
     */
    @Override
    public int deleteArchiveCategoryByIds(Long[] ids) {
        return archiveCategoryMapper.deleteArchiveCategoryByIds(ids);
    }

    /**
     * 删除档案分类信息
     *
     * @param id 档案分类主键
     * @return 结果
     */
    @Override
    public int deleteArchiveCategoryById(Long id) {
        redisCache.deleteObject("hospital:category:value");
        ArchiveCategory archiveCategory = archiveCategoryMapper.selectArchiveCategoryById(id);

        // 如果档案类型不是"档案库"，删除档案项目信息
        if (ArchiveConstants.ARCHIVE_TYPE_LIBRARY.equals(archiveCategory.getType())) {
            deleteArchiveItemsForCategory(archiveCategory);
        }

        return archiveCategoryMapper.deleteArchiveCategoryById(id);
    }

    /**
     * 插入档案项目信息
     */
    private void insertArchiveItemsForCategory(ArchiveCategory archiveCategory) {
        Long categoryId = archiveCategory.getId();
        List<ArchiveItem> archiveTableColumns = archiveItemMapper.selectDbTableColumnsForArchiveInfo();

        if (!archiveTableColumns.isEmpty()) {
            archiveTableColumns.forEach(column -> {
                column.setCategoryId(archiveCategory.getId());
                ArchiveUtils.initColumnField(column);
            });
            archiveItemMapper.insertArchiveItemsBatch(archiveTableColumns);
        }
        List value =redisCache.getCacheList("hospital:item:"+categoryId);
        if(value!=null&&!value.isEmpty()){
            redisCache.deleteObject("hospital:item:"+categoryId);
        }
    }

    /**
     * 删除档案项目信息
     */
    private void deleteArchiveItemsForCategory(ArchiveCategory archiveCategory) {
        Long categoryId = archiveCategory.getId();
        List<ArchiveItem> archiveItems = archiveItemMapper.selectArchiveItemListByCategoryId(archiveCategory.getId());

        if (archiveItems != null && !archiveItems.isEmpty()) {
            Long[] itemIds = archiveItems.stream().map(ArchiveItem::getId).toArray(Long[]::new);
            archiveItemMapper.deleteArchiveItemByIds(itemIds);
        }
        redisCache.deleteObject("hospital:item:"+categoryId);
        redisCache.deleteObject("hospital:category:value");
    }
}
