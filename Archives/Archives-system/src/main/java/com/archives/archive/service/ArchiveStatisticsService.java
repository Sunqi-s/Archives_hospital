package com.archives.archive.service;

import com.archives.archive.domain.Statistics;

import java.util.List;

public interface ArchiveStatisticsService {

    public List<Statistics> getYearStatistics(Statistics statistics);

    public List<Statistics> getStatisticsByCondition(Statistics statistics);

    public List<Statistics> getCategoryStatistics(Statistics statistics);

    public List<Statistics> getStatistics(int year);
}
