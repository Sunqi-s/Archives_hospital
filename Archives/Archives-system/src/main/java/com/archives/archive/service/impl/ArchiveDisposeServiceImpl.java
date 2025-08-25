package com.archives.archive.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.DateUtils;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveDisposeMapper;
import com.archives.archive.domain.ArchiveDispose;
import com.archives.archive.service.IArchiveDisposeService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 处置记录Service业务层处理
 *
 * @author é«å°å·
 * @date 2025-08-04
 */
@Service
public class ArchiveDisposeServiceImpl implements IArchiveDisposeService
{
    @Autowired
    private ArchiveDisposeMapper archiveDisposeMapper;
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;

    /**
     * 查询处置记录
     *
     * @param id 处置记录主键
     * @return 处置记录
     */
    @Override
    public ArchiveDispose selectArchiveDisposeById(Long id)
    {
        return archiveDisposeMapper.selectArchiveDisposeById(id);
    }

    /**
     * 查询处置记录列表
     *
     * @param archiveDispose 处置记录
     * @return 处置记录
     */
    @Override
    public List<ArchiveDispose> selectArchiveDisposeList(ArchiveDispose archiveDispose)
    {
        return archiveDisposeMapper.selectArchiveDisposeList(archiveDispose);
    }

    /**
     * 新增处置记录
     *
     * @param archiveInfos 处置记录
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertArchiveDispose(List<ArchiveInfo> archiveInfos) {
        if (archiveInfos == null || archiveInfos.isEmpty()) {
            return 0;
        }

        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        List<Long> ids = new ArrayList<>();
        List<ArchiveDispose> archiveDisposes = new ArrayList<>();

        for (ArchiveInfo archiveInfo : archiveInfos) {
            if (archiveInfo != null) {
                Long id = archiveInfo.getId();
                ArchiveDispose archiveDispose = new ArchiveDispose();
                archiveDispose.setArchiveId(archiveInfo.getId());
                archiveDispose.setArchiveNumber(archiveInfo.getArchiveNumber());
                archiveDispose.setCategoryId(archiveInfo.getCategoryId());
                archiveDispose.setCreateTime(DateUtils.getNowDate());
                archiveDispose.setTitle(archiveInfo.getField3());
                archiveDispose.setCreateBy(currentUser.getNickName());
                archiveDisposes.add(archiveDispose);
                ids.add(id);
            }
        }

        if (!archiveDisposes.isEmpty()) {
            // 批量插入优化性能
            archiveDisposeMapper.insertArchiveDisposeBatch(archiveDisposes);
            archiveInfoMapper.disposeContractByIds(ids);
            return archiveDisposes.size();
        }

        return 0;
    }


    /**
     * 修改处置记录
     *
     * @param archiveDispose 处置记录
     * @return 结果
     */
    @Override
    public int updateArchiveDispose(ArchiveDispose archiveDispose)
    {
        archiveDispose.setUpdateTime(DateUtils.getNowDate());
        archiveDispose.setUpdateBy(SecurityUtils.getLoginUser().getUser().getNickName());
        return archiveDisposeMapper.updateArchiveDispose(archiveDispose);
    }

    /**
     * 批量删除处置记录
     *
     * @param ids 需要删除的处置记录主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteArchiveDisposeByIds(Long[] ids) {
        if (ids == null || ids.length == 0) {
            return 0;
        }

        // 先查询关联的档案ID，避免删除后无法查询
        Long[] archiveIds = archiveDisposeMapper.selectArchiveIdByIds(ids);

        // 空值检查，避免后续更新操作出现空指针异常
        if (archiveIds == null) {
            archiveIds = new Long[0];
        }

        // 执行删除操作
        int result = archiveDisposeMapper.deleteArchiveDisposeByIds(ids);

        // 更新档案信息的处理状态
        if (archiveIds.length > 0) {
            archiveInfoMapper.updateIsDispose(archiveIds);
        }

        return result;
    }

    /**
     * 删除处置记录信息
     *
     * @param id 处置记录主键
     * @return 结果
     */
    @Override
    public int deleteArchiveDisposeById(Long id)
    {
        return archiveDisposeMapper.deleteArchiveDisposeById(id);
    }
}
