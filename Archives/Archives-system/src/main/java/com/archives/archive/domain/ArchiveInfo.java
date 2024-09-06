package com.archives.archive.domain;

import java.util.Date;
import java.util.List;

import com.archives.system.domain.SysOss;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.archives.common.annotation.Excel;
import com.archives.common.core.domain.BaseEntity;

/**
 * 档案信息对象 archive_info
 *
 * @author 高小川
 * @date 2024-07-11
 */
public class ArchiveInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 档案分类id */
    @Excel(name = "档案分类id")
    private Long categoryId;

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

    /** 档号 */
    @Excel(name = "档号")
    private String archiveNumber;

    /** 归档部门 */
    @Excel(name = "归档部门")
    private String department;

    /** 归档人 */
    @Excel(name = "归档人")
    private String archiver;

    /** 归档时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "归档时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date archiveDate;

    /** 备注 */
    @Excel(name = "备注")
    private String remarks;

    /** 归档状态 */
    @Excel(name = "归档状态")
    private Long archiveStatus;

    /** 档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内) */
    @Excel(name = "档案分类代码：WF=文书(文件), WA=文书(案卷), WJ=文书(卷内), KA=科技(案卷), KJ=科技(卷内), AA=会计(案卷), AJ=会计(卷内)")
    private String categoryCode;

    /** 备用字段1 */
    @Excel(name = "备用字段1")
    private String field1;

    /** 备用字段2 */
    @Excel(name = "备用字段2")
    private String field2;

    /** 备用字段3 */
    @Excel(name = "备用字段3")
    private String field3;

    /** 备用字段4 */
    @Excel(name = "备用字段4")
    private String field4;

    /** 备用字段5 */
    @Excel(name = "备用字段5")
    private String field5;

    /** 备用字段6 */
    @Excel(name = "备用字段6")
    private String field6;

    /** 备用字段7 */
    @Excel(name = "备用字段7")
    private String field7;

    /** 备用字段8 */
    @Excel(name = "备用字段8")
    private String field8;

    /** 备用字段9 */
    @Excel(name = "备用字段9")
    private String field9;

    /** 备用字段10 */
    @Excel(name = "备用字段10")
    private String field10;

    /** 备用字段11 */
    @Excel(name = "备用字段11")
    private String field11;

    /** 备用字段12 */
    @Excel(name = "备用字段12")
    private String field12;

    /** 备用字段13 */
    @Excel(name = "备用字段13")
    private String field13;

    /** 备用字段14 */
    @Excel(name = "备用字段14")
    private String field14;

    /** 备用字段15 */
    @Excel(name = "备用字段15")
    private String field15;

    /** 备用字段16 */
    @Excel(name = "备用字段16")
    private String field16;

    /** 备用字段17 */
    @Excel(name = "备用字段17")
    private String field17;

    /** 备用字段18 */
    @Excel(name = "备用字段18")
    private String field18;

    /** 备用字段19 */
    @Excel(name = "备用字段19")
    private String field19;

    /** 备用字段20 */
    @Excel(name = "备用字段20")
    private String field20;

    /** 备用字段21 */
    @Excel(name = "备用字段21")
    private String field21;

    /** 备用字段22 */
    @Excel(name = "备用字段22")
    private String field22;

    /** 备用字段23 */
    @Excel(name = "备用字段23")
    private String field23;

    /** 备用字段24 */
    @Excel(name = "备用字段24")
    private String field24;

    /** 备用字段25 */
    @Excel(name = "备用字段25")
    private String field25;

    /** 备用字段26 */
    @Excel(name = "备用字段26")
    private String field26;

    /** 备用字段27 */
    @Excel(name = "备用字段27")
    private String field27;

    /** 备用字段28 */
    @Excel(name = "备用字段28")
    private String field28;

    /** 备用字段29 */
    @Excel(name = "备用字段29")
    private String field29;

    /** 备用字段30 */
    @Excel(name = "备用字段30")
    private String field30;

    /** 附件 */
    @Excel(name = "附件")
    private int ossStatus;

    private List<SysOss> sysOssList;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setFondsNumber(String fondsNumber)
    {
        this.fondsNumber = fondsNumber;
    }

    public void setCategoryId(Long categoryId)
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId()
    {
        return categoryId;
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
    public void setArchiver(String archiver)
    {
        this.archiver = archiver;
    }

    public String getArchiver()
    {
        return archiver;
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
    public void setArchiveStatus(Long archiveStatus)
    {
        this.archiveStatus = archiveStatus;
    }

    public Long getArchiveStatus()
    {
        return archiveStatus;
    }
    public void setCategoryCode(String categoryCode)
    {
        this.categoryCode = categoryCode;
    }

    public String getCategoryCode()
    {
        return categoryCode;
    }
    public void setField1(String field1)
    {
        this.field1 = field1;
    }

    public String getField1()
    {
        return field1;
    }
    public void setField2(String field2)
    {
        this.field2 = field2;
    }

    public String getField2()
    {
        return field2;
    }
    public void setField3(String field3)
    {
        this.field3 = field3;
    }

    public String getField3()
    {
        return field3;
    }
    public void setField4(String field4)
    {
        this.field4 = field4;
    }

    public String getField4()
    {
        return field4;
    }
    public void setField5(String field5)
    {
        this.field5 = field5;
    }

    public String getField5()
    {
        return field5;
    }
    public void setField6(String field6)
    {
        this.field6 = field6;
    }

    public String getField6()
    {
        return field6;
    }
    public void setField7(String field7)
    {
        this.field7 = field7;
    }

    public String getField7()
    {
        return field7;
    }
    public void setField8(String field8)
    {
        this.field8 = field8;
    }

    public String getField8()
    {
        return field8;
    }
    public void setField9(String field9)
    {
        this.field9 = field9;
    }

    public String getField9()
    {
        return field9;
    }
    public void setField10(String field10)
    {
        this.field10 = field10;
    }

    public String getField10()
    {
        return field10;
    }
    public void setField11(String field11)
    {
        this.field11 = field11;
    }

    public String getField11()
    {
        return field11;
    }
    public void setField12(String field12)
    {
        this.field12 = field12;
    }

    public String getField12()
    {
        return field12;
    }
    public void setField13(String field13)
    {
        this.field13 = field13;
    }

    public String getField13()
    {
        return field13;
    }
    public void setField14(String field14)
    {
        this.field14 = field14;
    }

    public String getField14()
    {
        return field14;
    }
    public void setField15(String field15)
    {
        this.field15 = field15;
    }

    public String getField15()
    {
        return field15;
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

    public List<SysOss> getSysOssList() {
        return sysOssList;
    }

    public void setSysOssList(List<SysOss> sysOssList) {
        this.sysOssList = sysOssList;
    }

    public int getOssStatus() {
        return ossStatus;
    }

    public void setOssStatus(int ossStatus) {
        this.ossStatus = ossStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("fondsNumber", getFondsNumber())
            .append("fondsName", getFondsName())
            .append("retentionPeriod", getRetentionPeriod())
            .append("itemNumber", getItemNumber())
            .append("archiveNumber", getArchiveNumber())
            .append("department", getDepartment())
            .append("archiver", getArchiver())
            .append("archiveDate", getArchiveDate())
            .append("remarks", getRemarks())
            .append("archiveStatus", getArchiveStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("categoryCode", getCategoryCode())
            .append("field1", getField1())
            .append("field2", getField2())
            .append("field3", getField3())
            .append("field4", getField4())
            .append("field5", getField5())
            .append("field6", getField6())
            .append("field7", getField7())
            .append("field8", getField8())
            .append("field9", getField9())
            .append("field10", getField10())
            .append("field11", getField11())
            .append("field12", getField12())
            .append("field13", getField13())
            .append("field14", getField14())
            .append("field15", getField15())
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
            .append("sysOssList", getSysOssList())
            .append("ossStatus", getOssStatus())
            .toString();
    }
}
