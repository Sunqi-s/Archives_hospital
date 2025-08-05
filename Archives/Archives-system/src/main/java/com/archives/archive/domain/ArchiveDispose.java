package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 处置记录对象 archive_dispose
 *
 * @author é«å°å·
 * @date 2025-08-04
 */
public class ArchiveDispose extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 档案id */
    @Excel(name = "档案id")
    private Long archiveId;

    /** 档案分类id */
    private Long categoryId;

    /** 题名 */
    @Excel(name = "题名")
    private String title;

    /** 档号 */
    @Excel(name = "档号")
    private String archiveNumber;

    private String categoryName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setArchiveId(Long archiveId)
    {
        this.archiveId = archiveId;
    }

    public Long getArchiveId()
    {
        return archiveId;
    }
    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setArchiveNumber(String archiveNumber)
    {
        this.archiveNumber = archiveNumber;
    }

    public String getArchiveNumber()
    {
        return archiveNumber;
    }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("archiveId", getArchiveId())
            .append("categoryId", getCategoryId())
            .append("title", getTitle())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("archiveNumber", getArchiveNumber())
            .append("categoryName", getCategoryName())
            .toString();
    }
}
