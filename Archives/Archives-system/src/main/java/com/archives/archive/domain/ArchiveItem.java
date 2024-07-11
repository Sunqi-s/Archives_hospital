package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 档案信息模板对象 archive_item
 *
 * @author 高小川
 * @date 2024-07-06
 */
public class ArchiveItem extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 分类ID */
    private Long categoryId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String itemName;

    /** 项目类型 */
    @Excel(name = "项目类型")
    private String itemType;

    /** 列名称 */
    @Excel(name = "列名称")
    private String columnName;

    /** 列类型 */
    @Excel(name = "字段类型")
    private String columnType;

    /** 字段长度 */
    @Excel(name = "字段长度")
    private Long columnLength;

    /** 是否必填（1是） */
    @Excel(name = "是否必填", readConverterExp = "1=是")
    private String isRequired;

    /** 是否为插入字段（1是） */
    @Excel(name = "是否为插入字段", readConverterExp = "1=是")
    private String isInsert;

    /** 是否编辑字段（1是） */
    @Excel(name = "是否编辑字段", readConverterExp = "1=是")
    private String isEdit;

    /** 是否列表字段（1是） */
    @Excel(name = "是否列表字段", readConverterExp = "1=是")
    private String isList;

    /** 是否查询字段（1是） */
    @Excel(name = "是否查询字段", readConverterExp = "1=是")
    private String isQuery;

    /** 查询方式（等于、不等于、大于、小于、范围） */
    @Excel(name = "查询方式", readConverterExp = "等=于、不等于、大于、小于、范围")
    private String queryType;

    /** 显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件） */
    @Excel(name = "显示类型", readConverterExp = "文=本框、文本域、下拉框、复选框、单选框、日期控件")
    private String htmlType;

    /** 字典类型 */
    @Excel(name = "字典类型")
    private String dictType;

    /** 页面显示分组 */
    @Excel(name = "页面显示分组")
    private String htmlGroup;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
    }
    public void setItemName(String itemName)
    {
        this.itemName = itemName;
    }

    public String getItemName()
    {
        return itemName;
    }
    public void setItemType(String itemType)
    {
        this.itemType = itemType;
    }

    public String getItemType()
    {
        return itemType;
    }
    public void setColumnName(String columnName)
    {
        this.columnName = columnName;
    }

    public String getColumnName()
    {
        return columnName;
    }
    public void setColumnLength(Long columnLength)
    {
        this.columnLength = columnLength;
    }

    public Long getColumnLength()
    {
        return columnLength;
    }
    public void setIsRequired(String isRequired)
    {
        this.isRequired = isRequired;
    }

    public String getIsRequired()
    {
        return isRequired;
    }
    public void setIsInsert(String isInsert)
    {
        this.isInsert = isInsert;
    }

    public String getIsInsert()
    {
        return isInsert;
    }
    public void setIsEdit(String isEdit)
    {
        this.isEdit = isEdit;
    }

    public String getIsEdit()
    {
        return isEdit;
    }
    public void setIsList(String isList)
    {
        this.isList = isList;
    }

    public String getIsList()
    {
        return isList;
    }
    public void setIsQuery(String isQuery)
    {
        this.isQuery = isQuery;
    }

    public String getIsQuery()
    {
        return isQuery;
    }
    public void setQueryType(String queryType)
    {
        this.queryType = queryType;
    }

    public String getQueryType()
    {
        return queryType;
    }
    public void setHtmlType(String htmlType)
    {
        this.htmlType = htmlType;
    }

    public String getHtmlType()
    {
        return htmlType;
    }
    public void setDictType(String dictType)
    {
        this.dictType = dictType;
    }

    public String getDictType()
    {
        return dictType;
    }
    public void setHtmlGroup(String htmlGroup)
    {
        this.htmlGroup = htmlGroup;
    }

    public String getHtmlGroup()
    {
        return htmlGroup;
    }
    public void setSort(Long sort)
    {
        this.sort = sort;
    }

    public String getColumnType() {
        return columnType;
    }
    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public Long getSort()
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("itemName", getItemName())
            .append("itemType", getItemType())
            .append("columnName", getColumnName())
            .append("columnType", getColumnType())
            .append("columnLength", getColumnLength())
            .append("isRequired", getIsRequired())
            .append("isInsert", getIsInsert())
            .append("isEdit", getIsEdit())
            .append("isList", getIsList())
            .append("isQuery", getIsQuery())
            .append("queryType", getQueryType())
            .append("htmlType", getHtmlType())
            .append("dictType", getDictType())
            .append("htmlGroup", getHtmlGroup())
            .append("sort", getSort())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
