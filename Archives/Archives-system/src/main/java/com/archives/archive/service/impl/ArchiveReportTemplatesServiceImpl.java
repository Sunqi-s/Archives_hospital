package com.archives.archive.service.impl;

import java.util.List;
import com.archives.archive.domain.ArchiveReportRelation;
import com.archives.archive.mapper.ArchiveReportRelationMapper;
import com.archives.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveReportTemplatesMapper;
import com.archives.archive.domain.ArchiveReportTemplates;
import com.archives.archive.service.IArchiveReportTemplatesService;

/**
 * 报表设计Service业务层处理
 *
 * @author 高小川
 * @date 2024-07-03
 */
@Service
public class ArchiveReportTemplatesServiceImpl implements IArchiveReportTemplatesService
{
    @Autowired
    private ArchiveReportTemplatesMapper archiveReportTemplatesMapper;
    @Autowired
    private ArchiveReportRelationMapper archiveReportRelationMapper;

    /**
     * 查询报表设计
     *
     * @param id 报表设计主键
     * @return 报表设计
     */
    @Override
    public ArchiveReportTemplates selectArchiveReportTemplatesById(Long id)
    {
        return archiveReportTemplatesMapper.selectArchiveReportTemplatesById(id);
    }

    /**
     * 查询报表设计
     *
     * @param name 报表设计主键
     * @return 报表设计
     */
    @Override
    public ArchiveReportTemplates selectArchiveReportTemplatesByName(String name)
    {
        return archiveReportTemplatesMapper.selectArchiveReportTemplatesByName(name);
    }

    /**
     * 查询报表设计列表
     *
     * @param archiveReportTemplates 报表设计
     * @return 报表设计
     */
    @Override
    public List<ArchiveReportTemplates> selectArchiveReportTemplatesList(ArchiveReportTemplates archiveReportTemplates)
    {
        return archiveReportTemplatesMapper.selectArchiveReportTemplatesList(archiveReportTemplates);
    }

    /**
     * 新增报表设计
     *
     * @param archiveReportTemplates 报表设计
     * @return 结果
     */
    @Override
    public int insertArchiveReportTemplates(ArchiveReportTemplates archiveReportTemplates)
    {
        archiveReportTemplates.setCreateTime(DateUtils.getNowDate());
        return archiveReportTemplatesMapper.insertArchiveReportTemplates(archiveReportTemplates);
    }

    /**
     * 修改报表设计
     *
     * @param archiveReportTemplates 报表设计
     * @return 结果
     */
    @Override
    public int updateArchiveReportTemplates(ArchiveReportTemplates archiveReportTemplates)
    {
        archiveReportTemplates.setUpdateTime(DateUtils.getNowDate());
        return archiveReportTemplatesMapper.updateArchiveReportTemplates(archiveReportTemplates);
    }

    /**
     * 批量删除报表设计
     *
     * @param ids 需要删除的报表设计主键
     * @return 结果
     */
    @Override
    public int deleteArchiveReportTemplatesByIds(Long[] ids) {
        List<ArchiveReportRelation> relationsDeleted = null;
        Long[] relationIds = new Long[ids.length];
        for (Long id : ids) {
            ArchiveReportRelation archiveReportRelation = new ArchiveReportRelation();
            archiveReportRelation.setReportId(id);
            relationsDeleted = archiveReportRelationMapper.selectArchiveReportRelationList(archiveReportRelation);
            for (int i = 0; i < relationsDeleted.size(); i++) {
                relationIds[i] = relationsDeleted.get(i).getId();
            }
        }
        int relationsDeletede = 0;
        if (relationIds[0] != null) {
            relationsDeletede = archiveReportRelationMapper.deleteArchiveReportRelationByIds(relationIds);
        }else {
            relationsDeletede = 1;
        }
        int templatesDeleted = archiveReportTemplatesMapper.deleteArchiveReportTemplatesByIds(ids);
        return (templatesDeleted > 0 && relationsDeletede > 0) ? 1 : 0;
    }

    /**
     * 删除报表设计信息
     *
     * @param id 报表设计主键
     * @return 结果
     */
    @Override
    public int deleteArchiveReportTemplatesById(Long id)
    {
        return archiveReportTemplatesMapper.deleteArchiveReportTemplatesById(id);
    }

    public int deleteArchiveReportTemplatesByName(String name)
    {
        return archiveReportTemplatesMapper.deleteArchiveReportTemplatesByName(name);
    }
}
