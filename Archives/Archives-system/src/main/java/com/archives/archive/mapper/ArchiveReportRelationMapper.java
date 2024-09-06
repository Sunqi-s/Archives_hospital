package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveReportRelation;

/**
 * 档案报表关系Mapper接口
 * 
 * @author é«å°å·
 * @date 2024-09-04
 */
public interface ArchiveReportRelationMapper 
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
     * 删除档案报表关系
     * 
     * @param id 档案报表关系主键
     * @return 结果
     */
    public int deleteArchiveReportRelationById(Long id);

    /**
     * 批量删除档案报表关系
     * 
     * @param reportIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveReportRelationByIds(Long[] ids);

    /**
     * 根据报告categoryId查询档案报表关系
     * @param categoryId
     * @return
     */
    public ArchiveReportRelation selectArchiveReportRelationByCategoryId(Long categoryId);

}
