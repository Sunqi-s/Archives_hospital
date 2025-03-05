package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveRule;

/**
 * 档号规则Mapper接口
 * 
 * @author é«å°å·
 * @date 2025-03-05
 */
public interface ArchiveRuleMapper 
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
     * 删除档号规则
     * 
     * @param id 档号规则主键
     * @return 结果
     */
    public int deleteArchiveRuleById(Long id);

    /**
     * 批量删除档号规则
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveRuleByIds(Long[] ids);
}
