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

    Statistics getStatisticsByCondition(@Param("idArr") List<String> idArr);

    public List<Statistics> importData(@Param("year") int data,@Param("dataPermiList")String[] dataPermiList);

    public List<Statistics> getCategoryCountStatistics(@Param("categoryIds") List<Integer> category, @Param("startData") String startData, @Param("endData") String endData,@Param("dataPermiList")String[] dataPermiList);

    public List<String> getCategoryIdStatistics(@Param("categoryId") Integer category, @Param("startData") String startData, @Param("endData") String endData,@Param("dataPermiList")String[] dataPermiList);


    List<Statistics> getPageColumn(@Param("itemName") String itemName,@Param("dataPermiList")String[] dataPermiList);


    List<Statistics> getYearPageCount(@Param("item") Statistics s, @Param("sta") Statistics statistics,@Param("dataPermiList")String[] dataPermiList);

    List<Statistics> getFileCountByCondition(@Param("startData") String startData, @Param("endData") String endData, @Param("condition") String condition, @Param("dataCount") Integer dataCount,@Param("dataPermiList") String[] dataPermiList);

    List<String> getFileIdByCondition(@Param("startData") String startData, @Param("endData") String endData, @Param("condition") String condition, @Param("categoryId") Integer categoryId, @Param("value") String value,@Param("dataPermiList") String[] dataPermiList);


    public List<Statistics> getArchiveLog(@Param("year") int data,@Param("dataPermiList") String[] dataPermiList);

}
