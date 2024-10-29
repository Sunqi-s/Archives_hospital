package com.archives.web.controller.archive;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.service.ArchiveSearchService;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.page.TableDataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

import static com.archives.common.utils.PageUtils.startPage;

@RestController
@RequestMapping("/archive/search")
public class ArchiveSearchController extends BaseController {
    @Autowired
    private ArchiveSearchService archiveSearchService;

//    @PreAuthorize("@ss.hasAnyPermi('archive:search:list')")
    @PostMapping("/list/")
    public List<SearchJson> getSearchList(@RequestBody SearchJson searchJson){
        return archiveSearchService.getSearchList(searchJson);
    }

//    @PreAuthorize("@ss.hasAnyPermi('archive:search:list')")
    @PostMapping("/list/all/")
    public SearchJson getSearchListAll(@RequestBody SearchJson searchJson){
        return archiveSearchService.getSearchListAll(searchJson);
    }
}
