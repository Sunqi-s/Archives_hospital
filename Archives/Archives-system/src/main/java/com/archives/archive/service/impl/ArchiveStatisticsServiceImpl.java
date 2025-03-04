package com.archives.archive.service.impl;

import com.archives.archive.domain.Statistics;
import com.archives.archive.mapper.ArchiveStatisticsMapper;
import com.archives.archive.service.ArchiveStatisticsService;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArchiveStatisticsServiceImpl implements ArchiveStatisticsService {

    @Autowired
    private ArchiveStatisticsMapper archiveStatisticsMapper;

    @Override
    public List<Statistics> getYearStatistics(Statistics statistics) {
        String[] dataPermiList = selectSearchByDataPermit();
        List<Statistics> yearStatistics = new ArrayList<>();
        if (statistics.getSelect() == 1) {
            List<Statistics> columnList = archiveStatisticsMapper.getPageColumn("年度", dataPermiList);
            List<String> list = new ArrayList<>();
            for (Statistics s : columnList) {
                list.add(s.getStartData());
            }
            statistics.setTypeList(list);
            yearStatistics = archiveStatisticsMapper.getYeararchiveCount(statistics, dataPermiList);
        } else if (statistics.getSelect() == 2) {
            List<Statistics> columnList = archiveStatisticsMapper.getPageColumn("年度", dataPermiList);
            List<String> list = new ArrayList<>();
            for (Statistics s : columnList) {
                list.add(s.getStartData());
            }
            statistics.setTypeList(list);
            yearStatistics = archiveStatisticsMapper.getYearfileCount(statistics, dataPermiList);
        } else if (statistics.getSelect() == 3) {
            List<Statistics> columnList = archiveStatisticsMapper.getPageColumn("年度", dataPermiList);
            List<String> list = new ArrayList<>();
            for (Statistics s : columnList) {
                list.add(s.getStartData());
            }
            statistics.setTypeList(list);
            yearStatistics = archiveStatisticsMapper.getYearfileSize(statistics, dataPermiList);
        } else if (statistics.getSelect() == 4) {
            List<Statistics> columnList1 = archiveStatisticsMapper.getPageColumn("页数", dataPermiList);
            List<Statistics> columnList2 = archiveStatisticsMapper.getPageColumn("年度", dataPermiList);
            List<String> list = new ArrayList<>();
            for (Statistics s : columnList2) {
                list.add(s.getStartData());
            }
            statistics.setTypeList(list);
            for (Statistics s : columnList1) {
                List<Statistics> column = archiveStatisticsMapper.getYearPageCount(s, statistics, dataPermiList);
                yearStatistics.addAll(column);
            }

        }
        for (Statistics s : yearStatistics) {
            s.setSelect(statistics.getSelect());
        }
        return yearStatistics;
    }

    @Override
    public List<Statistics> getStatisticsByCondition(Statistics statistics) {
        String[] dataPermiList =selectSearchByDataPermit();
        String startData = statistics.getStartData();
        String endData = statistics.getEndData();
        String condition = statistics.getCondition();
        Integer dataCount = statistics.getDataCountList().get(0);
        List<Statistics> countList = archiveStatisticsMapper.getFileCountByCondition(startData, endData, condition, dataCount,dataPermiList);
        for (Statistics s : countList) {
            s.setCondition(dataCount.toString());
            s.setTypeList(archiveStatisticsMapper.getFileIdByCondition(startData, endData, condition, dataCount,s.getCategory(),dataPermiList));
            if (s.getTypeList().isEmpty()) {
                s.setTotalSize(0L);
                s.setFileCount(0);
            }else {
                List<String> ids = s.getTypeList();
                Statistics returnStatistics = archiveStatisticsMapper.getStatisticsByCondition(ids);
                s.setTypeList(null);
                s.setTotalSize(returnStatistics.getTotalSize());
                s.setFileCount(returnStatistics.getFileCount());
            }
        }
        return countList;
    }

    public List<Statistics> getStatistics(int year) {
        String[] dataPermiList = selectSearchByDataPermit();
        List<Statistics> result = new ArrayList<>(12);
        for (int i = 0; i < 12; i++) {
            Statistics statistics = new Statistics();
            statistics.setLogCount(0);
            statistics.setDataCount(0);
            result.add(statistics);
        }
        List<Statistics> statistics1 = archiveStatisticsMapper.importData(year, dataPermiList);
        List<Statistics> statistics2 = archiveStatisticsMapper.getArchiveLog(year, dataPermiList);
        for (Statistics s : statistics1) {
            int index = Integer.parseInt(s.getStartData()) - 1;
            if (index >= 0 && index < 12) {
                result.get(index).setDataCount(s.getDataCount());
                result.get(index).setLogCount(s.getLogCount());
            }
        }
        for (Statistics s : statistics2) {
            int index = Integer.parseInt(s.getStartData()) - 1;
            if (index >= 0 && index < 12) {
                result.get(index).setArchiveCount(s.getArchiveCount());
            }
        }
        return result;
    }

    @Override
    public List<Statistics> getCategoryStatistics(Statistics statistics) {
        String[] dataPermiList =selectSearchByDataPermit();
        String startData = null;
        String endData = null;
        if (statistics.getTypeList().size() >= 2){
            startData = statistics.getTypeList().get(0);
            endData = statistics.getTypeList().get(1);
        }
        List<Integer> categoryIds = statistics.getDataCountList();
        List<Statistics> categoryStatistics = archiveStatisticsMapper.getCategoryCountStatistics(categoryIds, startData, endData,dataPermiList);
        for (int i = 0; i < categoryStatistics.size(); i++) {
            Statistics s = categoryStatistics.get(i);
            Integer categoryId = categoryIds.get(i);
            // 设置 typeList
            List<String> typeList = archiveStatisticsMapper.getCategoryIdStatistics(categoryId, startData, endData, dataPermiList);
            s.setTypeList(typeList);

            // 根据 typeList 计算 totalSize 和 fileCount
            if (typeList == null || typeList.isEmpty()) {
                s.setTotalSize(0L);
                s.setFileCount(0);
            } else {
                Statistics returnStatistics = archiveStatisticsMapper.getStatisticsByCondition(typeList);
                s.setTotalSize(returnStatistics.getTotalSize());
                s.setFileCount(returnStatistics.getFileCount());
            }
        }
        return categoryStatistics;
    }

    public String[] selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if("all".equals(currentUser.getDataPermi())){
            dataPermiList = new String[0];
        }else {
            dataPermiList = (currentUser.getDataPermi().split(","));
            for (int i = 0; i < dataPermiList.length; i++){
                dataPermiList[i] = "%" + dataPermiList[i] + "%";
            }
        }
        return dataPermiList;
    }
}
