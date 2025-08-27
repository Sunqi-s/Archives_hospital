package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.archives.archive.domain.ArchiveInfo;
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
import com.archives.archive.domain.ArchiveRestorations;
import com.archives.archive.service.IArchiveRestorationsService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 归还Controller
 *
 * @author é«å°å·
 * @date 2025-08-26
 */
@RestController
@RequestMapping("/archive/restorations")
public class ArchiveRestorationsController extends BaseController
{
    @Autowired
    private IArchiveRestorationsService archiveRestorationsService;

    /**
     * 查询归还列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveRestorations archiveRestorations)
    {
        startPage();
        List<ArchiveRestorations> list = archiveRestorationsService.selectArchiveRestorationsList(archiveRestorations);
        return getDataTable(list);
    }

    /**
     * 导出归还列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:export')")
    @Log(title = "归还", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveRestorations archiveRestorations)
    {
        List<ArchiveRestorations> list = archiveRestorationsService.selectArchiveRestorationsList(archiveRestorations);
        ExcelUtil<ArchiveRestorations> util = new ExcelUtil<ArchiveRestorations>(ArchiveRestorations.class);
        util.exportExcel(response, list, "归还数据");
    }

    /**
     * 获取归还详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveRestorationsService.selectArchiveRestorationsById(id));
    }

    /**
     * 新增归还
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:add')")
    @Log(title = "归还", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<ArchiveInfo> archiveInfos)
    {
        return toAjax(archiveRestorationsService.insertArchiveRestorations(archiveInfos));
    }

    /**
     * 修改归还
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:edit')")
    @Log(title = "归还", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveRestorations archiveRestorations)
    {
        return toAjax(archiveRestorationsService.updateArchiveRestorations(archiveRestorations));
    }

    /**
     * 删除归还
     */
//    @PreAuthorize("@ss.hasPermi('archive:restorations:remove')")
    @Log(title = "归还", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveRestorationsService.deleteArchiveRestorationsByIds(ids));
    }
}
