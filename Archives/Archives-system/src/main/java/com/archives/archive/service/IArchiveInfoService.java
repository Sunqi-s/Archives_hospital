package com.archives.archive.service;

import java.util.List;
import com.archives.archive.domain.ArchiveInfo;

/**
 * 档案信息Service接口
 *
 * @author 高小川
 * @date 2024-07-11
 */
public interface IArchiveInfoService
{
    /**
     * 查询档案信息
     *
     * @param id 档案信息主键
     * @return 档案信息
     */
    public ArchiveInfo selectArchiveInfoById(Long id);

    /**
     * 查询档案信息列表
     *
     * @param archiveInfo 档案信息
     * @return 档案信息集合
     */
    public List<ArchiveInfo> selectArchiveInfoList(ArchiveInfo archiveInfo);

    /**
     * 新增档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    public int insertArchiveInfo(ArchiveInfo archiveInfo);

    /**
     * 修改档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    public int updateArchiveInfo(ArchiveInfo archiveInfo);

    /**
     * 批量删除档案信息
     *
     * @param ids 需要删除的档案信息主键集合
     * @return 结果
     */
    public int deleteArchiveInfoByIds(Long[] ids);

    /**
     * 删除档案信息信息
     *
     * @param id 档案信息主键
     * @return 结果
     */
    public int deleteArchiveInfoById(Long id);
}
