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
import com.archives.archive.domain.ArchiveCategory;
import com.archives.archive.service.IArchiveCategoryService;
import com.archives.common.utils.poi.ExcelUtil;

/**
 * 档案分类Controller
 *
 * @author 高小川
 * @date 2024-07-06
 */
@RestController
@RequestMapping("/archive/category")
public class ArchiveCategoryController extends BaseController
{
    @Autowired
    private IArchiveCategoryService archiveCategoryService;

    /**
     * 查询档案分类列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:list')")
    @GetMapping("/list")
    public AjaxResult list(ArchiveCategory archiveCategory)
    {
        List<ArchiveCategory> list = archiveCategoryService.selectArchiveCategoryList(archiveCategory);
        return success(list);
    }

    /**
     * 导出档案分类列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:export')")
    @Log(title = "档案分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveCategory archiveCategory)
    {
        List<ArchiveCategory> list = archiveCategoryService.selectArchiveCategoryList(archiveCategory);
        ExcelUtil<ArchiveCategory> util = new ExcelUtil<ArchiveCategory>(ArchiveCategory.class);
        util.exportExcel(response, list, "档案分类数据");
    }

    /**
     * 获取档案分类详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveCategoryService.selectArchiveCategoryById(id));
    }

    /**
     * 新增档案分类
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:add')")
    @Log(title = "档案分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveCategory archiveCategory)
    {
        return toAjax(archiveCategoryService.insertArchiveCategory(archiveCategory));
    }

    /**
     * 修改档案分类
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:edit')")
    @Log(title = "档案分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveCategory archiveCategory)
    {
        return toAjax(archiveCategoryService.updateArchiveCategory(archiveCategory));
    }

    /**
     * 删除档案分类
     */
//    @PreAuthorize("@ss.hasPermi('archive:category:remove')")
    @Log(title = "档案分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id)
    {
        return toAjax(archiveCategoryService.deleteArchiveCategoryById(id));
    }
}
