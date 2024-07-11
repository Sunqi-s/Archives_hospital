package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveCategory;

/**
 * 档案分类Service接口
 * 
 * @author 高小川
 * @date 2024-07-06
 */
public interface IArchiveCategoryService 
{
    /**
     * 查询档案分类
     * 
     * @param id 档案分类主键
     * @return 档案分类
     */
    public ArchiveCategory selectArchiveCategoryById(Long id);

    /**
     * 查询档案分类列表
     * 
     * @param archiveCategory 档案分类
     * @return 档案分类集合
     */
    public List<ArchiveCategory> selectArchiveCategoryList(ArchiveCategory archiveCategory);

    /**
     * 新增档案分类
     * 
     * @param archiveCategory 档案分类
     * @return 结果
     */
    public int insertArchiveCategory(ArchiveCategory archiveCategory);

    /**
     * 修改档案分类
     * 
     * @param archiveCategory 档案分类
     * @return 结果
     */
    public int updateArchiveCategory(ArchiveCategory archiveCategory);

    /**
     * 批量删除档案分类
     * 
     * @param ids 需要删除的档案分类主键集合
     * @return 结果
     */
    public int deleteArchiveCategoryByIds(Long[] ids);

    /**
     * 删除档案分类信息
     * 
     * @param id 档案分类主键
     * @return 结果
     */
    public int deleteArchiveCategoryById(Long id);
}
