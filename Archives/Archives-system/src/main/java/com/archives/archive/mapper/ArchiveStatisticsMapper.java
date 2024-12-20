package com.archives.archive.mapper;

import com.archives.archive.domain.Statistics;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveStatisticsMapper {

    public List<Statistics> getYeararchiveCount(Statistics statistics);

    public List<Statistics> getYearfileCount(Statistics statistics);

    public List<Statistics> getYearfileSize(Statistics statistics);

    List<Statistics> getStatisticsByCondition(@Param("startData") String startData, @Param("endData") String endData, @Param("condition") String condition, @Param("dataCountList") List<Integer> dataCountList);

    public List<Statistics> importData(@Param("year") int data);

    public List<Statistics> getCategoryStatistics(@Param("categoryIds") List<Integer> category, @Param("startData") String startData, @Param("endData") String endData);

}
