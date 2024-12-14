package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.CategoryFit;

/**
 * 所属字段设置Service接口
 * 
 * @author é«å°å·
 * @date 2024-12-14
 */
public interface ICategoryFitService 
{
    /**
     * 查询所属字段设置
     * 
     * @param id 所属字段设置主键
     * @return 所属字段设置
     */
    public CategoryFit selectCategoryFitById(Long id);

    /**
     * 查询所属字段设置列表
     * 
     * @param categoryFit 所属字段设置
     * @return 所属字段设置集合
     */
    public List<CategoryFit> selectCategoryFitList(CategoryFit categoryFit);

    /**
     * 新增所属字段设置
     * 
     * @param categoryFit 所属字段设置
     * @return 结果
     */
    public int insertCategoryFit(CategoryFit categoryFit);

    /**
     * 修改所属字段设置
     * 
     * @param categoryFit 所属字段设置
     * @return 结果
     */
    public int updateCategoryFit(CategoryFit categoryFit);

    /**
     * 批量删除所属字段设置
     * 
     * @param ids 需要删除的所属字段设置主键集合
     * @return 结果
     */
    public int deleteCategoryFitByIds(Long[] ids);

    /**
     * 删除所属字段设置信息
     * 
     * @param id 所属字段设置主键
     * @return 结果
     */
    public int deleteCategoryFitById(Long id);
}
