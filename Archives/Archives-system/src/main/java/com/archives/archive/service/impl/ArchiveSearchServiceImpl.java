package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.mapper.ArchiveSearchMapper;
import com.archives.archive.service.ArchiveSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArchiveSearchServiceImpl implements ArchiveSearchService {

    @Autowired
    private ArchiveSearchMapper archiveSearchMapper;
    @Override
    public List<ArchiveInfo> getSearchList(String keyword) {
        System.out.println("keyword: " + keyword);
        return archiveSearchMapper.getSearchList(keyword);
    }
}
