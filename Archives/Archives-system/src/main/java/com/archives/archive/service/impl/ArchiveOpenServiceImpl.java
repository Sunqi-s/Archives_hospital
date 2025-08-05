package com.archives.archive.service.impl;

import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveOpenMapper;
import com.archives.archive.domain.ArchiveOpen;
import com.archives.archive.service.IArchiveOpenService;

/**
 * 公开记录Service业务层处理
 *
 * @author é«å°å·
 * @date 2025-08-05
 */
@Service
public class ArchiveOpenServiceImpl implements IArchiveOpenService
{
    @Autowired
    private ArchiveOpenMapper archiveOpenMapper;

    /**
     * 查询公开记录
     *
     * @param id 公开记录主键
     * @return 公开记录
     */
    @Override
    public ArchiveOpen selectArchiveOpenById(Long id)
    {
        return archiveOpenMapper.selectArchiveOpenById(id);
    }

    /**
     * 查询公开记录列表
     *
     * @param archiveOpen 公开记录
     * @return 公开记录
     */
    @Override
    public List<ArchiveOpen> selectArchiveOpenList(ArchiveOpen archiveOpen)
    {
        return archiveOpenMapper.selectArchiveOpenList(archiveOpen);
    }

    /**
     * 新增公开记录
     *
     * @param archiveInfos 公开记录
     * @return 结果
     */
    @Override
    public int insertArchiveOpen(List<ArchiveInfo> archiveInfos)
    {
//        archiveOpen.setCreateTime(DateUtils.getNowDate());
//        return archiveOpenMapper.insertArchiveOpen(archiveOpen);
        SysUser sysUser = SecurityUtils.getLoginUser().getUser();
        for (ArchiveInfo archiveInfo : archiveInfos){
            ArchiveOpen archiveOpen = new ArchiveOpen();
            archiveOpen.setArchiveNumber(archiveInfo.getArchiveNumber());
            archiveOpen.setArchiveId(archiveInfo.getId());
            archiveOpen.setCategoryId(archiveInfo.getCategoryId());
            archiveOpen.setCreateTime(DateUtils.getNowDate());
            archiveOpen.setCreateBy(sysUser.getNickName());
            archiveOpen.setTitle(archiveInfo.getField3());
            archiveOpenMapper.insertArchiveOpen(archiveOpen);

            String currentPermit = archiveInfo.getDataPermit();
            String newPermit = "";
            if (!currentPermit.equals("all")){
                if (currentPermit == null || currentPermit.isEmpty()) {
                    // 原值为空时，直接设置为 "all"
                    newPermit = "all";
                } else {
                    // 原值非空时，追加 ",all"
                    newPermit =currentPermit + ",all";
                }
                archiveOpenMapper.openArchiveInfo(archiveInfo.getId(), newPermit);
            }
        }
        return 1;
    }

    /**
     * 修改公开记录
     *
     * @param archiveOpen 公开记录
     * @return 结果
     */
    @Override
    public int updateArchiveOpen(ArchiveOpen archiveOpen)
    {
        archiveOpen.setUpdateTime(DateUtils.getNowDate());
        archiveOpen.setUpdateBy(SecurityUtils.getLoginUser().getUser().getNickName());
        return archiveOpenMapper.updateArchiveOpen(archiveOpen);
    }

    /**
     * 批量删除公开记录
     *
     * @param ids 需要删除的公开记录主键
     * @return 结果
     */
    @Override
    public int deleteArchiveOpenByIds(Long[] ids)
    {
        return archiveOpenMapper.deleteArchiveOpenByIds(ids);
    }

    /**
     * 删除公开记录信息
     *
     * @param id 公开记录主键
     * @return 结果
     */
    @Override
    public int deleteArchiveOpenById(Long id)
    {
        return archiveOpenMapper.deleteArchiveOpenById(id);
    }
}
