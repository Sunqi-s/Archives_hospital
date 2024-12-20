package com.archives.archive.domain;

import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

import java.util.List;

public class StatisticsExport extends BaseEntity {

    @Excel(name = "类型")
    private String type;
    @Excel(name = "一月")
    private int january;
    @Excel(name = "二月")
    private int february;
    @Excel(name = "三月")
    private int march;
    @Excel(name = "四月")
    private int april;
    @Excel(name = "五月")
    private int may;
    @Excel(name = "六月")
    private int june;
    @Excel(name = "七月")
    private int july;
    @Excel(name = "八月")
    private int august;
    @Excel(name = "九月")
    private int september;
    @Excel(name = "十月")
    private int october;
    @Excel(name = "十一月")
    private int november;
    @Excel(name = "十二月")
    private int december;

    public StatisticsExport() {
    }

    public StatisticsExport(String type, int january, int february, int march, int april, int may, int june, int july, int august, int september, int october, int november, int december) {
        this.type = type;
        this.january = january;
        this.february = february;
        this.march = march;
        this.april = april;
        this.may = may;
        this.june = june;
        this.july = july;
        this.august = august;
        this.september = september;
        this.october = october;
        this.november = november;
        this.december = december;
    }

    public StatisticsExport(String type, List<Integer> list) {
        this.type = type;
        for (int i = 0; i < list.size(); i++) {
            switch (i) {
                case 0:
                    this.january = list.get(i);
                    break;
                case 1:
                    this.february = list.get(i);
                    break;
                case 2:
                    this.march = list.get(i);
                    break;
                case 3:
                    this.april = list.get(i);
                    break;
                case 4:
                    this.may = list.get(i);
                    break;
                case 5:
                    this.june = list.get(i);
                    break;
                case 6:
                    this.july = list.get(i);
                    break;
                case 7:
                    this.august = list.get(i);
                    break;
                case 8:
                    this.september = list.get(i);
                    break;
                case 9:
                    this.october = list.get(i);
                    break;
                case 10:
                    this.november = list.get(i);
                    break;
                case 11:
                    this.december = list.get(i);
                    break;
                default:
                    break;
            }
        }
    }


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getJanuary() {
        return january;
    }

    public void setJanuary(int january) {
        this.january = january;
    }

    public int getFebruary() {
        return february;
    }

    public void setFebruary(int february) {
        this.february = february;
    }

    public int getMarch() {
        return march;
    }

    public void setMarch(int march) {
        this.march = march;
    }

    public int getApril() {
        return april;
    }

    public void setApril(int april) {
        this.april = april;
    }

    public int getMay() {
        return may;
    }

    public void setMay(int may) {
        this.may = may;
    }

    public int getJune() {
        return june;
    }

    public void setJune(int june) {
        this.june = june;
    }

    public int getJuly() {
        return july;
    }

    public void setJuly(int july) {
        this.july = july;
    }

    public int getAugust() {
        return august;
    }

    public void setAugust(int august) {
        this.august = august;
    }

    public int getSeptember() {
        return september;
    }

    public void setSeptember(int september) {
        this.september = september;
    }

    public int getOctober() {
        return october;
    }

    public void setOctober(int october) {
        this.october = october;
    }

    public int getNovember() {
        return november;
    }

    public void setNovember(int november) {
        this.november = november;
    }

    public int getDecember() {
        return december;
    }

    public void setDecember(int december) {
        this.december = december;
    }

    @Override
    public String toString() {
        return "StatisticsExport{" +
                "type='" + type + '\'' +
                ", january=" + january +
                ", february=" + february +
                ", march=" + march +
                ", april=" + april +
                ", may=" + may +
                ", june=" + june +
                ", july=" + july +
                ", august=" + august +
                ", september=" + september +
                ", october=" + october +
                ", november=" + november +
                ", december=" + december +
                '}';
    }
}
