package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 保存对于文书的年度或科技的类型的对象 archive_fit
 *
 * @author é«å°å·
 * @date 2024-12-02
 */
public class ArchiveFit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 年度表的id */
    private Long id;

    /** 存储的category_id */
    private Integer categoryId;

    /** 存储的字段(文书是年度、科技是类型) */
    @Excel(name = "存储的字段(文书是年度、科技是类型)")
    private String syllable;

    private String query;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCategoryId(Integer categoryId)
    {
        this.categoryId = categoryId;
    }

    public Integer getCategoryId()
    {
        return categoryId;
    }
    public void setSyllable(String syllable)
    {
        this.syllable = syllable;
    }

    public String getSyllable()
    {
        return syllable;
    }

    public String getQuery() {return query;}

    public void setQuery(String query) {this.query = query;}

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("syllable", getSyllable())
            .append("query", getQuery())
            .toString();
    }
}
