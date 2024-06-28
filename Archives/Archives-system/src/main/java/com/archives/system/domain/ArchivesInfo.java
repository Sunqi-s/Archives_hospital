package com.archives.system.domain;

import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;
import com.archives.common.core.domain.entity.SysDept;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 会计档案对象 archives_info
 *
 * @author archives
 * @date 2024-06-04
 */
public class ArchivesInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /**
     * 部门详情对象
     */
    private SysDept dept;

    /** 编码，由系统生成 */
    @Excel(name = "编码，由系统生成")
    private String code;

    /** 全宗号 */
    @Excel(name = "全宗号")
    private String fondsNumber;

    /** 全宗名称 */
    @Excel(name = "全宗名称")
    private String fondsName;

    /** 保管期限 */
    @Excel(name = "保管期限")
    private String retentionPeriod;

    /** 件号 */
    @Excel(name = "件号")
    private String itemNumber;

    /** 档号，由系统生成 */
    @Excel(name = "档号，由系统生成")
    private String archiveNumber;

    /** 归档部门 */
    @Excel(name = "归档部门")
    private String department;

    /** 归档人 */
    @Excel(name = "归档人")
    private String archivist;

    /** 归档时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "归档时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date archiveDate;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    /** 归档状态：0收发文，1待归档，2已归档 */
    @Excel(name = "归档状态：0收发文，1待归档，2已归档")
    private String archiveStatus;

    /** 附件 */
    @Excel(name = "附件")
    private String fid;

    /** 档案分类 */
    @Excel(name = "档案分类")
    private String archiveCategoryCode;

    /** 年度 */
    @Excel(name = "年度")
    private Integer year;

    /** 案卷号 */
    @Excel(name = "案卷号")
    private String caseNumber;

    /** 责任者 */
    @Excel(name = "责任者")
    private String responsibleParty;

    /** 密级 */
    @Excel(name = "密级")
    private String securityLevel;

    /** 目录号 */
    @Excel(name = "目录号")
    private String directoryNumber;

    /** 文件编号 */
    @Excel(name = "文件编号")
    private String fileNumber;

    /** 成文日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "成文日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date documentDate;

    /** 页数 */
    @Excel(name = "页数")
    private Integer pageCount;

    /** 档案搜索框 */
    private String archivesInput;

    /** 部门ID */
    @Excel(name = "部门ID")
    private Integer deptId;

    /** 归档人搜索框 */
    private String searchInput;

    /** 员工编码 */
    @Excel(name = "员工编码")
    private String employeeCode;

    /** 用户账号 */
    @Excel(name = "用户账号")
    private String userAccount;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phoneNumber;

    /** 归档人状态 */
    @Excel(name = "归档人状态")
    private String employeeStatus;

    /** 备用字段16 */
    private String field16;

    /** 备用字段17 */
    private String field17;

    /** 备用字段18 */
    private String field18;

    /** 备用字段19 */
    private String field19;

    /** 备用字段20 */
    private String field20;

    /** 备用字段21 */
    private String field21;

    /** 备用字段22 */
    private String field22;

    /** 备用字段23 */
    private String field23;

    /** 备用字段24 */
    private String field24;

    /** 备用字段25 */
    private String field25;

    /** 备用字段26 */
    private String field26;

    /** 备用字段27 */
    private String field27;

    /** 备用字段28 */
    private String field28;

    /** 备用字段29 */
    private String field29;

    /** 备用字段30 */
    private String field30;

    public SysDept getDept() {
        return dept;
    }

    public void setDept(SysDept dept) {
        this.dept = dept;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setCode(String code)
    {
        this.code = code;
    }

    public String getCode()
    {
        return code;
    }
    public void setFondsNumber(String fondsNumber)
    {
        this.fondsNumber = fondsNumber;
    }

    public String getFondsNumber()
    {
        return fondsNumber;
    }
    public void setFondsName(String fondsName)
    {
        this.fondsName = fondsName;
    }

    public String getFondsName()
    {
        return fondsName;
    }
    public void setRetentionPeriod(String retentionPeriod)
    {
        this.retentionPeriod = retentionPeriod;
    }

    public String getRetentionPeriod()
    {
        return retentionPeriod;
    }
    public void setItemNumber(String itemNumber)
    {
        this.itemNumber = itemNumber;
    }

    public String getItemNumber()
    {
        return itemNumber;
    }
    public void setArchiveNumber(String archiveNumber)
    {
        this.archiveNumber = archiveNumber;
    }

    public String getArchiveNumber()
    {
        return archiveNumber;
    }
    public void setDepartment(String department)
    {
        this.department = department;
    }

    public String getDepartment()
    {
        return department;
    }
    public void setArchivist(String archivist)
    {
        this.archivist = archivist;
    }

    public String getArchivist()
    {
        return archivist;
    }
    public void setArchiveDate(Date archiveDate)
    {
        this.archiveDate = archiveDate;
    }

    public Date getArchiveDate()
    {
        return archiveDate;
    }
    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getRemarks()
    {
        return remarks;
    }
    public void setArchiveStatus(String archiveStatus)
    {
        this.archiveStatus = archiveStatus;
    }

    public String getArchiveStatus()
    {
        return archiveStatus;
    }
    public void setFid(String fid)
    {
        this.fid = fid;
    }

    public String getFid()
    {
        return fid;
    }
    public void setArchiveCategoryCode(String archiveCategoryCode)
    {
        this.archiveCategoryCode = archiveCategoryCode;
    }

    public String getArchiveCategoryCode()
    {
        return archiveCategoryCode;
    }
    public void setYear(Integer year)
    {
        this.year = year;
    }

    public Integer getYear()
    {
        return year;
    }
    public void setCaseNumber(String caseNumber)
    {
        this.caseNumber = caseNumber;
    }

    public String getCaseNumber()
    {
        return caseNumber;
    }
    public void setResponsibleParty(String responsibleParty)
    {
        this.responsibleParty = responsibleParty;
    }

    public String getResponsibleParty()
    {
        return responsibleParty;
    }
    public void setSecurityLevel(String securityLevel)
    {
        this.securityLevel = securityLevel;
    }

    public String getSecurityLevel()
    {
        return securityLevel;
    }
    public void setDirectoryNumber(String directoryNumber)
    {
        this.directoryNumber = directoryNumber;
    }

    public String getDirectoryNumber()
    {
        return directoryNumber;
    }
    public void setFileNumber(String fileNumber)
    {
        this.fileNumber = fileNumber;
    }

    public String getFileNumber()
    {
        return fileNumber;
    }
    public void setDocumentDate(Date documentDate)
    {
        this.documentDate = documentDate;
    }

    public Date getDocumentDate()
    {
        return documentDate;
    }
    public void setPageCount(Integer pageCount)
    {
        this.pageCount = pageCount;
    }

    public Integer getPageCount()
    {
        return pageCount;
    }
    public void setArchivesInput(String archivesInput)
    {
        this.archivesInput = archivesInput;
    }

    public String getArchivesInput()
    {
        return archivesInput;
    }
    public void setDeptId(Integer deptId)
    {
        this.deptId = deptId;
    }

    public Integer getDeptId()
    {
        return deptId;
    }
    public void setSearchInput(String searchInput)
    {
        this.searchInput = searchInput;
    }

    public String getSearchInput()
    {
        return searchInput;
    }
    public void setEmployeeCode(String employeeCode)
    {
        this.employeeCode = employeeCode;
    }

    public String getEmployeeCode()
    {
        return employeeCode;
    }
    public void setUserAccount(String userAccount)
    {
        this.userAccount = userAccount;
    }

    public String getUserAccount()
    {
        return userAccount;
    }
    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber()
    {
        return phoneNumber;
    }
    public void setEmployeeStatus(String employeeStatus)
    {
        this.employeeStatus = employeeStatus;
    }

    public String getEmployeeStatus()
    {
        return employeeStatus;
    }
    public void setField16(String field16)
    {
        this.field16 = field16;
    }

    public String getField16()
    {
        return field16;
    }

    public void setField17(String field17)
    {
        this.field17 = field17;
    }

    public String getField17()
    {
        return field17;
    }
    public void setField18(String field18)
    {
        this.field18 = field18;
    }

    public String getField18()
    {
        return field18;
    }
    public void setField19(String field19)
    {
        this.field19 = field19;
    }

    public String getField19()
    {
        return field19;
    }
    public void setField20(String field20)
    {
        this.field20 = field20;
    }

    public String getField20()
    {
        return field20;
    }
    public void setField21(String field21)
    {
        this.field21 = field21;
    }

    public String getField21()
    {
        return field21;
    }
    public void setField22(String field22)
    {
        this.field22 = field22;
    }

    public String getField22()
    {
        return field22;
    }
    public void setField23(String field23)
    {
        this.field23 = field23;
    }

    public String getField23()
    {
        return field23;
    }
    public void setField24(String field24)
    {
        this.field24 = field24;
    }

    public String getField24()
    {
        return field24;
    }
    public void setField25(String field25)
    {
        this.field25 = field25;
    }

    public String getField25()
    {
        return field25;
    }
    public void setField26(String field26)
    {
        this.field26 = field26;
    }

    public String getField26()
    {
        return field26;
    }
    public void setField27(String field27)
    {
        this.field27 = field27;
    }

    public String getField27()
    {
        return field27;
    }
    public void setField28(String field28)
    {
        this.field28 = field28;
    }

    public String getField28()
    {
        return field28;
    }
    public void setField29(String field29)
    {
        this.field29 = field29;
    }

    public String getField29()
    {
        return field29;
    }
    public void setField30(String field30)
    {
        this.field30 = field30;
    }

    public String getField30()
    {
        return field30;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("code", getCode())
            .append("fondsNumber", getFondsNumber())
            .append("fondsName", getFondsName())
            .append("retentionPeriod", getRetentionPeriod())
            .append("itemNumber", getItemNumber())
            .append("archiveNumber", getArchiveNumber())
            .append("department", getDepartment())
            .append("archivist", getArchivist())
            .append("archiveDate", getArchiveDate())
            .append("remarks", getRemarks())
            .append("archiveStatus", getArchiveStatus())
            .append("fid", getFid())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("archiveCategoryCode", getArchiveCategoryCode())
            .append("year", getYear())
            .append("caseNumber", getCaseNumber())
            .append("responsibleParty", getResponsibleParty())
            .append("securityLevel", getSecurityLevel())
            .append("directoryNumber", getDirectoryNumber())
            .append("fileNumber", getFileNumber())
            .append("documentDate", getDocumentDate())
            .append("pageCount", getPageCount())
            .append("archivesInput", getArchivesInput())
            .append("deptId", getDeptId())
            .append("searchInput", getSearchInput())
            .append("employeeCode", getEmployeeCode())
            .append("userAccount", getUserAccount())
            .append("phoneNumber", getPhoneNumber())
            .append("employeeStatus", getEmployeeStatus())
            .append("field16", getField16())
            .append("field17", getField17())
            .append("field18", getField18())
            .append("field19", getField19())
            .append("field20", getField20())
            .append("field21", getField21())
            .append("field22", getField22())
            .append("field23", getField23())
            .append("field24", getField24())
            .append("field25", getField25())
            .append("field26", getField26())
            .append("field27", getField27())
            .append("field28", getField28())
            .append("field29", getField29())
            .append("field30", getField30())
            .toString();
    }
}
