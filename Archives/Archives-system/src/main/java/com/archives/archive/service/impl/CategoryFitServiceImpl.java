package com.archives.archive.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.CategoryFitMapper;
import com.archives.archive.domain.CategoryFit;
import com.archives.archive.service.ICategoryFitService;

/**
 * 所属字段设置Service业务层处理
 * 
 * @author é«å°å·
 * @date 2024-12-14
 */
@Service
public class CategoryFitServiceImpl implements ICategoryFitService 
{
    @Autowired
    private CategoryFitMapper categoryFitMapper;

    /**
     * 查询所属字段设置
     * 
     * @param id 所属字段设置主键
     * @return 所属字段设置
     */
    @Override
    public CategoryFit selectCategoryFitById(Long id)
    {
        return categoryFitMapper.selectCategoryFitById(id);
    }

    /**
     * 查询所属字段设置列表
     * 
     * @param categoryFit 所属字段设置
     * @return 所属字段设置
     */
    @Override
    public List<CategoryFit> selectCategoryFitList(CategoryFit categoryFit)
    {
        return categoryFitMapper.selectCategoryFitList(categoryFit);
    }

    /**
     * 新增所属字段设置
     * 
     * @param categoryFit 所属字段设置
     * @return 结果
     */
    @Override
    public int insertCategoryFit(CategoryFit categoryFit)
    {
        return categoryFitMapper.insertCategoryFit(categoryFit);
    }

    /**
     * 修改所属字段设置
     * 
     * @param categoryFit 所属字段设置
     * @return 结果
     */
    @Override
    public int updateCategoryFit(CategoryFit categoryFit)
    {
        return categoryFitMapper.updateCategoryFit(categoryFit);
    }

    /**
     * 批量删除所属字段设置
     * 
     * @param ids 需要删除的所属字段设置主键
     * @return 结果
     */
    @Override
    public int deleteCategoryFitByIds(Long[] ids)
    {
        return categoryFitMapper.deleteCategoryFitByIds(ids);
    }

    /**
     * 删除所属字段设置信息
     * 
     * @param id 所属字段设置主键
     * @return 结果
     */
    @Override
    public int deleteCategoryFitById(Long id)
    {
        return categoryFitMapper.deleteCategoryFitById(id);
    }
}
