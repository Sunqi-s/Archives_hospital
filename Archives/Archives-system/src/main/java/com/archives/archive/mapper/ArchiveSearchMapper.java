package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveSearchMapper {
    public List<SearchJson> getSearchList(@Param("keyWord") String keyWord, @Param("value") List<String> value ,@Param("dataPermiList") String[] dataPermiList);

    public List<ArchiveInfo> getSearchListAll(@Param("keyWord") String keyWord, @Param("categoryId") String categoryId, @Param("pageSize") int pageSize, @Param("offset") int offset , @Param("dataPermiList") String[] dataPermiList);

    public int getSearchListAllCount(@Param("keyWord") String keyWord, @Param("categoryId") String categoryId , @Param("dataPermiList") String[] dataPermiList);
}
