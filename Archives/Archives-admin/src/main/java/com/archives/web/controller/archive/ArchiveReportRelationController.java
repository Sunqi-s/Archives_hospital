package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.archives.archive.domain.ArchiveReportTemplates;
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
import com.archives.archive.domain.ArchiveReportRelation;
import com.archives.archive.service.IArchiveReportRelationService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 档案报表关系Controller
 *
 * @author é«å°å·
 * @date 2024-09-04
 */
@RestController
@RequestMapping("/archive/relation")
public class ArchiveReportRelationController extends BaseController
{
    @Autowired
    private IArchiveReportRelationService archiveReportRelationService;

    /**
     * 查询档案报表关系列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ArchiveReportRelation archiveReportRelation)
    {
        startPage();
        List<ArchiveReportRelation> list = archiveReportRelationService.selectArchiveReportRelationList(archiveReportRelation);
        return getDataTable(list);
    }

    /**
     * 导出档案报表关系列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:relation:export')")
    @Log(title = "档案报表关系", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveReportRelation archiveReportRelation)
    {
        List<ArchiveReportRelation> list = archiveReportRelationService.selectArchiveReportRelationList(archiveReportRelation);
        ExcelUtil<ArchiveReportRelation> util = new ExcelUtil<ArchiveReportRelation>(ArchiveReportRelation.class);
        util.exportExcel(response, list, "档案报表关系数据");
    }

    /**
     * 获取档案报表关系详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveReportRelationService.selectArchiveReportRelationById(id));
    }

    /**
     * 新增档案报表关系
     */
//    @PreAuthorize("@ss.hasPermi('archive:relation:add')")
    @Log(title = "档案报表关系", businessType = BusinessType.INSERT)
    @PostMapping
    public int add(@RequestBody ArchiveReportRelation archiveReportRelation)
    {
        return (archiveReportRelationService.insertArchiveReportRelation(archiveReportRelation));
    }

    /**
     * 修改档案报表关系
     */
//    @PreAuthorize("@ss.hasPermi('archive:relation:edit')")
    @Log(title = "档案报表关系", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveReportRelation archiveReportRelation)
    {
        return toAjax(archiveReportRelationService.updateArchiveReportRelation(archiveReportRelation));
    }

    /**
     * 删除档案报表关系
     */
//    @PreAuthorize("@ss.hasPermi('archive:relation:remove')")
    @Log(title = "档案报表关系", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveReportRelationService.deleteArchiveReportRelationByIds(ids));
    }

    /**
     * 查询档案报表关系列表
     */
    @GetMapping("/pointByCategoryId/{categoryId}")
    public ArchiveReportTemplates archiveReportRelationByCategoryId (@PathVariable Long categoryId)
    {
        ArchiveReportTemplates archiveReportRelation = archiveReportRelationService.selectArchiveReportRelationByCategoryId(categoryId);
        return archiveReportRelation;
    }


}
