package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArchiveSearchMapper {
    public List<ArchiveInfo> getSearchList(String keyword);
}
