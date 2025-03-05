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
import com.archives.archive.domain.ArchiveRule;
import com.archives.archive.service.IArchiveRuleService;
import com.archives.common.utils.poi.ExcelUtil;
import com.archives.common.core.page.TableDataInfo;

/**
 * 档号规则Controller
 *
 * @author é«å°å·
 * @date 2025-03-05
 */
@RestController
@RequestMapping("/archive/rule")
public class ArchiveRuleController extends BaseController
{
    @Autowired
    private IArchiveRuleService archiveRuleService;

    /**
     * 查询档号规则列表
     */
    @GetMapping("/list")
    public TableDataInfo list(ArchiveRule archiveRule)
    {
        startPage();
        List<ArchiveRule> list = archiveRuleService.selectArchiveRuleList(archiveRule);
        return getDataTable(list);
    }

    /**
     * 导出档号规则列表
     */
    @Log(title = "档号规则", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ArchiveRule archiveRule)
    {
        List<ArchiveRule> list = archiveRuleService.selectArchiveRuleList(archiveRule);
        ExcelUtil<ArchiveRule> util = new ExcelUtil<ArchiveRule>(ArchiveRule.class);
        util.exportExcel(response, list, "档号规则数据");
    }

    /**
     * 获取档号规则详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(archiveRuleService.selectArchiveRuleById(id));
    }

    /**
     * 新增档号规则
     */
    @Log(title = "档号规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ArchiveRule archiveRule)
    {
        return toAjax(archiveRuleService.insertArchiveRule(archiveRule));
    }

    /**
     * 修改档号规则
     */
    @Log(title = "档号规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ArchiveRule archiveRule)
    {
        return toAjax(archiveRuleService.updateArchiveRule(archiveRule));
    }

    /**
     * 删除档号规则
     */
    @Log(title = "档号规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(archiveRuleService.deleteArchiveRuleByIds(ids));
    }
}
