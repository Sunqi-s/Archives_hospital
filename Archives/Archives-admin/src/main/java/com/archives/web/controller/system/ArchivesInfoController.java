package com.archives.web.controller.system;

import com.archives.common.annotation.Log;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import com.archives.common.core.page.TableDataInfo;
import com.archives.common.enums.BusinessType;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.system.domain.ArchivesInfo;
import com.archives.system.service.IArchivesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 会计档案Controller
 *
 * @author archives
 * @date 2024-05-21
 */
@RestController
@RequestMapping("/system/info")
public class ArchivesInfoController extends BaseController
{
    @Autowired
    private IArchivesInfoService archivesInfoService;

    /**
     * 查询会计档案列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchivesInfo archivesInfo)
    {
        startPage();
        List<ArchivesInfo> list = archivesInfoService.selectArchivesInfoList(archivesInfo);
        return getDataTable(list);
    }

    /**
     * 导出会计档案列表
     */
    @PreAuthorize("@ss.hasPermi('system:info:export')")
    @Log(title = "会计档案", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchivesInfo archivesInfo)
    {
        List<ArchivesInfo> list = archivesInfoService.selectArchivesInfoList(archivesInfo);
        ExcelUtil<ArchivesInfo> util = new ExcelUtil<ArchivesInfo>(ArchivesInfo.class);
        util.exportExcel(response, list, "会计档案数据");
    }

    /**
     * 获取会计档案详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:info:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archivesInfoService.selectArchivesInfoById(id));
    }

    /**
     * 新增会计档案
     */
    @PreAuthorize("@ss.hasPermi('system:info:add')")
    @Log(title = "会计档案", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchivesInfo archivesInfo)
    {
        return toAjax(archivesInfoService.insertArchivesInfo(archivesInfo));
    }

    /**
     * 修改会计档案
     */
    @PreAuthorize("@ss.hasPermi('system:info:edit')")
    @Log(title = "会计档案", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchivesInfo archivesInfo)
    {
        return toAjax(archivesInfoService.updateArchivesInfo(archivesInfo));
    }

    /**
     * 删除会计档案
     */
    @PreAuthorize("@ss.hasPermi('system:info:remove')")
    @Log(title = "会计档案", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archivesInfoService.deleteArchivesInfoByIds(ids));
    }
}
