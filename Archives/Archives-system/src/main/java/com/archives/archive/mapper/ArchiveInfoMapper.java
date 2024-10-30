package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 档案信息Mapper接口
 *
 * @author 高小川
 * @date 2024-07-11
 */
@Mapper
public interface ArchiveInfoMapper
{
    /**
     * 查询档案信息
     *
     * @param id 档案信息主键
     * @return 档案信息
     */
    public ArchiveInfo selectArchiveInfoById(@Param("id") Long id);

    /**
     * 查询档案信息列表
     *
     * @param archiveInfo 档案信息
     * @return 档案信息集合
     */
    public List<ArchiveInfo> selectArchiveInfoList(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    /**
     * 查询档案信息列表
     *
     * @param keyword 档案信息
     * @return 档案信息集合
     */
    public List<ArchiveInfo> selectArchiveInfoListByKeyword(@Param("keyword") String keyword,@Param("categoryId")Long categoryId,@Param("archiveStatus")Long archiveStatus,@Param("dataPermit") String[] dataPermiList);

    /**
     * 新增档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    public int insertArchiveInfo(ArchiveInfo archiveInfo);


    /**
     * 批量新增档案信息
     *
     * @param archiveInfoList 档案信息列表
     * @return 影响的行数
     */
    public int insertArchiveInfoList(List<ArchiveInfo> archiveInfoList);

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
     * @param ids 档案信息主键
     * @return 结果
     */
    public int updateArchiveStatusByIds(@Param("array") Long[] ids,@Param("archiveInfoStatus") ArchiveInfo archiveInfoStatus);
    /**
     * 归档档案信息
     * @param id
     * @return
     */
    public int updateArchiveStatusById(ArchiveInfo archiveInfoStatus);

    /**
     * 删除档案信息
     *
     * @param id 档案信息主键
     * @return 结果
     */
    public int deleteArchiveInfoById(Long id);

    /**
     * 批量删除档案信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveInfoByIds(Long[] ids);
    /**
     * 添加附件状态
     * @param id
     * @return
     */
    public int insertOssStatus(@Param("ossStatus") int ossStatus, @Param("id") Long id);

    /**
     * 发送利用档案信息
     *
     */
    public int sendArchiveInfo(Long[] ids);

    /**
     * 批量删除档案信息
     */
    public boolean deleteArchiveInfoAll(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    /**
     * 高级搜索
     */
    public List<ArchiveInfo> beachSearch(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);
}
