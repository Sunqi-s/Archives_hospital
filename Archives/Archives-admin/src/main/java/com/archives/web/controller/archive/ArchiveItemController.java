package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.archives.generator.domain.GenTableColumn;
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
import com.archives.archive.domain.ArchiveItem;
import com.archives.archive.service.IArchiveItemService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 档案信息模板Controller
 *
 * @author 高小川
 * @date 2024-07-06
 */
@RestController
@RequestMapping("/archive/item")
public class ArchiveItemController extends BaseController
{
    @Autowired
    private IArchiveItemService archiveItemService;

    /**
     * 查询档案信息模板列表
     */
    @PreAuthorize("@ss.hasPermi('archive:item:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveItem archiveItem)
    {
        startPage();
        List<ArchiveItem> list = archiveItemService.selectArchiveItemList(archiveItem);
        return getDataTable(list);
    }

    /**
     * 查询档案信息模板列表
     */
    @PreAuthorize("@ss.hasPermi('archive:item:list')")
    @GetMapping("/listSuccess")
    public AjaxResult listSuccess(ArchiveItem archiveItem)
    {
        List<ArchiveItem> list = archiveItemService.selectArchiveItemList(archiveItem);
        return success(list);
    }
    /**
     * 导出档案信息模板列表
     */
    @PreAuthorize("@ss.hasPermi('archive:item:export')")
    @Log(title = "档案信息模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveItem archiveItem)
    {
        List<ArchiveItem> list = archiveItemService.selectArchiveItemList(archiveItem);
        ExcelUtil<ArchiveItem> util = new ExcelUtil<ArchiveItem>(ArchiveItem.class);
        util.exportExcel(response, list, "档案信息模板数据");
    }

    /**
     * 获取档案信息模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('archive:item:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveItemService.selectArchiveItemById(id));
    }

    /**
     * 新增档案信息模板
     */
    @PreAuthorize("@ss.hasPermi('archive:item:add')")
    @Log(title = "档案信息模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveItem archiveItem)
    {
        return toAjax(archiveItemService.insertArchiveItem(archiveItem));
    }

    /**
     * 修改档案信息模板
     */
    @PreAuthorize("@ss.hasPermi('archive:item:edit')")
    @Log(title = "档案信息模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody List<ArchiveItem> archiveItems)
    {
        return toAjax(archiveItemService.updateArchiveItem(archiveItems));
    }

    /**
     * 删除档案信息模板
     */
    @PreAuthorize("@ss.hasPermi('archive:item:remove')")
    @Log(title = "档案信息模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveItemService.deleteArchiveItemByIds(ids));
    }


    /**
     * 获取档案信息模板详细信息
     */
    //@PreAuthorize("@ss.hasPermi('archive:item:query')")
    @GetMapping(value = "/categoryId/{categoryId}")
    public AjaxResult getInfoByCategoryId(@PathVariable("categoryId") Long categoryId)
    {
        return success(archiveItemService.selectArchiveItemListByCategoryId(categoryId));
    }
}
