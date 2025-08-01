package com.archives.archive.mapper;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
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
    public List<Long> selectIdList(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    public List<Long> selectIdListByKeyword(@Param("keyword") String keyword,@Param("categoryId")Long categoryId,@Param("archiveStatus")Long archiveStatus,@Param("dataPermit") String[] dataPermiList);

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
     * @param archiveInfoStatus 档案信息主键
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
     * @param ids
     * @return
     */
    public int sendArchiveInfo(@Param("array") Long[] ids);


    /**
     * 高级搜索
     * @param archiveInfo
     * @param dataPermiList
     * @return
     */
    public List<ArchiveInfo> beachSearch(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    /**
     * 获取档案信息数量
     * @param archiveInfo
     * @param dataPermiList
     * @return
     */
    public int delArchiveInfo(@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    /**
     * 获取快速搜索删除档案信息数量
     */
    public int delByQuerySearch(@Param("archiveInfo") ArchiveInfo archiveInfo, @Param("dataPermit") String[] dataPermiList);

    public List<ArchiveInfo> selectArchiveInfoByIds(@Param("ids") List<Long> ids);

    public ArchiveInfo getColumn(@Param("itemName") String list,@Param("categoryId") Long categoryId);

    public List<ArchiveInfo> getNumberByKeyword(@Param("map") List<ArchiveInfo> list, @Param("keyword") String keyword, @Param("categoryId")Long categoryId, @Param("archiveStatus")Long archiveStatus, @Param("dataPermit") String[] dataPermiList);

    public List<ArchiveInfo> getNumberBeachSearch(@Param("map") List<ArchiveInfo> list,@Param("archiveInfo") ArchiveInfo archiveInfo,@Param("dataPermit") String[] dataPermiList);

    public int updateArchiveNumber(@Param("list") List<ArchiveInfo> list);

}
