package com.archives.archive.domain;


import java.util.List;

public class SearchJson {
        private String keyWord;
        private List<String> value;
        private String categoryId;
        private String length;
        private int pageNum;
        private int pageSize;
        private int total;
        private List<ArchiveInfo> searchResults;

    public SearchJson() {
    }

    public SearchJson(String keyWord, List<String> value, String categoryId, String length, int pageNum, int pageSize, int total, List<ArchiveInfo> searchResults) {
        this.keyWord = keyWord;
        this.value = value;
        this.categoryId = categoryId;
        this.length = length;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.total = total;
        this.searchResults = searchResults;
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
                ", searchResults=" + searchResults +
                '}';
    }
}
