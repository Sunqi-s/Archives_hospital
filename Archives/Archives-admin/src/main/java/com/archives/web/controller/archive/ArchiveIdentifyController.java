package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.archives.archive.domain.ArchiveInfo;
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
import com.archives.archive.domain.ArchiveIdentify;
import com.archives.archive.service.IArchiveIdentifyService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 鉴定记录Controller
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
@RestController
@RequestMapping("/archive/identify")
public class ArchiveIdentifyController extends BaseController
{
    @Autowired
    private IArchiveIdentifyService archiveIdentifyService;

    /**
     * 查询鉴定记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveIdentify archiveIdentify)
    {
        startPage();
        List<ArchiveIdentify> list = archiveIdentifyService.selectArchiveIdentifyList(archiveIdentify);
        return getDataTable(list);
    }

    /**
     * 导出鉴定记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:export')")
    @Log(title = "鉴定记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveIdentify archiveIdentify)
    {
        List<ArchiveIdentify> list = archiveIdentifyService.selectArchiveIdentifyList(archiveIdentify);
        ExcelUtil<ArchiveIdentify> util = new ExcelUtil<ArchiveIdentify>(ArchiveIdentify.class);
        util.exportExcel(response, list, "鉴定记录数据");
    }

    /**
     * 获取鉴定记录详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveIdentifyService.selectArchiveIdentifyById(id));
    }

    /**
     * 新增鉴定记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:add')")
    @Log(title = "鉴定记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<ArchiveInfo> archiveInfos)
    {
        return toAjax(archiveIdentifyService.insertArchiveIdentify(archiveInfos));
    }

    /**
     * 修改鉴定记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:edit')")
    @Log(title = "鉴定记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveIdentify archiveIdentify)
    {
        return toAjax(archiveIdentifyService.updateArchiveIdentify(archiveIdentify));
    }

    /**
     * 删除鉴定记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:identify:remove')")
    @Log(title = "鉴定记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        // 参数校验
        if (ids == null || ids.length == 0) {
            return AjaxResult.error("删除ID不能为空");
        }
        try {
            return toAjax(archiveIdentifyService.deleteArchiveIdentifyByIds(ids));
        }catch (Exception e) {
            logger.error("删除鉴定记录失败", e);
            return AjaxResult.error("删除失败：" + e.getMessage());
        }
    }
}
