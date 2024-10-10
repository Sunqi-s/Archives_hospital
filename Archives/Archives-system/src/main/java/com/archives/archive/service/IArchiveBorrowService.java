package com.archives.archive.service;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.common.core.domain.entity.SysUser;

import java.util.List;

public interface IArchiveBorrowService {

    public List<Long> getArchiveBorrowList(ArchiveInfo archiveInfo);

    public SysUser getArchiveBorrowUser();

    public SearchJson getArchiveBorrowListAll(SearchJson searchJson);

}
