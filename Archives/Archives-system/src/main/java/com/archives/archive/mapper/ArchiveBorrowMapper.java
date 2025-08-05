package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveBorrow;
import com.archives.archive.domain.ArchiveInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArchiveBorrowMapper {

    /**
     * 查询ArchiveBorrow
     *
     * @param id ArchiveBorrow主键
     * @return ArchiveBorrow
     */
    public ArchiveBorrow selectArchiveBorrowById(Long id);

    /**
     * 查询ArchiveBorrow列表
     *
     * @param archiveBorrow ArchiveBorrow
     * @return ArchiveBorrow集合
     */
    public List<ArchiveBorrow> selectArchiveBorrowList(ArchiveBorrow archiveBorrow);

    /**
     * 新增ArchiveBorrow
     *
     * @param archiveBorrow ArchiveBorrow
     * @return 结果
     */
    public int insertArchiveBorrow(ArchiveBorrow archiveBorrow);

    /**
     * 修改ArchiveBorrow
     *
     * @param archiveBorrow ArchiveBorrow
     * @return 结果
     */
    public int updateArchiveBorrow(ArchiveBorrow archiveBorrow);

    /**
     * 删除ArchiveBorrow
     *
     * @param id ArchiveBorrow主键
     * @return 结果
     */
    public int deleteArchiveBorrowById(Long id);

    /**
     * 批量删除ArchiveBorrow
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveBorrowByIds(Long[] ids);

    public List<Long> getArchiveBorrowList(@Param("archiveInfo") ArchiveInfo archiveInfo, @Param("dataPermiList") String[] dataPermiList);

    public List<ArchiveInfo> getArchiveBorrowListAll(@Param("categoryId") String categoryId,@Param("archiveNumber") String archiveNumber, @Param("field9") String field9, @Param("pageSize") int pageSize, @Param("offset") int offset, @Param("dataPermiList") String[] dataPermiList);

    public int getArchiveBorrowCount(@Param("categoryId") String categoryId,@Param("archiveNumber") String archiveNumber, @Param("field9") String field9, @Param("dataPermiList") String[] dataPermiList);


}
