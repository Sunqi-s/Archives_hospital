package com.archives.archive.domain.template;

import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

public class WenShu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Excel(name = "件号!")
    private String item_number;

    @Excel(name = "责任者")
    private String field5;

    @Excel(name = "文件编号")
    private String field4;

    @Excel(name = "题名!")
    private String field3;

    @Excel(name = "日期!")
    private String field6;

    @Excel(name = "密级")
    private String field8;

    @Excel(name = "页数!")
    private String field11;

    @Excel(name = "备注")
    private String remarks;

    @Excel(name = "盒号!")
    private String field9;

    @Excel(name = "全宗号!")
    private String fonds_number;

    @Excel(name = "全宗名称!")
    private String fonds_name;

    @Excel(name = "年度!")
    private String field1;

    @Excel(name = "保管期限!")
    private String retention_period;

    @Excel(name = "机构或问题!")
    private String field12;

    @Excel(name = "档号!")
    private String archive_number;

    @Excel(name = "保管期限缩写!")
    private String field7;

    @Excel(name = "门类代码!")
    private String category_code;

    @Excel(name = "门类名称!")
    private String field2;

    @Excel(name = "机构问题缩写!")
    private String field10;


}
