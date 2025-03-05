package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveRule;

/**
 * 档号规则Service接口
 * 
 * @author é«å°å·
 * @date 2025-03-05
 */
public interface IArchiveRuleService 
{
    /**
     * 查询档号规则
     * 
     * @param id 档号规则主键
     * @return 档号规则
     */
    public ArchiveRule selectArchiveRuleById(Long id);

    /**
     * 查询档号规则列表
     * 
     * @param archiveRule 档号规则
     * @return 档号规则集合
     */
    public List<ArchiveRule> selectArchiveRuleList(ArchiveRule archiveRule);

    /**
     * 新增档号规则
     * 
     * @param archiveRule 档号规则
     * @return 结果
     */
    public int insertArchiveRule(ArchiveRule archiveRule);

    /**
     * 修改档号规则
     * 
     * @param archiveRule 档号规则
     * @return 结果
     */
    public int updateArchiveRule(ArchiveRule archiveRule);

    /**
     * 批量删除档号规则
     * 
     * @param ids 需要删除的档号规则主键集合
     * @return 结果
     */
    public int deleteArchiveRuleByIds(Long[] ids);

    /**
     * 删除档号规则信息
     * 
     * @param id 档号规则主键
     * @return 结果
     */
    public int deleteArchiveRuleById(Long id);
}
