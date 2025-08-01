package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.TreeEntity;

/**
 * 档案分类对象 archive_category
 *
 * @author 高小川
 * @date 2024-07-13
 */
public class ArchiveCategory extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String name;

    /** 分类层级 */
    @Excel(name = "分类层级")
    private Long level;

    /** 类别：0档案节点，1档案库 */
    @Excel(name = "类别：0档案节点，1档案库")
    private Integer type;

    /** 显示状态：0显示，1隐藏 */
    @Excel(name = "显示状态：0显示，1隐藏")
    private Integer isActive;

    /** 密码 */
    private String password;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setLevel(Long level)
    {
        this.level = level;
    }

    public Long getLevel()
    {
        return level;
    }
    public void setType(Integer type)
    {
        this.type = type;
    }

    public Integer getType()
    {
        return type;
    }
    public void setIsActive(Integer isActive)
    {
        this.isActive = isActive;
    }

    public Integer getIsActive()
    {
        return isActive;
    }

    public void setPassword(String password) {this.password = password;}

    public String getPassword() {return password;}

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("parentId", getParentId())
                .append("parentName", getParentName())
                .append("level", getLevel())
                .append("type", getType())
                .append("isActive", getIsActive())
                .append("orderNum", getOrderNum())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("password", getPassword())
                .toString();
    }
}
