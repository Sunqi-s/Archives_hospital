package com.archives.archive.domain;


import java.util.List;

public class HomeData {

    private List<Integer> list1;
    private List<Integer> list2;
    private String status;
    private String time;
    private String data;
    private String name;
    private  int value;
    private Long id;

    public HomeData(List<Integer> list1, List<Integer> list2, String status, String time, String data, String name, int value, Long id) {
        this.list1 = list1;
        this.list2 = list2;
        this.status = status;
        this.time = time;
        this.data = data;
        this.name = name;
        this.value = value;
        this.id = id;
    }

    public HomeData() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Integer> getList1() {
        return list1;
    }

    public void setList1(List<Integer> list1) {
        this.list1 = list1;
    }

    public List<Integer> getList2() {
        return list2;
    }

    public void setList2(List<Integer> list2) {
        this.list2 = list2;
    }

    @Override
    public String toString() {
        return "HomeData{" +
                "list1=" + list1 +
                ", list2=" + list2 +
                ", status='" + status + '\'' +
                ", time='" + time + '\'' +
                ", data='" + data + '\'' +
                ", name='" + name + '\'' +
                ", value=" + value +
                ", id=" + id +
                '}';
    }
}
