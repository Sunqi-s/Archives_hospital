package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
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
    public List<SearchJson> getSearchList(SearchJson searchJson) {
        List<SearchJson> a;
        String keyWord = searchJson.getKeyWord();
        List<String> value = searchJson.getValue();
        if (value.isEmpty()){
            value.add("0");
            value.add("1");
            value.add("2");
        }
        a = archiveSearchMapper.getSearchList(keyWord, value);
        return a;
    }

    @Override
    public SearchJson getSearchListAll(SearchJson searchJson) {
        SearchJson searchJson1 = new SearchJson();
        int pageNum = searchJson.getPageNum();
        int pageSize = searchJson.getPageSize();
        int offset = (pageNum - 1) * pageSize;
        String keyWord = searchJson.getKeyWord();
        List<String> value = searchJson.getValue();
        String categoryId = searchJson.getCategoryId();
        if (value.isEmpty()){
            value.add("0");
            value.add("1");
            value.add("2");
        }
        List<ArchiveInfo> searchListAll = archiveSearchMapper.getSearchListAll(keyWord, value, categoryId,pageSize,offset);
        int total = archiveSearchMapper.getSearchListAllCount(keyWord, value, categoryId);
        searchJson1.setTotal(total);
        searchJson1.setSearchResults(searchListAll);
        return searchJson1;
    }
}
