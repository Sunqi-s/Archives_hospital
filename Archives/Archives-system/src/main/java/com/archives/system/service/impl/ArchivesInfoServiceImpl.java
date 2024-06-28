package com.archives.system.service.impl;

import com.archives.common.utils.DateUtils;
import com.archives.system.domain.ArchivesInfo;
import com.archives.system.mapper.ArchivesInfoMapper;
import com.archives.system.service.IArchivesInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 会计档案Service业务层处理
 *
 * @author archives
 * @date 2024-05-21
 */
@Service
public class ArchivesInfoServiceImpl implements IArchivesInfoService
{
    @Autowired
    private ArchivesInfoMapper archivesInfoMapper;

    /**
     * 查询会计档案
     *
     * @param id 会计档案主键
     * @return 会计档案
     */
    @Override
    public ArchivesInfo selectArchivesInfoById(Long id)
    {
        return archivesInfoMapper.selectArchivesInfoById(id);
    }

    /**
     * 查询会计档案列表
     *
     * @param archivesInfo 会计档案
     * @return 会计档案
     */
    @Override
    public List<ArchivesInfo> selectArchivesInfoList(ArchivesInfo archivesInfo)
    {
        return archivesInfoMapper.selectArchivesInfoList(archivesInfo);
    }

    /**
     * 新增会计档案
     *
     * @param archivesInfo 会计档案
     * @return 结果
     */
    @Override
    public int insertArchivesInfo(ArchivesInfo archivesInfo)
    {
        archivesInfo.setCreateTime(DateUtils.getNowDate());
        return archivesInfoMapper.insertArchivesInfo(archivesInfo);
    }

    /**
     * 修改会计档案
     *
     * @param archivesInfo 会计档案
     * @return 结果
     */
    @Override
    public int updateArchivesInfo(ArchivesInfo archivesInfo)
    {
        archivesInfo.setUpdateTime(DateUtils.getNowDate());
        return archivesInfoMapper.updateArchivesInfo(archivesInfo);
    }

    /**
     * 批量删除会计档案
     *
     * @param ids 需要删除的会计档案主键
     * @return 结果
     */
    @Override
    public int deleteArchivesInfoByIds(Long[] ids)
    {
        return archivesInfoMapper.deleteArchivesInfoByIds(ids);
    }

    /**
     * 删除会计档案信息
     *
     * @param id 会计档案主键
     * @return 结果
     */
    @Override
    public int deleteArchivesInfoById(Long id)
    {
        return archivesInfoMapper.deleteArchivesInfoById(id);
    }
}
