package com.archives.archive.domain;


import java.util.Arrays;
import java.util.List;

public class SearchJson {
        private String keyWord;
        private List<String> value;
        private String categoryId;
        private String length;
        private int pageNum;
        private int pageSize;
        private int total;
        private String archiveNumber;
        private String field9;
        private List<ArchiveInfo> searchResults;
        private String path;
        private String categoryName;
        private String archiveStatus;
        private Long[] ids;

    public SearchJson() {
    }

    public SearchJson(String keyWord, List<String> value, String categoryId, String length, int pageNum, int pageSize, int total, String archiveNumber, String field9, List<ArchiveInfo> searchResults, String path, String categoryName, String archiveStatus, Long[] ids) {
        this.keyWord = keyWord;
        this.value = value;
        this.categoryId = categoryId;
        this.length = length;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.total = total;
        this.archiveNumber = archiveNumber;
        this.field9 = field9;
        this.searchResults = searchResults;
        this.path = path;
        this.categoryName = categoryName;
        this.archiveStatus = archiveStatus;
        this.ids = ids;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public List<String> getValue() {
        return value;
    }

    public void setValue(List<String> value) {
        this.value = value;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<ArchiveInfo> getSearchResults() {
        return searchResults;
    }

    public void setSearchResults(List<ArchiveInfo> searchResults) {
        this.searchResults = searchResults;
    }

    public String getArchiveNumber() {
        return archiveNumber;
    }

    public void setArchiveNumber(String archiveNumber) {
        this.archiveNumber = archiveNumber;
    }

    public String getField9() {
        return field9;
    }

    public void setField9(String field9) {
        this.field9 = field9;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getArchiveStatus() {
        return archiveStatus;
    }

    public void setArchiveStatus(String archiveStatus) {
        this.archiveStatus = archiveStatus;
    }

    public Long[] getIds() {
        return ids;
    }

    public void setIds(Long[] ids) {
        this.ids = ids;
    }

    @Override
    public String toString() {
        return "SearchJson{" +
                "keyWord='" + keyWord + '\'' +
                ", value=" + value +
                ", categoryId='" + categoryId + '\'' +
                ", length='" + length + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", total=" + total +
                ", archiveNumber='" + archiveNumber + '\'' +
                ", field9='" + field9 + '\'' +
                ", searchResults=" + searchResults +
                ", path='" + path + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", archiveStatus='" + archiveStatus + '\'' +
                ", ids=" + Arrays.toString(ids) +
                '}';
    }
}
