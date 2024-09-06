package com.archives.archive.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 数据导入日志对象 archive_import_log
 *
 * @author 孙
 * @date 2024-08-30
 */
public class ArchiveImportLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键，自增,任务ID，用于标识唯一的导入任务 */
    private Long id;

    /** 总体导入状态（pending、in_progress、completed、failed） */
    @Excel(name = "总体导入状态", readConverterExp = "p=ending、in_progress、completed、failed")
    private String status;

    /** info的插入数 */
    @Excel(name = "info的插入数")
    private Long infoProcessedRecords;

    /** oss表的插入数 */
    @Excel(name = "oss表的插入数")
    private Long ossProcessedRecords;

    /** 开始时间 */
//    @JsonFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy/MM/dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy/MM/dd HH:mm:ss")
    private Date startTime;

    /** 结束时间（可为空） */
    @Excel(name = "结束时间", readConverterExp = "可=为空")
    private Date endTime;

    /** 错误信息（可为空） */
    @Excel(name = "错误信息", readConverterExp = "可=为空")
    private String errorMessage;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setInfoProcessedRecords(Long infoProcessedRecords)
    {
        this.infoProcessedRecords = infoProcessedRecords;
    }

    public Long getInfoProcessedRecords()
    {
        return infoProcessedRecords;
    }
    public void setOssProcessedRecords(Long ossProcessedRecords)
    {
        this.ossProcessedRecords = ossProcessedRecords;
    }

    public Long getOssProcessedRecords()
    {
        return ossProcessedRecords;
    }
    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getStartTime()
    {
        return startTime;
    }
    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }
    public void setErrorMessage(String errorMessage)
    {
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage()
    {
        return errorMessage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("status", getStatus())
            .append("infoProcessedRecords", getInfoProcessedRecords())
            .append("ossProcessedRecords", getOssProcessedRecords())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("errorMessage", getErrorMessage())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
