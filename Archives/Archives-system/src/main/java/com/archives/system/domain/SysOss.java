package com.archives.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 文件上传对象 sys_oss
 * 
 * @author archives
 * @date 2024-07-05
 */
public class SysOss extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 文件路径 */
    private String path;

    /** URL地址 */
    @Excel(name = "URL地址")
    private String url;

    /** 文件名 */
    private String name;

    /** 文件大小 */
    private String size;

    /** 关联ID */
    private String fid;

    /** 文件后缀 */
    private String suffix;

    /** 删除标志 0：否 1：是 */
    private Long deleteFlg;

    /** 删除时间 */
    private Date deleteDate;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPath(String path) 
    {
        this.path = path;
    }

    public String getPath() 
    {
        return path;
    }
    public void setUrl(String url) 
    {
        this.url = url;
    }

    public String getUrl() 
    {
        return url;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setSize(String size) 
    {
        this.size = size;
    }

    public String getSize() 
    {
        return size;
    }
    public void setFid(String fid) 
    {
        this.fid = fid;
    }

    public String getFid() 
    {
        return fid;
    }
    public void setSuffix(String suffix) 
    {
        this.suffix = suffix;
    }

    public String getSuffix() 
    {
        return suffix;
    }
    public void setDeleteFlg(Long deleteFlg) 
    {
        this.deleteFlg = deleteFlg;
    }

    public Long getDeleteFlg() 
    {
        return deleteFlg;
    }
    public void setDeleteDate(Date deleteDate) 
    {
        this.deleteDate = deleteDate;
    }

    public Date getDeleteDate() 
    {
        return deleteDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("path", getPath())
            .append("url", getUrl())
            .append("name", getName())
            .append("size", getSize())
            .append("fid", getFid())
            .append("suffix", getSuffix())
            .append("deleteFlg", getDeleteFlg())
            .append("deleteDate", getDeleteDate())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
