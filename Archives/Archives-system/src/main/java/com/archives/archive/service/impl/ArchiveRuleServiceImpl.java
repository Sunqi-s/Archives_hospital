package com.archives.archive.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveRuleMapper;
import com.archives.archive.domain.ArchiveRule;
import com.archives.archive.service.IArchiveRuleService;

/**
 * 档号规则Service业务层处理
 *
 * @author é«å°å·
 * @date 2025-03-05
 */
@Service
public class ArchiveRuleServiceImpl implements IArchiveRuleService
{
    @Autowired
    private ArchiveRuleMapper archiveRuleMapper;

    /**
     * 查询档号规则
     *
     * @param id 档号规则主键
     * @return 档号规则
     */
    @Override
    public ArchiveRule selectArchiveRuleById(Long id)
    {
        return archiveRuleMapper.selectArchiveRuleById(id);
    }

    /**
     * 查询档号规则列表
     *
     * @param archiveRule 档号规则
     * @return 档号规则
     */
    @Override
    public List<ArchiveRule> selectArchiveRuleList(ArchiveRule archiveRule)
    {
        return archiveRuleMapper.selectArchiveRuleList(archiveRule);
    }

    /**
     * 新增档号规则
     *
     * @param archiveRule 档号规则
     * @return 结果
     */
    @Override
    public int insertArchiveRule(ArchiveRule archiveRule)
    {
        System.out.println("      insertArchiveRule      "+archiveRule);
        ArchiveRule archiveRule1 = new ArchiveRule();
        archiveRule1.setCategoryId(archiveRule.getCategoryId());
        List<ArchiveRule> list = archiveRuleMapper.selectArchiveRuleList(archiveRule1);
        if (list.size() > 0){
            archiveRule.setId(list.get(0).getId());
            return archiveRuleMapper.updateArchiveRule(archiveRule);
        }else {
            return archiveRuleMapper.insertArchiveRule(archiveRule);
        }
    }

    /**
     * 修改档号规则
     *
     * @param archiveRule 档号规则
     * @return 结果
     */
    @Override
    public int updateArchiveRule(ArchiveRule archiveRule)
    {
        return archiveRuleMapper.updateArchiveRule(archiveRule);
    }

    /**
     * 批量删除档号规则
     *
     * @param ids 需要删除的档号规则主键
     * @return 结果
     */
    @Override
    public int deleteArchiveRuleByIds(Long[] ids)
    {
        return archiveRuleMapper.deleteArchiveRuleByIds(ids);
    }

    /**
     * 删除档号规则信息
     *
     * @param id 档号规则主键
     * @return 结果
     */
    @Override
    public int deleteArchiveRuleById(Long id)
    {
        return archiveRuleMapper.deleteArchiveRuleById(id);
    }
}
