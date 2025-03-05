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

    /** 档号字段 */
    @Excel(name = "档号字段")
    private String ruleItem;

    /** 间隔符 */
    @Excel(name = "间隔符")
    private String ruleJoin;

    /** 补位字段 */
    @Excel(name = "补位字段")
    private String itemName;

    /** 补位数 */
    @Excel(name = "补位数")
    private String numberCount;

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
    public void setItemName(String itemName) 
    {
        this.itemName = itemName;
    }

    public String getItemName() 
    {
        return itemName;
    }
    public void setNumberCount(String numberCount) 
    {
        this.numberCount = numberCount;
    }

    public String getNumberCount() 
    {
        return numberCount;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("ruleItem", getRuleItem())
            .append("ruleJoin", getRuleJoin())
            .append("itemName", getItemName())
            .append("numberCount", getNumberCount())
            .toString();
    }
}
