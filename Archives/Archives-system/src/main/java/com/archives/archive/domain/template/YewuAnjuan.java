package com.archives.archive.domain.template;

import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

public class YewuAnjuan extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Excel(name = "序号!")
    private String field24;

    @Excel(name = "题名!")
    private String field17;

    @Excel(name = "页数!")
    private String field25;

    @Excel(name = "日期!")
    private String field20;

    @Excel(name = "保管期限!")
    private String retention_period;

    @Excel(name = "备注")
    private String remarks;

    @Excel(name = "全宗号!")
    private String fonds_number;

    @Excel(name = "全宗名称!")
    private String fonds_name;

    @Excel(name = "门类代码!")
    private String category_code;

    @Excel(name = "门类名称!")
    private String field1;

    @Excel(name = "类别名称!")
    private String field3;

    @Excel(name = "项目号!")
    private String field4;

    @Excel(name = "案卷号!")
    private String field6;

    @Excel(name = "档号!")
    private String archive_number;

    @Excel(name = "项目档号!")
    private String field23;

    @Excel(name = "件数!")
    private String field26;
}
