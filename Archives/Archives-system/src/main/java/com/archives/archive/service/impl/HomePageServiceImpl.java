package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveCategory;
import com.archives.archive.domain.ArchiveImportLog;
import com.archives.archive.domain.HomeData;
import com.archives.archive.mapper.ArchiveCategoryMapper;
import com.archives.archive.mapper.HomePageMapper;
import com.archives.archive.service.IHomePageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class HomePageServiceImpl implements IHomePageService {

    @Autowired
    private HomePageMapper homePageMapper;
    @Autowired
    private ArchiveCategoryMapper archiveCategoryMapper;

    @Override
    public int getData(HomeData homeData) {
        int archiveStatus = Integer.parseInt(homeData.getStatus());
        int data = 0;

        switch (homeData.getTime()) {
            case "上月":
                data = homePageMapper.lastMonth(archiveStatus);
                break;
            case "本月":
                data = homePageMapper.thisMonth(archiveStatus);
                break;
            case "本年":
                data = homePageMapper.thisYear(archiveStatus);
                break;
            case "全部":
                data = homePageMapper.all(archiveStatus);
                break;
            default:
                System.out.println("Invalid time!");
        }

        return data;
    }

    @Override
    public List<HomeData> get() {
        List<ArchiveCategory>  archiveCategoryList = archiveCategoryMapper.selectArchiveCategoryList(new ArchiveCategory());
        List<HomeData> homeDataList = new ArrayList<>();
        archiveCategoryList.forEach(archiveCategory -> {
            HomeData homeData = new HomeData();
            if(archiveCategory.getType() == 0){
                homeData.setId(archiveCategory.getId());
                homeData.setName(archiveCategory.getName());
                homeDataList.add(homeData);
            }else {
                int count = homePageMapper.selectHomeData(archiveCategory.getId());
                homeDataList.forEach(homeData1 -> {
                    if(homeData1.getId() == archiveCategory.getParentId()){
                        homeData1.setValue(homeData1.getValue() + count);
                    }
                });
            }
        });
        return homeDataList;
    }

    @Override
    public HomeData importData() {
        HomeData homeData = new HomeData();
        List<Integer> i = new ArrayList<>();
        List<Integer> j = new ArrayList<>();
        List<HomeData> archiveImportLogList1 = homePageMapper.importData1();
        for (int k = 0; k < 12; k++) {
            boolean found = false; // 用于标记是否找到匹配
            for (HomeData archiveImportLog1 : archiveImportLogList1) {
                if (archiveImportLog1.getTime().equals(String.valueOf(k + 1))) { // 使用 equals 比较字符串
                    i.add(archiveImportLog1.getValue());
                    found = true; // 找到匹配
                    break; // 找到后可以退出内层循环
                }
            }
            if (!found) {
                i.add(0); // 如果没有找到匹配，则添加 0
            }
        }
        List<HomeData> archiveImportLogList2 = homePageMapper.importData2();
        for (int l = 0; l < 12; l++) {
            boolean found = false; // 用于标记是否找到匹配
            for (HomeData archiveImportLog2 : archiveImportLogList2) {
                if (archiveImportLog2.getTime().equals(String.valueOf(l + 1))) { // 使用 equals 比较字符串
                    j.add(archiveImportLog2.getValue());
                    found = true; // 找到匹配
                    break; // 找到后可以退出内层循环
                }
            }
            if (!found) {
                j.add(0); // 如果没有找到匹配，则添加 0
            }
        }
        homeData.setList1(i);
        homeData.setList2(j);
        return homeData;
    }

    @Override
    public HomeData importOss(){
        HomeData homeData = new HomeData();
        homeData.setValue(homePageMapper.importOss());
        return homeData;
    }
}
