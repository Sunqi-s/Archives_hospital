package com.archives.archive.service;

import java.util.List;
import java.util.concurrent.CompletableFuture;

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
     * 批量归档档案信息
     *
     * @param ids 需要归档的档案信息主键
     *             归档状态为1
     * @return 结果
     */
        public int updateArchiveStatusByIds(Long[] ids);
    /**
     * 归档档案信息
     * @param id
     * @return
     */
    public int updateArchiveStatusById(Long id);
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

    /**
     * 批量新增档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    public CompletableFuture<List<ArchiveInfo>> insertArchiveInfoList(List<ArchiveInfo> archiveInfo);

    /**
     * 批量发送利用档案信息
     */
    public int sendArchiveInfo(Long[] ids);

    /**
     * 批量删除档案信息
     *
     *
     */
    public boolean deleteArchiveInfoAll(ArchiveInfo archiveInfo);

    /**
     * 高级搜索
     */
    public List<ArchiveInfo> beachSearch(ArchiveInfo archiveInfo);
}
