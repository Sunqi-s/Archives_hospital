package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.mapper.ArchiveSearchMapper;
import com.archives.archive.service.ArchiveSearchService;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class ArchiveSearchServiceImpl implements ArchiveSearchService {

    @Autowired
    private ArchiveSearchMapper archiveSearchMapper;

    @Override
    public List<SearchJson> getSearchList(SearchJson searchJson) {
        String[] dataPermiList =selectSearchByDataPermit();
        List<SearchJson> a;
        String keyWord = searchJson.getKeyWord();
        List<String> value = searchJson.getValue();
        a = archiveSearchMapper.getSearchList(keyWord, value, dataPermiList);
        return a;
    }

    public String[] selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if("all".equals(currentUser.getDataPermi())){
            dataPermiList = new String[0];
        }else {
            dataPermiList = (currentUser.getDataPermi().split(","));
            for (int i = 0; i < dataPermiList.length; i++){
                dataPermiList[i] = "%" + dataPermiList[i] + "%";
            }
        }
        return dataPermiList;
    }

    @Override
    public SearchJson getSearchListAll(SearchJson searchJson) {
        String[] dataPermiList =selectSearchByDataPermit();
        SearchJson searchJson1 = new SearchJson();
        int pageNum = searchJson.getPageNum();
        int pageSize = searchJson.getPageSize();
        int offset = (pageNum - 1) * pageSize;
        String keyWord = searchJson.getKeyWord();
        List<String> value = searchJson.getValue();
        String categoryId = searchJson.getCategoryId();
        List<ArchiveInfo> searchListAll = archiveSearchMapper.getSearchListAll(keyWord, categoryId,pageSize,offset, dataPermiList);
        int total = archiveSearchMapper.getSearchListAllCount(keyWord,  categoryId, dataPermiList);
        searchJson1.setTotal(total);
        searchJson1.setSearchResults(searchListAll);
        return searchJson1;
    }
}
