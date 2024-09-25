package com.archives.archive.service;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;

import java.util.List;


public interface ArchiveSearchService {
    public List<SearchJson> getSearchList(SearchJson searchJson);

    public SearchJson getSearchListAll(SearchJson SearchJson);
}
