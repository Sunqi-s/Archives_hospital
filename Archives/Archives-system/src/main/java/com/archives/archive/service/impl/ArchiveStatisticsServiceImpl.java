package com.archives.archive.service.impl;

import com.archives.archive.domain.Statistics;
import com.archives.archive.mapper.ArchiveStatisticsMapper;
import com.archives.archive.service.ArchiveStatisticsService;
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
        System.out.println("statistics = " + statistics);
        List<Statistics> yearStatistics = new ArrayList<>();
        if(statistics.getSelect() == 1){
             yearStatistics = archiveStatisticsMapper.getYeararchiveCount(statistics);
        } else if (statistics.getSelect() == 2) {
            yearStatistics = archiveStatisticsMapper.getYearfileCount(statistics);
        }else if (statistics.getSelect() == 3) {
            yearStatistics = archiveStatisticsMapper.getYearfileSize(statistics);
        }
        for (Statistics s : yearStatistics) {
            s.setSelect(statistics.getSelect());
        }
        return yearStatistics;
    }

    @Override
    public List<Statistics> getStatisticsByCondition(Statistics statistics) {
        String startData = statistics.getStartData();
        String endData = statistics.getEndData();
        String condition = statistics.getCondition();
        List<Integer> dataCountList = statistics.getDataCountList();
        return archiveStatisticsMapper.getStatisticsByCondition(startData, endData, condition, dataCountList);
    }

    public  List<Statistics> getStatistics(int year) {
        List<Statistics> result = new ArrayList<>(12);
        for (int i = 1; i <= 12; i++) {
            Statistics statistics = new Statistics();
            statistics.setLogCount(0);
            statistics.setDataCount(0);
            result.add(statistics);
        }
        List<Statistics> statistics = archiveStatisticsMapper.importData(year);
        for (Statistics s : statistics) {
            int index = Integer.parseInt(s.getStartData())-1;
            if(index >= 0 && index < 12){
                result.get(index).setDataCount(s.getDataCount());
                result.get(index).setLogCount(s.getLogCount());
            }
        }
        return result;
    }

    @Override
    public List<Statistics> getCategoryStatistics(Statistics statistics) {
        String startData = statistics.getTypeList().get(0);
        String endData = statistics.getTypeList().get(1);
        List<Integer> categoryIds = statistics.getDataCountList();
        List<Statistics> categoryStatistics = archiveStatisticsMapper.getCategoryStatistics(categoryIds, startData, endData);
        return categoryStatistics;

    }
}
