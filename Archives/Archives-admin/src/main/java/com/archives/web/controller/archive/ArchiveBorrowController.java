package com.archives.web.controller.archive;

import com.archives.archive.domain.ArchiveBorrow;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.service.IArchiveBorrowService;
import com.archives.common.annotation.Log;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.core.page.TableDataInfo;
import com.archives.common.enums.BusinessType;
import com.archives.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/archive/borrow")
public class ArchiveBorrowController extends BaseController {
    @Autowired
    private IArchiveBorrowService archiveBorrowService;

    /**
     * 查询ArchiveBorrow列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveBorrow archiveBorrow)
    {
        startPage();
        List<ArchiveBorrow> list = archiveBorrowService.selectArchiveBorrowList(archiveBorrow);
        return getDataTable(list);
    }

    /**
     * 导出ArchiveBorrow列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:export')")
    @Log(title = "ArchiveBorrow", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveBorrow archiveBorrow)
    {
        List<ArchiveBorrow> list = archiveBorrowService.selectArchiveBorrowList(archiveBorrow);
        ExcelUtil<ArchiveBorrow> util = new ExcelUtil<ArchiveBorrow>(ArchiveBorrow.class);
        util.exportExcel(response, list, "ArchiveBorrow数据");
    }

    /**
     * 获取ArchiveBorrow详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveBorrowService.selectArchiveBorrowById(id));
    }

    /**
     * 新增ArchiveBorrow
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:add')")
    @Log(title = "ArchiveBorrow", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveBorrow archiveBorrow)
    {
        return toAjax(archiveBorrowService.insertArchiveBorrow(archiveBorrow));
    }

    /**
     * 修改ArchiveBorrow
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:edit')")
    @Log(title = "ArchiveBorrow", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveBorrow archiveBorrow)
    {
        return toAjax(archiveBorrowService.updateArchiveBorrow(archiveBorrow));
    }

    /**
     * 删除ArchiveBorrow
     */
//    @PreAuthorize("@ss.hasPermi('archive:borrow:remove')")
    @Log(title = "ArchiveBorrow", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveBorrowService.deleteArchiveBorrowByIds(ids));
    }

//    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:list')")
    @PostMapping("/infoList/")
    public List<Long> getArchiveBorrowList(@RequestBody ArchiveInfo archiveInfo) {
        return archiveBorrowService.getArchiveBorrowList(archiveInfo);
    }

//    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:list')")
    @PostMapping("/infoList/all/")
    public SearchJson getArchiveBorrowListAll(@RequestBody SearchJson searchJson){
        return archiveBorrowService.getArchiveBorrowListAll(searchJson);
    }

//    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:user')")
    @PostMapping("/user/")
    public SysUser getArchiveBorrowUser() {
        return archiveBorrowService.getArchiveBorrowUser();
    }



}
