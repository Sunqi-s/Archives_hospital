package com.archives.archive.service;


import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.domain.HomeData;

import java.util.List;

public interface IHomePageService {


    public int getData(HomeData homeData);

    public List<HomeData> get();

    public HomeData importData();

    public HomeData importOss();
}
