package com.archives.archive.service.impl;


import java.util.List;

import com.archives.archive.domain.ArchiveReportTemplates;
import com.archives.archive.mapper.ArchiveReportTemplatesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveReportRelationMapper;
import com.archives.archive.domain.ArchiveReportRelation;
import com.archives.archive.service.IArchiveReportRelationService;

/**
 * 档案报表关系Service业务层处理
 *
 * @author é«å°å·
 * @date 2024-09-04
 */
@Service
public class ArchiveReportRelationServiceImpl implements IArchiveReportRelationService
{
    @Autowired
    private ArchiveReportRelationMapper archiveReportRelationMapper;
    @Autowired
    private ArchiveReportTemplatesMapper archiveReportTemplatesMapper;

    /**
     * 查询档案报表关系
     *
     * @param id 档案报表关系主键
     * @return 档案报表关系
     */
    @Override
    public ArchiveReportRelation selectArchiveReportRelationById(Long id)
    {
        return archiveReportRelationMapper.selectArchiveReportRelationById(id);
    }

    /**
     * 查询档案报表关系列表
     *
     * @param archiveReportRelation 档案报表关系
     * @return 档案报表关系
     */
    @Override
    public List<ArchiveReportRelation> selectArchiveReportRelationList(ArchiveReportRelation archiveReportRelation)
    {
        return archiveReportRelationMapper.selectArchiveReportRelationList(archiveReportRelation);
    }

    /**
     * 新增档案报表关系
     *
     * @param archiveReportRelation 档案报表关系
     * @return 结果
     */
    @Override
    public int insertArchiveReportRelation(ArchiveReportRelation archiveReportRelation)
    {
        List<ArchiveReportRelation> list = archiveReportRelationMapper.selectArchiveReportRelationList(archiveReportRelation);
        if(list != null && !list.isEmpty()){
            return 0; // 返回409 Conflict状态码
        }else {
            int result = archiveReportRelationMapper.insertArchiveReportRelation(archiveReportRelation);
            return 200; // 返回200 OK状态码
        }
    }

    /**
     * 修改档案报表关系
     *
     * @param archiveReportRelation 档案报表关系
     * @return 结果
     */
    @Override
    public int updateArchiveReportRelation(ArchiveReportRelation archiveReportRelation)
    {
        return archiveReportRelationMapper.updateArchiveReportRelation(archiveReportRelation);
    }

    /**
     * 批量删除档案报表关系
     *
     * @param ids 需要删除的档案报表关系主键
     * @return 结果
     */
    @Override
    public int deleteArchiveReportRelationByIds(Long[] ids)
    {
        return archiveReportRelationMapper.deleteArchiveReportRelationByIds(ids);
    }

    /**
     * 删除档案报表关系信息
     *
     * @param id 档案报表关系主键
     * @return 结果
     */
    @Override
    public int deleteArchiveReportRelationById(Long id)
    {
        return archiveReportRelationMapper.deleteArchiveReportRelationById(id);
    }

    @Override
    public ArchiveReportTemplates selectArchiveReportRelationByCategoryId(Long categoryId) {
        ArchiveReportRelation archiveReportRelation = archiveReportRelationMapper.selectArchiveReportRelationByCategoryId(categoryId);
        if(archiveReportRelation == null){
            return null;
        }else{
            Long count = archiveReportRelation.getReportId();
            ArchiveReportTemplates archiveReportTemplates = archiveReportTemplatesMapper.selectArchiveReportTemplatesById(count);
            return archiveReportTemplates;
        }
    }
}
