package com.archives.archive.domain;

import java.util.List;

public class Statistics {
    private int logCount;
    private int dataCount;
    private List<String> typeList;
    private List<Integer> logCountList;
    private List<Integer> dataCountList;
    public String startData;
    public String endData;
    private String category;
    private int archiveCount;
    private int fileCount;
    private Long totalSize;
    private String year;
    private int select;
    private String condition ;


    public Statistics() {
    }

    public Statistics(int logCount, int dataCount, List<String> typeList, List<Integer> logCountList, List<Integer> dataCountList, String startData, String endData, String category, int archiveCount, int fileCount, Long totalSize, String year, int select, String condition) {
        this.logCount = logCount;
        this.dataCount = dataCount;
        this.typeList = typeList;
        this.logCountList = logCountList;
        this.dataCountList = dataCountList;
        this.startData = startData;
        this.endData = endData;
        this.category = category;
        this.archiveCount = archiveCount;
        this.fileCount = fileCount;
        this.totalSize = totalSize;
        this.year = year;
        this.select = select;
        this.condition = condition;
    }

    public String getStartData() {
        return startData;
    }

    public void setStartData(String startData) {
        this.startData = startData;
    }

    public String getEndData() {
        return endData;
    }

    public void setEndData(String endData) {
        this.endData = endData;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getArchiveCount() {
        return archiveCount;
    }

    public void setArchiveCount(int archiveCount) {
        this.archiveCount = archiveCount;
    }

    public int getFileCount() {
        return fileCount;
    }

    public void setFileCount(int fileCount) {
        this.fileCount = fileCount;
    }

    public Long getTotalSize() {
        return totalSize;
    }

    public void setTotalSize(Long totalSize) {
        this.totalSize = totalSize;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public int getSelect() {
        return select;
    }

    public void setSelect(int select) {
        this.select = select;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public List<Integer> getDataCountList() {
        return dataCountList;
    }

    public void setDataCountList(List<Integer> dataCountList) {
        this.dataCountList = dataCountList;
    }

    public int getLogCount() {
        return logCount;
    }

    public void setLogCount(int logCount) {
        this.logCount = logCount;
    }

    public int getDataCount() {
        return dataCount;
    }

    public void setDataCount(int dataCount) {
        this.dataCount = dataCount;
    }

    public List<String> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<String> typeList) {
        this.typeList = typeList;
    }

    public List<Integer> getLogCountList() {
        return logCountList;
    }

    public void setLogCountList(List<Integer> logCountList) {
        this.logCountList = logCountList;
    }

    @Override
    public String toString() {
        return "Statistics{" +
                "logCount=" + logCount +
                ", dataCount=" + dataCount +
                ", typeList=" + typeList +
                ", logCountList=" + logCountList +
                ", dataCountList=" + dataCountList +
                ", startData='" + startData + '\'' +
                ", endData='" + endData + '\'' +
                ", category='" + category + '\'' +
                ", archiveCount=" + archiveCount +
                ", fileCount=" + fileCount +
                ", totalSize=" + totalSize +
                ", year='" + year + '\'' +
                ", select=" + select +
                ", condition='" + condition + '\'' +
                '}';
    }
}
