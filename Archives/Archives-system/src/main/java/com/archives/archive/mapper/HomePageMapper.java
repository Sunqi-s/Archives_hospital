package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.domain.HomeData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HomePageMapper {

    public int thisMonth(@Param("archiveStatus") int archiveStatus,@Param("dataPermiList")String[] dataPermiList);
    public int thisYear(@Param("archiveStatus") int archiveStatus,@Param("dataPermiList")String[] dataPermiList);
    public int lastMonth(@Param("archiveStatus") int archiveStatus,@Param("dataPermiList")String[] dataPermiList);
    public int all(@Param("archiveStatus") int archiveStatus,@Param("dataPermiList")String[] dataPermiList);


    public int selectHomeData(@Param("categoryId") Long id,@Param("dataPermiList") String[] dataPermiList);

    public List<HomeData> importData1(@Param("dataPermiList") String[] dataPermiList);
    public List<HomeData> importData2(@Param("dataPermiList") String[] dataPermiList);

    public int importOss(@Param("dataPermiList")String[] dataPermiList);

    public int getStatus1(@Param("dataPermiList") String[] dataPermiList);
    public int getStatus2(@Param("dataPermiList") String[] dataPermiList);
    public int getStatus3(@Param("dataPermiList") String[] dataPermiList);

    public int lastMonthHeTong(@Param("dataPermiList") String[] dataPermiList);
    public int thisMonthHeTong(@Param("dataPermiList") String[] dataPermiList);
    public int thisYearHeTong(@Param("dataPermiList") String[] dataPermiList);
    public int allHeTong(@Param("dataPermiList") String[] dataPermiList);
}

