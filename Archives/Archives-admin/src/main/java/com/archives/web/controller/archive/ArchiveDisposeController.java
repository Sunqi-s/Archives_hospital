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
import com.archives.archive.domain.ArchiveDispose;
import com.archives.archive.service.IArchiveDisposeService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 处置记录Controller
 *
 * @author é«å°å·
 * @date 2025-08-04
 */
@RestController
@RequestMapping("/archive/dispose")
public class ArchiveDisposeController extends BaseController
{
    @Autowired
    private IArchiveDisposeService archiveDisposeService;

    /**
     * 查询处置记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveDispose archiveDispose)
    {
        startPage();
        List<ArchiveDispose> list = archiveDisposeService.selectArchiveDisposeList(archiveDispose);
        return getDataTable(list);
    }

    /**
     * 导出处置记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:export')")
    @Log(title = "处置记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveDispose archiveDispose)
    {
        List<ArchiveDispose> list = archiveDisposeService.selectArchiveDisposeList(archiveDispose);
        ExcelUtil<ArchiveDispose> util = new ExcelUtil<ArchiveDispose>(ArchiveDispose.class);
        util.exportExcel(response, list, "处置记录数据");
    }

    /**
     * 获取处置记录详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveDisposeService.selectArchiveDisposeById(id));
    }

    /**
     * 新增处置记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:add')")
    @Log(title = "处置记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<ArchiveInfo> archiveInfos)
    {
        return toAjax(archiveDisposeService.insertArchiveDispose(archiveInfos));
    }

    /**
     * 修改处置记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:edit')")
    @Log(title = "处置记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveDispose archiveDispose)
    {
        return toAjax(archiveDisposeService.updateArchiveDispose(archiveDispose));
    }

    /**
     * 删除处置记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:dispose:remove')")
    @Log(title = "处置记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveDisposeService.deleteArchiveDisposeByIds(ids));
    }
}
