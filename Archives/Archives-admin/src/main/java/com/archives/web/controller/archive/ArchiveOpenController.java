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
import com.archives.archive.domain.ArchiveOpen;
import com.archives.archive.service.IArchiveOpenService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 公开记录Controller
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
@RestController
@RequestMapping("/archive/open")
public class ArchiveOpenController extends BaseController
{
    @Autowired
    private IArchiveOpenService archiveOpenService;

    /**
     * 查询公开记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveOpen archiveOpen)
    {
        startPage();
        List<ArchiveOpen> list = archiveOpenService.selectArchiveOpenList(archiveOpen);
        return getDataTable(list);
    }

    /**
     * 导出公开记录列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:export')")
    @Log(title = "公开记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveOpen archiveOpen)
    {
        List<ArchiveOpen> list = archiveOpenService.selectArchiveOpenList(archiveOpen);
        ExcelUtil<ArchiveOpen> util = new ExcelUtil<ArchiveOpen>(ArchiveOpen.class);
        util.exportExcel(response, list, "公开记录数据");
    }

    /**
     * 获取公开记录详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveOpenService.selectArchiveOpenById(id));
    }

    /**
     * 新增公开记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:add')")
    @Log(title = "公开记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody List<ArchiveInfo> archiveInfos)
    {
        return toAjax(archiveOpenService.insertArchiveOpen(archiveInfos));
    }

    /**
     * 修改公开记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:edit')")
    @Log(title = "公开记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveOpen archiveOpen)
    {
        return toAjax(archiveOpenService.updateArchiveOpen(archiveOpen));
    }

    /**
     * 删除公开记录
     */
//    @PreAuthorize("@ss.hasPermi('archive:open:remove')")
    @Log(title = "公开记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        // 参数校验
        if (ids == null || ids.length == 0) {
            return AjaxResult.error("删除ID不能为空");
        }
        try {
            return toAjax(archiveOpenService.deleteArchiveOpenByIds(ids));
        }catch (Exception e){
            logger.error("删除公开记录失败", e);
            return AjaxResult.error("删除失败：" + e.getMessage());
        }
    }
}
