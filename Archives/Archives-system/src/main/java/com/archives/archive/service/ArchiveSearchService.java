package com.archives.archive.service;

import com.archives.archive.domain.ArchiveInfo;

import java.util.List;


public interface ArchiveSearchService {
    public List<ArchiveInfo> getSearchList(String keyword);
}
