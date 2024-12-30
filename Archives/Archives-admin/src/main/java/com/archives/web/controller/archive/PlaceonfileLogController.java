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
import com.archives.archive.domain.PlaceonfileLog;
import com.archives.archive.service.IPlaceonfileLogService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * placeonlogController
 * 
 * @author é«å°å·
 * @date 2024-12-26
 */
@RestController
@RequestMapping("/placeonlog/placeonlog")
public class PlaceonfileLogController extends BaseController
{
    @Autowired
    private IPlaceonfileLogService placeonfileLogService;

    /**
     * 查询placeonlog列表
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:list')")
    @GetMapping("/list")
    public TableDataInfo list(PlaceonfileLog placeonfileLog)
    {
        startPage();
        List<PlaceonfileLog> list = placeonfileLogService.selectPlaceonfileLogList(placeonfileLog);
        return getDataTable(list);
    }

    /**
     * 导出placeonlog列表
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:export')")
    @Log(title = "placeonlog", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PlaceonfileLog placeonfileLog)
    {
        List<PlaceonfileLog> list = placeonfileLogService.selectPlaceonfileLogList(placeonfileLog);
        ExcelUtil<PlaceonfileLog> util = new ExcelUtil<PlaceonfileLog>(PlaceonfileLog.class);
        util.exportExcel(response, list, "placeonlog数据");
    }

    /**
     * 获取placeonlog详细信息
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:query')")
    @GetMapping(value = "/{placeonfileId}")
    public AjaxResult getInfo(@PathVariable("placeonfileId") Long placeonfileId)
    {
        return success(placeonfileLogService.selectPlaceonfileLogByPlaceonfileId(placeonfileId));
    }

    /**
     * 新增placeonlog
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:add')")
    @Log(title = "placeonlog", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PlaceonfileLog placeonfileLog)
    {
        return toAjax(placeonfileLogService.insertPlaceonfileLog(placeonfileLog));
    }

    /**
     * 修改placeonlog
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:edit')")
    @Log(title = "placeonlog", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PlaceonfileLog placeonfileLog)
    {
        return toAjax(placeonfileLogService.updatePlaceonfileLog(placeonfileLog));
    }

    /**
     * 删除placeonlog
     */
//    @PreAuthorize("@ss.hasPermi('placeonlog:placeonlog:remove')")
    @Log(title = "placeonlog", businessType = BusinessType.DELETE)
	@DeleteMapping("/{placeonfileIds}")
    public AjaxResult remove(@PathVariable Long[] placeonfileIds)
    {
        return toAjax(placeonfileLogService.deletePlaceonfileLogByPlaceonfileIds(placeonfileIds));
    }
}
