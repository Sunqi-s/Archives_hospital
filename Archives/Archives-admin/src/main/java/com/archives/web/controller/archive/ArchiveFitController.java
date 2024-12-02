package com.archives.web.controller.archive;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.archives.archive.domain.ArchiveFit;
import com.archives.archive.service.IArchiveFitService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 保存对于文书的年度或科技的类型的Controller
 * 
 * @author é«å°å·
 * @date 2024-12-02
 */
@RestController
@RequestMapping("/archive/fit")
public class ArchiveFitController extends BaseController
{
    @Autowired
    private IArchiveFitService archiveFitService;

    /**
     * 查询保存对于文书的年度或科技的类型的列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveFit archiveFit)
    {
        startPage();
        List<ArchiveFit> list = archiveFitService.selectArchiveFitList(archiveFit);
        return getDataTable(list);
    }

    /**
     * 导出保存对于文书的年度或科技的类型的列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:export')")
    @Log(title = "保存对于文书的年度或科技的类型的", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveFit archiveFit)
    {
        List<ArchiveFit> list = archiveFitService.selectArchiveFitList(archiveFit);
        ExcelUtil<ArchiveFit> util = new ExcelUtil<ArchiveFit>(ArchiveFit.class);
        util.exportExcel(response, list, "保存对于文书的年度或科技的类型的数据");
    }

    /**
     * 获取保存对于文书的年度或科技的类型的详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveFitService.selectArchiveFitById(id));
    }

    /**
     * 新增保存对于文书的年度或科技的类型的
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:add')")
    @Log(title = "保存对于文书的年度或科技的类型的", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveFit archiveFit)
    {
        return toAjax(archiveFitService.insertArchiveFit(archiveFit));
    }

    /**
     * 修改保存对于文书的年度或科技的类型的
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:edit')")
    @Log(title = "保存对于文书的年度或科技的类型的", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveFit archiveFit)
    {
        return toAjax(archiveFitService.updateArchiveFit(archiveFit));
    }

    /**
     * 删除保存对于文书的年度或科技的类型的
     */
//    @PreAuthorize("@ss.hasPermi('archive:fit:remove')")
    @Log(title = "保存对于文书的年度或科技的类型的", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveFitService.deleteArchiveFitByIds(ids));
    }
}
