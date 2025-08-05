package com.archives.archive.service.impl;

import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveIdentifyMapper;
import com.archives.archive.domain.ArchiveIdentify;
import com.archives.archive.service.IArchiveIdentifyService;

/**
 * 鉴定记录Service业务层处理
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
@Service
public class ArchiveIdentifyServiceImpl implements IArchiveIdentifyService
{
    @Autowired
    private ArchiveIdentifyMapper archiveIdentifyMapper;

    /**
     * 查询鉴定记录
     *
     * @param id 鉴定记录主键
     * @return 鉴定记录
     */
    @Override
    public ArchiveIdentify selectArchiveIdentifyById(Long id)
    {
        return archiveIdentifyMapper.selectArchiveIdentifyById(id);
    }

    /**
     * 查询鉴定记录列表
     *
     * @param archiveIdentify 鉴定记录
     * @return 鉴定记录
     */
    @Override
    public List<ArchiveIdentify> selectArchiveIdentifyList(ArchiveIdentify archiveIdentify)
    {
        return archiveIdentifyMapper.selectArchiveIdentifyList(archiveIdentify);
    }

    /**
     * 新增鉴定记录
     *
     * @param archiveInfos 鉴定记录
     * @return 结果
     */
    @Override
    public int insertArchiveIdentify(List<ArchiveInfo> archiveInfos)
    {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        for (ArchiveInfo archiveInfo : archiveInfos) {
            ArchiveIdentify archiveIdentify = new ArchiveIdentify();
            archiveIdentify.setCategoryId(archiveInfo.getCategoryId());
            archiveIdentify.setArchiveNumber(archiveInfo.getArchiveNumber());
            archiveIdentify.setArchiveId(archiveInfo.getId());
            archiveIdentify.setTitle(archiveInfo.getField3());
            archiveIdentify.setCreateBy(currentUser.getNickName());
            archiveIdentify.setCreateTime(DateUtils.getNowDate());
            archiveIdentifyMapper.insertArchiveIdentify(archiveIdentify);
        }
        return 1;
    }

    /**
     * 修改鉴定记录
     *
     * @param archiveIdentify 鉴定记录
     * @return 结果
     */
    @Override
    public int updateArchiveIdentify(ArchiveIdentify archiveIdentify)
    {
        archiveIdentify.setUpdateTime(DateUtils.getNowDate());
        archiveIdentify.setUpdateBy(SecurityUtils.getLoginUser().getUser().getNickName());
        return archiveIdentifyMapper.updateArchiveIdentify(archiveIdentify);
    }

    /**
     * 批量删除鉴定记录
     *
     * @param ids 需要删除的鉴定记录主键
     * @return 结果
     */
    @Override
    public int deleteArchiveIdentifyByIds(Long[] ids)
    {
        return archiveIdentifyMapper.deleteArchiveIdentifyByIds(ids);
    }

    /**
     * 删除鉴定记录信息
     *
     * @param id 鉴定记录主键
     * @return 结果
     */
    @Override
    public int deleteArchiveIdentifyById(Long id)
    {
        return archiveIdentifyMapper.deleteArchiveIdentifyById(id);
    }
}
