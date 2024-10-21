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
import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.service.IArchiveImportLogService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 数据导入日志Controller
 *
 * @author 孙
 * @date 2024-08-30
 */
@RestController
@RequestMapping("/archive/importLog")
public class ArchiveImportLogController extends BaseController
{
    @Autowired
    private IArchiveImportLogService archiveImportLogService;

    /**
     * 查询数据导入日志列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ArchiveImportLog archiveImportLog)
    {
        startPage();
        List<ArchiveImportLog> list = archiveImportLogService.selectArchiveImportLogList(archiveImportLog);
        return getDataTable(list);
    }

    /**
     * 导出数据导入日志列表
     */
    @Log(title = "数据导入日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveImportLog archiveImportLog)
    {
        List<ArchiveImportLog> list = archiveImportLogService.selectArchiveImportLogList(archiveImportLog);
        ExcelUtil<ArchiveImportLog> util = new ExcelUtil<ArchiveImportLog>(ArchiveImportLog.class);
        util.exportExcel(response, list, "数据导入日志数据");
    }

    /**
     * 获取数据导入日志详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveImportLogService.selectArchiveImportLogById(id));
    }

    /**
     * 新增数据导入日志
     */
    @Log(title = "数据导入日志", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveImportLog archiveImportLog)
    {

        ArchiveImportLog data=archiveImportLogService.insertArchiveImportLog(archiveImportLog);

        System.out.println("data:"+data);
        return success(data);
//        return toAjax(archiveImportLogService.insertArchiveImportLog(archiveImportLog));
    }

    /**
     * 修改数据导入日志
     */
    @Log(title = "数据导入日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveImportLog archiveImportLog)
    {
        return toAjax(archiveImportLogService.updateArchiveImportLog(archiveImportLog));
    }

    /**
     * 删除数据导入日志
     */
    @Log(title = "数据导入日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveImportLogService.deleteArchiveImportLogByIds(ids));
    }
}
