package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.mapper.ArchiveBorrowMapper;
import com.archives.archive.service.IArchiveBorrowService;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
@Service
public class ArchiveBorrowServiceImpl implements IArchiveBorrowService {
    @Autowired
    private ArchiveBorrowMapper archiveBorrowMapper;

    @Override
    public List<Long> getArchiveBorrowList(ArchiveInfo archiveInfo) {
        String[] dataPermiList =selectSearchByDataPermit();
        List<Long> archiveBorrowList = archiveBorrowMapper.getArchiveBorrowList(archiveInfo,dataPermiList);
        return archiveBorrowList;
    }

    @Override
    public SearchJson getArchiveBorrowListAll(SearchJson searchJson) {
        String[] dataPermiList =selectSearchByDataPermit();
        int pageNum = searchJson.getPageNum();
        int pageSize = searchJson.getPageSize();
        int offset = (pageNum - 1) * pageSize;
        String categoryId = searchJson.getCategoryId();
        String archiveNumber = searchJson.getArchiveNumber();
        String field9 = searchJson.getField9();

        List<ArchiveInfo> archiveBorrowListAll = archiveBorrowMapper.getArchiveBorrowListAll(categoryId,archiveNumber,field9,pageSize,offset,dataPermiList);
        int total = archiveBorrowMapper.getArchiveBorrowCount(categoryId,archiveNumber,field9,dataPermiList);
        searchJson.setTotal(total);
        searchJson.setSearchResults(archiveBorrowListAll);
        return searchJson;
    }

    @Override
    public SysUser getArchiveBorrowUser() {
        return SecurityUtils.getLoginUser().getUser();
    }

    public String[] selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if("all".equals(currentUser.getDataPermi())){
            dataPermiList = new String[0];
        }else {
            dataPermiList = (currentUser.getDataPermi().split(","));
        }
        return dataPermiList;
    }
}
