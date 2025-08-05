package com.archives.archive.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * ArchiveBorrow对象 archive_borrow
 *
 * @author é«å°å·
 * @date 2025-07-31
 */
public class ArchiveBorrow extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Long id;

    /** 借阅人 */
    @Excel(name = "借阅人")
    private String borrower;

    /** 申请人 */
    @Excel(name = "申请人")
    private String applicant;

    /** 借阅时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "借阅时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date borrowingTime;

    /** 档号 */
    @Excel(name = "档号")
    private String archiveNumber;

    /** 题名 */
    @Excel(name = "题名")
    private String title;

    /** 借阅目的 */
    @Excel(name = "借阅目的")
    private String borrowingPurpose;

    /** 归还时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "归还时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date returnTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setBorrower(String borrower)
    {
        this.borrower = borrower;
    }

    public String getBorrower()
    {
        return borrower;
    }
    public void setApplicant(String applicant)
    {
        this.applicant = applicant;
    }

    public String getApplicant()
    {
        return applicant;
    }
    public void setBorrowingTime(Date borrowingTime)
    {
        this.borrowingTime = borrowingTime;
    }

    public Date getBorrowingTime()
    {
        return borrowingTime;
    }
    public void setArchiveNumber(String archiveNumber)
    {
        this.archiveNumber = archiveNumber;
    }

    public String getArchiveNumber()
    {
        return archiveNumber;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setBorrowingPurpose(String borrowingPurpose)
    {
        this.borrowingPurpose = borrowingPurpose;
    }

    public String getBorrowingPurpose()
    {
        return borrowingPurpose;
    }
    public void setReturnTime(Date returnTime)
    {
        this.returnTime = returnTime;
    }

    public Date getReturnTime()
    {
        return returnTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("borrower", getBorrower())
                .append("applicant", getApplicant())
                .append("borrowingTime", getBorrowingTime())
                .append("archiveNumber", getArchiveNumber())
                .append("title", getTitle())
                .append("borrowingPurpose", getBorrowingPurpose())
                .append("returnTime", getReturnTime())
                .toString();
    }
}
