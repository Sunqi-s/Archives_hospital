package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.domain.HomeData;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HomePageMapper {

    public int thisMonth(int archiveStatus);
    public int thisYear(int archiveStatus);
    public int lastMonth(int archiveStatus);
    public int all(int archiveStatus);


    public int selectHomeData(Long id);

    public List<HomeData> importData1();
    public List<HomeData> importData2();

    public int importOss();
}
