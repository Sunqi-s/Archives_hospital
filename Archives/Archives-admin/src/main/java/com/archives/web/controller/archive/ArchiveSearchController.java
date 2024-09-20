package com.archives.web.controller.archive;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.service.ArchiveSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/archive/search")
public class ArchiveSearchController {
    @Autowired
    private ArchiveSearchService archiveSearchService;

    @PreAuthorize("@ss.hasAnyPermi('archive:search:list')")
    @GetMapping("/list/{keyword}")
    public List<ArchiveInfo> getSearchList(@PathVariable("keyword") String keyword){
        System.out.println("ControllerKeyword: " + keyword);
        return archiveSearchService.getSearchList(keyword);
    }
}
