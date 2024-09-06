package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveReportRelation;
import com.archives.archive.domain.ArchiveReportTemplates;

/**
 * 档案报表关系Service接口
 * 
 * @author é«å°å·
 * @date 2024-09-04
 */
public interface IArchiveReportRelationService 
{
    /**
     * 查询档案报表关系
     * 
     * @param id 档案报表关系主键
     * @return 档案报表关系
     */
    public ArchiveReportRelation selectArchiveReportRelationById(Long id);

    /**
     * 查询档案报表关系列表
     * 
     * @param archiveReportRelation 档案报表关系
     * @return 档案报表关系集合
     */
    public List<ArchiveReportRelation> selectArchiveReportRelationList(ArchiveReportRelation archiveReportRelation);

    /**
     * 新增档案报表关系
     * 
     * @param archiveReportRelation 档案报表关系
     * @return 结果
     */
    public int insertArchiveReportRelation(ArchiveReportRelation archiveReportRelation);

    /**
     * 修改档案报表关系
     * 
     * @param archiveReportRelation 档案报表关系
     * @return 结果
     */
    public int updateArchiveReportRelation(ArchiveReportRelation archiveReportRelation);

    /**
     * 批量删除档案报表关系
     * 
     * @param ids 需要删除的档案报表关系主键集合
     * @return 结果
     */
    public int deleteArchiveReportRelationByIds(Long[] ids);

    /**
     * 删除档案报表关系信息
     * 
     * @param id 档案报表关系主键
     * @return 结果
     */
    public int deleteArchiveReportRelationById(Long id);


    /**
     * 根据报表id查询档案报表关系
     * @param categoryId
     * @return
     */
    public ArchiveReportTemplates selectArchiveReportRelationByCategoryId(Long categoryId);
}
