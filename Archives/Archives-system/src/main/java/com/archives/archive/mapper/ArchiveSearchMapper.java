package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveSearchMapper {
    public List<SearchJson> getSearchList(@Param("keyWord") String keyWord, @Param("value") List<String> value);

    public List<ArchiveInfo> getSearchListAll(@Param("keyWord") String keyWord, @Param("value") List<String> value, @Param("categoryId") String categoryId, @Param("pageSize") int pageSize, @Param("offset") int offset);

    public int getSearchListAllCount(@Param("keyWord") String keyWord, @Param("value") List<String> value, @Param("categoryId") String categoryId);
}
