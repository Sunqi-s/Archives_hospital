package com.archives.archive.domain.template;

import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

public class YewuJuannei extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @Excel(name = "件号!")
    private String item_number;

    @Excel(name = "责任者")
    private String field19;

    @Excel(name = "文件编号")
    private String field20;

    @Excel(name = "题名!")
    private String field2;

    @Excel(name = "日期!")
    private String field21;

    @Excel(name = "页数!")
    private String field22;

    @Excel(name = "备注")
    private String remarks;

    @Excel(name = "全宗号!")
    private String fonds_number;

    @Excel(name = "全宗名称!")
    private String fonds_name;

    @Excel(name = "门类代码!")
    private String category_code;

    @Excel(name = "门类名称!")
    private String field3;

    @Excel(name = "项目号!")
    private String field6;

    @Excel(name = "案卷号!")
    private String field23;

    @Excel(name = "档号!")
    private String archive_number;

    @Excel(name = "案卷档号!")
    private String field1;
}
