package com.archives.system.service;

import com.archives.system.domain.ArchivesInfo;

import java.util.List;

/**
 * 会计档案Service接口
 *
 * @author archives
 * @date 2024-05-21
 */
public interface IArchivesInfoService
{
    /**
     * 查询会计档案
     *
     * @param id 会计档案主键
     * @return 会计档案
     */
    public ArchivesInfo selectArchivesInfoById(Long id);

    /**
     * 查询会计档案列表
     *
     * @param archivesInfo 会计档案
     * @return 会计档案集合
     */
    public List<ArchivesInfo> selectArchivesInfoList(ArchivesInfo archivesInfo);

    /**
     * 新增会计档案
     *
     * @param archivesInfo 会计档案
     * @return 结果
     */
    public int insertArchivesInfo(ArchivesInfo archivesInfo);

    /**
     * 修改会计档案
     *
     * @param archivesInfo 会计档案
     * @return 结果
     */
    public int updateArchivesInfo(ArchivesInfo archivesInfo);

    /**
     * 批量删除会计档案
     *
     * @param ids 需要删除的会计档案主键集合
     * @return 结果
     */
    public int deleteArchivesInfoByIds(Long[] ids);

    /**
     * 删除会计档案信息
     *
     * @param id 会计档案主键
     * @return 结果
     */
    public int deleteArchivesInfoById(Long id);
}
