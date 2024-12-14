package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 所属字段设置对象 category_fit
 * 
 * @author é«å°å·
 * @date 2024-12-14
 */
public class CategoryFit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 档案id */
    @Excel(name = "档案id")
    private Long categoryId;

    /** 所属字段 */
    @Excel(name = "所属字段")
    private String query;

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
    public void setQuery(String query) 
    {
        this.query = query;
    }

    public String getQuery() 
    {
        return query;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("query", getQuery())
            .toString();
    }
}
