package com.archives.web.controller.archive;

import com.archives.archive.domain.Statistics;
import com.archives.archive.domain.StatisticsExport;
import com.archives.archive.service.ArchiveStatisticsService;
import com.archives.common.core.domain.AjaxResult;
import com.archives.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/statistics")
public class ArchiveStatisticsController {

    @Autowired
    private ArchiveStatisticsService archiveStatisticsService;

    @GetMapping("/year")
    public AjaxResult getYearStatistics(Statistics statistics) {
        return AjaxResult.success(archiveStatisticsService.getYearStatistics(statistics));
    }

    @GetMapping("/condition")
    public AjaxResult getStatisticsByCondition(Statistics statistics) {
        return AjaxResult.success(archiveStatisticsService.getStatisticsByCondition(statistics));
    }

    @GetMapping("/archives/{year}")
    public AjaxResult archives(@PathVariable("year") String year) {
        int yearInt = Integer.parseInt(year);
        List<Statistics> statistics = archiveStatisticsService.getStatistics(yearInt);
        return AjaxResult.success(statistics);
    }

    @PostMapping("/export")
    public void export(HttpServletResponse response, Statistics statistics) {
        StatisticsExport statisticsExport1 = new StatisticsExport("接收",statistics.getDataCountList());
        StatisticsExport statisticsExport2 = new StatisticsExport("接收次数",statistics.getLogCountList());
        List<StatisticsExport> statisticsExportList = new ArrayList<>();
        statisticsExportList.add(statisticsExport1);
        statisticsExportList.add(statisticsExport2);
        ExcelUtil<StatisticsExport> exportExcelUtil = new ExcelUtil<>(StatisticsExport.class);
        exportExcelUtil.exportExcel(response, statisticsExportList, "统计数据");
    }

    @PostMapping("/getCategory")
    public AjaxResult getCategoryStatistics(@RequestBody Statistics statistics) {
        return AjaxResult.success(archiveStatisticsService.getCategoryStatistics(statistics));
    }
}
