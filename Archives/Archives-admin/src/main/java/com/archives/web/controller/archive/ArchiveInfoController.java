package com.archives.web.controller.archive;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import javax.servlet.http.HttpServletResponse;

import com.archives.archive.domain.SearchJson;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.archives.common.annotation.Log;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import com.archives.common.enums.BusinessType;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.service.IArchiveInfoService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 档案信息Controller
 *
 * @author 高小川
 * @date 2024-07-11
 */
@RestController
@RequestMapping("/archive/info")
public class ArchiveInfoController extends BaseController
{
    @Autowired
    private IArchiveInfoService archiveInfoService;

    /**
     * 查询档案信息列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:list')")
    @GetMapping("/list")
    public TableDataInfo list(ArchiveInfo archiveInfo)
    {
        startPage();
        List<ArchiveInfo> list = archiveInfoService.selectArchiveInfoList(archiveInfo);
        return getDataTable(list);
    }

    /**
     * 导出档案信息列表
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:export')")
    @Log(title = "档案信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveInfo archiveInfo)
    {
        List<ArchiveInfo> list = archiveInfoService.selectArchiveInfoList(archiveInfo);
        ExcelUtil<ArchiveInfo> util = new ExcelUtil<ArchiveInfo>(ArchiveInfo.class);
        util.exportExcel(response, list, "档案信息数据");
    }

    /**
     * 获取档案信息详细信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:query')")
    @GetMapping(value = "getInfo/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveInfoService.selectArchiveInfoById(id));
    }

    /**
     * 新增档案信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:add')")
    @Log(title = "档案信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveInfo archiveInfo)
    {
        return toAjax(archiveInfoService.insertArchiveInfo(archiveInfo));
    }

    /**
     * 修改档案信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:edit')")
    @Log(title = "档案信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveInfo archiveInfo)
    {
        return toAjax(archiveInfoService.updateArchiveInfo(archiveInfo));
    }

    /**
     * 批量归档档案信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:document')")
    @PostMapping("/document/")
    public AjaxResult document(@RequestBody SearchJson searchJson)
    {
        return toAjax(archiveInfoService.updateArchiveStatusByIds(searchJson));
    }

    //归档档案信息
    @PostMapping("/updateArchiveStatusById")
    public AjaxResult updateArchiveStatusById(@RequestBody SearchJson searchJson) {
        return toAjax(archiveInfoService.updateArchiveStatusById(searchJson));
    }

    @PostMapping("/documentAll")
    public AjaxResult documentAll(@RequestBody ArchiveInfo archiveInfo)
    {
        return toAjax(archiveInfoService.updateArchiveStatusAll(archiveInfo));
    }

    /**
     * 删除档案信息
     */
//    @PreAuthorize("@ss.hasPermi('archive:info:remove')")
    @Log(title = "档案信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveInfoService.deleteArchiveInfoByIds(ids));
    }
    /**
     * 批量新增档案信息
     */
    @Log(title = "EXCEL导入", businessType = BusinessType.INSERT)
    @PostMapping("/bulkAdd")
    public AjaxResult bulkAdd(@RequestBody List<ArchiveInfo> archiveInfo)
    {
        try {
            CompletableFuture<List<ArchiveInfo>> future = archiveInfoService.insertArchiveInfoList(archiveInfo);
            List<ArchiveInfo> generatedIds = future.get(); // 等待异步操作完成并获取结果
            return AjaxResult.success("操作成功", generatedIds);
        } catch (Exception e) {
            e.printStackTrace();
            return AjaxResult.error("操作失败: " + e.getMessage());
        }
    }

    //发送利用档案信息
    @PostMapping("/sendInfoByIds")
    public AjaxResult sendArchiveInfoByIds(@RequestBody SearchJson searchJson) {
        return toAjax(archiveInfoService.sendArchiveInfoByIds(searchJson));
    }

    @PostMapping("/sendAll")
    public AjaxResult sendAll(@RequestBody ArchiveInfo archiveInfo)
    {
        return toAjax(archiveInfoService.sendArchiveAll(archiveInfo));
    }

    /**
     * 高级搜索
     */
    @PostMapping ("/beachSearch")
    public TableDataInfo beachSearch(ArchiveInfo archiveInfo) {
        startPage();
        List<ArchiveInfo> list = archiveInfoService.beachSearch(archiveInfo);
        return getDataTable(list);
    }

    /**
     * 获取待删除档案数量
     */
    @GetMapping("/getDeleteCount")
    public int getDeleteCount(ArchiveInfo archiveInfo) {
        return archiveInfoService.getDeleteCount(archiveInfo);
    }

    @PostMapping("/getInfoByIds")
    public AjaxResult getInfoByIds(@RequestBody List<Long> ids) {
        return AjaxResult.success(archiveInfoService.selectArchiveInfoByIds(ids));
    }

    @PostMapping("/updateArchiveNumber")
    public void updateArchiveNumber(@RequestBody ArchiveInfo archiveInfo) {
        archiveInfoService.updateArchiveNumber(archiveInfo);
    }

    @PostMapping("/getUpdateStatus")
    public String getUpdateStatus() {
        return archiveInfoService.getUpdateStatus();
    }

}
