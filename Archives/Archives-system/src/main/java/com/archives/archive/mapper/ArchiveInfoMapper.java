package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
    public ArchiveInfo selectArchiveInfoById(Long id);

    /**
     * 查询档案信息列表
     *
     * @param archiveInfo 档案信息
     * @return 档案信息集合
     */
    public List<ArchiveInfo> selectArchiveInfoList(ArchiveInfo archiveInfo);

    /**
     * 查询档案信息列表
     *
     * @param keyword 档案信息
     * @return 档案信息集合
     */
    public List<ArchiveInfo> selectArchiveInfoListByKeyword(String keyword);

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
    public int updateArchiveStatusByIds(Long[] ids);
    /**
     * 归档档案信息
     * @param id
     * @return
     */
    public int updateArchiveStatusById(Long id);

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
}
