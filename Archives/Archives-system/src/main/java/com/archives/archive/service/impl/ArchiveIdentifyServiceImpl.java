package com.archives.archive.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveIdentifyMapper;
import com.archives.archive.domain.ArchiveIdentify;
import com.archives.archive.service.IArchiveIdentifyService;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;

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
    @Transactional(rollbackFor = Exception.class)
    public int insertArchiveIdentify(List<ArchiveInfo> archiveInfos)
    {
        if (archiveInfos == null || archiveInfos.isEmpty()) {
            return 0;
        }

        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        List<Long> ids = new ArrayList<>();
        List<ArchiveIdentify> archiveIdentifies = new ArrayList<>();

        for (ArchiveInfo archiveInfo : archiveInfos) {
            Long id = archiveInfo.getId();
            ArchiveIdentify archiveIdentify = new ArchiveIdentify();
            archiveIdentify.setCategoryId(archiveInfo.getCategoryId());
            archiveIdentify.setArchiveNumber(archiveInfo.getArchiveNumber());
            archiveIdentify.setArchiveId(archiveInfo.getId());
            archiveIdentify.setTitle(archiveInfo.getField3());
            archiveIdentify.setCreateBy(currentUser.getNickName());
            archiveIdentify.setCreateTime(DateUtils.getNowDate());
            archiveIdentifies.add(archiveIdentify);
            ids.add(id);
        }

        if (!archiveIdentifies.isEmpty()) {
            archiveIdentifyMapper.insertArchiveIdentifyBeach(archiveIdentifies);
            archiveInfoMapper.identifyContractByIds(ids);
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
        if (ids == null || ids.length == 0) {
            return 0;
        }

        Long[] archiveIds = archiveIdentifyMapper.selectArchiveIdByIds(ids);

        // 空值检查，避免后续更新操作出现空指针异常
        if (archiveIds == null) {
            archiveIds = new Long[0];
        }

        int result = archiveIdentifyMapper.deleteArchiveIdentifyByIds(ids);

        if (archiveIds.length > 0) {
            archiveInfoMapper.updateIsIdentify(archiveIds);
        }

        return result;
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
