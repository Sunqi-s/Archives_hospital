package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveBorrowMapper {

    public List<Long> getArchiveBorrowList(@Param("archiveInfo") ArchiveInfo archiveInfo, @Param("dataPermiList") String[] dataPermiList);

    public List<ArchiveInfo> getArchiveBorrowListAll(@Param("categoryId") String categoryId,@Param("archiveNumber") String archiveNumber, @Param("field9") String field9, @Param("pageSize") int pageSize, @Param("offset") int offset, @Param("dataPermiList") String[] dataPermiList);

    public int getArchiveBorrowCount(@Param("categoryId") String categoryId,@Param("archiveNumber") String archiveNumber, @Param("field9") String field9, @Param("dataPermiList") String[] dataPermiList);


}
