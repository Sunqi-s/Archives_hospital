package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveReportTemplates;

/**
 * 报表设计Service接口
 *
 * @author 高小川
 * @date 2024-07-03
 */
public interface IArchiveReportTemplatesService
{
    /**
     * 查询报表设计
     *
     * @param id 报表设计主键
     * @return 报表设计
     */
    public ArchiveReportTemplates selectArchiveReportTemplatesById(Long id);

    /**
     * 查询报表设计
     *
     * @param name 报表设计主键
     * @return 报表设计
     */
    public ArchiveReportTemplates selectArchiveReportTemplatesByName(String name);


    /**
     * 查询报表设计列表
     *
     * @param archiveReportTemplates 报表设计
     * @return 报表设计集合
     */
    public List<ArchiveReportTemplates> selectArchiveReportTemplatesList(ArchiveReportTemplates archiveReportTemplates);

    /**
     * 新增报表设计
     *
     * @param archiveReportTemplates 报表设计
     * @return 结果
     */
    public int insertArchiveReportTemplates(ArchiveReportTemplates archiveReportTemplates);

    /**
     * 修改报表设计
     *
     * @param archiveReportTemplates 报表设计
     * @return 结果
     */
    public int updateArchiveReportTemplates(ArchiveReportTemplates archiveReportTemplates);

    /**
     * 批量删除报表设计
     *
     * @param ids 需要删除的报表设计主键集合
     * @return 结果
     */
    public int deleteArchiveReportTemplatesByIds(Long[] ids);

    /**
     * 删除报表设计信息
     *
     * @param id 报表设计主键
     * @return 结果
     */
    public int deleteArchiveReportTemplatesById(Long id);


    public int deleteArchiveReportTemplatesByName(String name);
}
