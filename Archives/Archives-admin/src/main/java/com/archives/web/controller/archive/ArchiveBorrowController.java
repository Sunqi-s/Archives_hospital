package com.archives.web.controller.archive;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.service.IArchiveBorrowService;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.entity.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/archive/borrow")
public class ArchiveBorrowController extends BaseController {
    @Autowired
    private IArchiveBorrowService archiveBorrowService;

    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:list')")
    @PostMapping("/list/")
    public List<Long> getArchiveBorrowList(@RequestBody ArchiveInfo archiveInfo) {
        System.out.println("archiveInfo:" + archiveInfo);
        return archiveBorrowService.getArchiveBorrowList(archiveInfo);
    }

    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:list')")
    @PostMapping("/list/all/")
    public SearchJson getArchiveBorrowListAll(@RequestBody SearchJson searchJson){
        return archiveBorrowService.getArchiveBorrowListAll(searchJson);
    }
    @PreAuthorize("@ss.hasAnyPermi('archive:borrow:user')")
    @PostMapping("/user/")
    public SysUser getArchiveBorrowUser() {
        return archiveBorrowService.getArchiveBorrowUser();
    }



}
