package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.archives.common.annotation.Log;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import com.archives.common.enums.BusinessType;
import com.archives.archive.domain.CategoryFit;
import com.archives.archive.service.ICategoryFitService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 所属字段设置Controller
 * 
 * @author é«å°å·
 * @date 2024-12-14
 */
@RestController
@RequestMapping("/categoryFit/fit")
public class CategoryFitController extends BaseController
{
    @Autowired
    private ICategoryFitService categoryFitService;

    /**
     * 查询所属字段设置列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:list')")
    @GetMapping("/list")
    public TableDataInfo list(CategoryFit categoryFit)
    {
        startPage();
        List<CategoryFit> list = categoryFitService.selectCategoryFitList(categoryFit);
        return getDataTable(list);
    }

    /**
     * 导出所属字段设置列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:export')")
    @Log(title = "所属字段设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CategoryFit categoryFit)
    {
        List<CategoryFit> list = categoryFitService.selectCategoryFitList(categoryFit);
        ExcelUtil<CategoryFit> util = new ExcelUtil<CategoryFit>(CategoryFit.class);
        util.exportExcel(response, list, "所属字段设置数据");
    }

    /**
     * 获取所属字段设置详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(categoryFitService.selectCategoryFitById(id));
    }

    /**
     * 新增所属字段设置
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:add')")
    @Log(title = "所属字段设置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CategoryFit categoryFit)
    {
        return toAjax(categoryFitService.insertCategoryFit(categoryFit));
    }

    /**
     * 修改所属字段设置
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:edit')")
    @Log(title = "所属字段设置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CategoryFit categoryFit)
    {
        return toAjax(categoryFitService.updateCategoryFit(categoryFit));
    }

    /**
     * 删除所属字段设置
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:remove')")
    @Log(title = "所属字段设置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(categoryFitService.deleteCategoryFitByIds(ids));
    }
}
