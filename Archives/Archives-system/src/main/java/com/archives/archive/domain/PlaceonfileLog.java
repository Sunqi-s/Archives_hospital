package com.archives.archive.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * placeonlog对象 placeonfile_log
 * 
 * @author é«å°å·
 * @date 2024-12-26
 */
public class PlaceonfileLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 归档id */
    private Long placeonfileId;

    /** 归档文件数量 */
    @Excel(name = "归档文件数量")
    private Long placeonfileInfo;

    /** 文件id */
    private String infoId;

    /** 归档人 */
    @Excel(name = "归档人")
    private String placeonfileBy;

    /** 数据权限 */
    private String dataPermit;

    /** 类型 */
    private String type;

    /** 单号 */
    @Excel(name = "单号")
    private Long oddNumbers;

    public void setPlaceonfileId(Long placeonfileId) 
    {
        this.placeonfileId = placeonfileId;
    }

    public Long getPlaceonfileId() 
    {
        return placeonfileId;
    }
    public void setPlaceonfileInfo(Long placeonfileInfo) 
    {
        this.placeonfileInfo = placeonfileInfo;
    }

    public Long getPlaceonfileInfo() 
    {
        return placeonfileInfo;
    }
    public void setInfoId(String infoId) 
    {
        this.infoId = infoId;
    }

    public String getInfoId() 
    {
        return infoId;
    }
    public void setPlaceonfileBy(String placeonfileBy) 
    {
        this.placeonfileBy = placeonfileBy;
    }

    public String getPlaceonfileBy() 
    {
        return placeonfileBy;
    }
    public void setDataPermit(String dataPermit) 
    {
        this.dataPermit = dataPermit;
    }

    public String getDataPermit() 
    {
        return dataPermit;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setOddNumbers(Long oddNumbers) 
    {
        this.oddNumbers = oddNumbers;
    }

    public Long getOddNumbers() 
    {
        return oddNumbers;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("placeonfileId", getPlaceonfileId())
            .append("placeonfileInfo", getPlaceonfileInfo())
            .append("infoId", getInfoId())
            .append("placeonfileBy", getPlaceonfileBy())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("dataPermit", getDataPermit())
            .append("type", getType())
            .append("oddNumbers", getOddNumbers())
            .toString();
    }
}
