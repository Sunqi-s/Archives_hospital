package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 档号规则对象 archive_rule
 *
 * @author é«å°å·
 * @date 2025-03-05
 */
public class ArchiveRule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 档号规则id */
    private Long id;

    /** 档案分类 */
    @Excel(name = "档案分类")
    private Long categoryId;

    /** 排序 */
    @Excel(name = "排序")
    private Integer ruleNumber;

    /** 档号字段 */
    @Excel(name = "档号字段")
    private String ruleItem;

    /** 字段 */
    @Excel(name = "字段")
    private String ruleColumn;

    /** 字段值 */
    @Excel(name = "字段值")
    private String ruleValue;

    /** 间隔符 */
    @Excel(name = "间隔符")
    private String ruleJoin;

    /** 处理方式 */
    @Excel(name = "处理方式")
    private String dealMethod;

    /** 补位数 */
    @Excel(name = "补位数")
    private String dealDetail;




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
    public void setRuleItem(String ruleItem)
    {
        this.ruleItem = ruleItem;
    }

    public String getRuleItem()
    {
        return ruleItem;
    }
    public void setRuleJoin(String ruleJoin)
    {
        this.ruleJoin = ruleJoin;
    }

    public String getRuleJoin()
    {
        return ruleJoin;
    }

    public String getRuleColumn() {
        return ruleColumn;
    }

    public void setRuleColumn(String ruleColumn) {
        this.ruleColumn = ruleColumn;
    }

    public String getRuleValue() {
        return ruleValue;
    }

    public void setRuleValue(String ruleValue) {
        this.ruleValue = ruleValue;
    }

    public Integer getRuleNumber() {
        return ruleNumber;
    }

    public void setRuleNumber(Integer ruleNumber) {
        this.ruleNumber = ruleNumber;
    }

    public String getDealMethod() {
        return dealMethod;
    }

    public void setDealMethod(String dealMethod) {
        this.dealMethod = dealMethod;
    }

    public String getDealDetail() {
        return dealDetail;
    }

    public void setDealDetail(String dealDetail) {
        this.dealDetail = dealDetail;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("ruleItem", getRuleItem())
            .append("ruleJoin", getRuleJoin())
            .append("dealMethod", getDealMethod())
            .append("dealDetail", getDealDetail())
            .toString();
    }
}
