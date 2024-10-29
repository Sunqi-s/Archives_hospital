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
import com.archives.archive.domain.ArchiveReportTemplates;
import com.archives.archive.service.IArchiveReportTemplatesService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 报表设计Controller
 *
 * @author 高小川
 * @date 2024-07-03
 */
@RestController
@RequestMapping("/archive/rpttemplates")
public class ArchiveReportTemplatesController extends BaseController
{
    @Autowired
    private IArchiveReportTemplatesService archiveReportTemplatesService;

    /**
     * 查询报表设计列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveReportTemplates archiveReportTemplates)
    {
        startPage();
        List<ArchiveReportTemplates> list = archiveReportTemplatesService.selectArchiveReportTemplatesList(archiveReportTemplates);
        return getDataTable(list);
    }

    /**
     * 导出报表设计列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:export')")
    @Log(title = "报表设计", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveReportTemplates archiveReportTemplates)
    {
        List<ArchiveReportTemplates> list = archiveReportTemplatesService.selectArchiveReportTemplatesList(archiveReportTemplates);
        ExcelUtil<ArchiveReportTemplates> util = new ExcelUtil<ArchiveReportTemplates>(ArchiveReportTemplates.class);
        util.exportExcel(response, list, "报表设计数据");
    }

    /**
     * 获取报表设计详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveReportTemplatesService.selectArchiveReportTemplatesById(id));
    }

    /**
     * 新增报表设计
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:add')")
    @Log(title = "报表设计", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveReportTemplates archiveReportTemplates)
    {
        return toAjax(archiveReportTemplatesService.insertArchiveReportTemplates(archiveReportTemplates));
    }

    /**
     * 修改报表设计
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:edit')")
    @Log(title = "报表设计", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveReportTemplates archiveReportTemplates)
    {
        return toAjax(archiveReportTemplatesService.updateArchiveReportTemplates(archiveReportTemplates));
    }

    /**
     * 删除报表设计
     */
//    @PreAuthorize("@ss.hasPermi('archive:rpttemplates:remove')")
    @Log(title = "报表设计", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveReportTemplatesService.deleteArchiveReportTemplatesByIds(ids));
    }
}
