package com.archives.archive.mapper;

import com.archives.archive.domain.Statistics;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveStatisticsMapper {

    public List<Statistics> getYeararchiveCount(@Param("sta") Statistics statistics,@Param("dataPermiList")String[] dataPermiList);

    public List<Statistics> getYearfileCount(@Param("sta") Statistics statistics,@Param("dataPermiList")String[] dataPermiList);

    public List<Statistics> getYearfileSize(@Param("sta") Statistics statistics,@Param("dataPermiList")String[] dataPermiList);

    Statistics getStatisticsByCondition(@Param("idArr") String[] idArr);

    public List<Statistics> importData(@Param("year") int data,@Param("dataPermiList")String[] dataPermiList);

    public List<Statistics> getCategoryCountStatistics(@Param("categoryIds") List<Integer> category, @Param("startData") String startData, @Param("endData") String endData,@Param("dataPermiList")String[] dataPermiList);

    List<Statistics> getPageColumn(@Param("itemName") String itemName,@Param("dataPermiList")String[] dataPermiList);


    List<Statistics> getYearPageCount(@Param("item") Statistics s, @Param("sta") Statistics statistics,@Param("dataPermiList")String[] dataPermiList);

    List<Statistics> getFileCountByCondition(@Param("startData") String startData, @Param("endData") String endData, @Param("condition") String condition, @Param("dataCountList") List<Integer> dataCountList,@Param("dataPermiList") String[] dataPermiList);


}
