package com.archives.archive.service;

import com.archives.archive.domain.ArchiveBorrow;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.common.core.domain.entity.SysUser;

import java.util.List;

public interface IArchiveBorrowService {

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
     * 批量删除ArchiveBorrow
     *
     * @param ids 需要删除的ArchiveBorrow主键集合
     * @return 结果
     */
    public int deleteArchiveBorrowByIds(Long[] ids);

    /**
     * 删除ArchiveBorrow信息
     *
     * @param id ArchiveBorrow主键
     * @return 结果
     */
    public int deleteArchiveBorrowById(Long id);

    public List<Long> getArchiveBorrowList(ArchiveInfo archiveInfo);

    public SysUser getArchiveBorrowUser();

    public SearchJson getArchiveBorrowListAll(SearchJson searchJson);

}
