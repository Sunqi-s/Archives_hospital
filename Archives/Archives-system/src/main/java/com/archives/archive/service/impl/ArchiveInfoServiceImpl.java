package com.archives.archive.service.impl;

import java.util.List;
import com.archives.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.service.IArchiveInfoService;

/**
 * 档案信息Service业务层处理
 *
 * @author é«å°å·
 * @date 2024-07-11
 */
@Service
public class ArchiveInfoServiceImpl implements IArchiveInfoService
{
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;

    /**
     * 查询档案信息
     *
     * @param id 档案信息主键
     * @return 档案信息
     */
    @Override
    public ArchiveInfo selectArchiveInfoById(Long id)
    {
        return archiveInfoMapper.selectArchiveInfoById(id);
    }

    /**
     * 查询档案信息列表
     *
     * @param archiveInfo 档案信息
     * @return 档案信息
     */
    @Override
    public List<ArchiveInfo> selectArchiveInfoList(ArchiveInfo archiveInfo)
    {
        String searchValue = archiveInfo.getSearchValue();
        if (searchValue != null && !searchValue.isEmpty()) {
            return archiveInfoMapper.selectArchiveInfoListByKeyword(searchValue);
        }
        return archiveInfoMapper.selectArchiveInfoList(archiveInfo);

    }

    /**
     * 新增档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    @Override
    public int insertArchiveInfo(ArchiveInfo archiveInfo)
    {
        archiveInfo.setCreateTime(DateUtils.getNowDate());
        return archiveInfoMapper.insertArchiveInfo(archiveInfo);
    }

    /**
     * 修改档案信息
     *
     * @param archiveInfo 档案信息
     * @return 结果
     */
    @Override
    public int updateArchiveInfo(ArchiveInfo archiveInfo)
    {
        archiveInfo.setUpdateTime(DateUtils.getNowDate());
        return archiveInfoMapper.updateArchiveInfo(archiveInfo);
    }

    /**
     * 批量删除档案信息
     *
     * @param ids 需要删除的档案信息主键
     * @return 结果
     */
    @Override
    public int deleteArchiveInfoByIds(Long[] ids)
    {
        return archiveInfoMapper.deleteArchiveInfoByIds(ids);
    }

    /**
     * 删除档案信息信息
     *
     * @param id 档案信息主键
     * @return 结果
     */
    @Override
    public int deleteArchiveInfoById(Long id)
    {
        return archiveInfoMapper.deleteArchiveInfoById(id);
    }
}
