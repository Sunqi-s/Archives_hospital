package com.archives.archive.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.archives.archive.domain.ArchiveBorrow;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.mapper.ArchiveBorrowMapper;
import com.archives.archive.mapper.ArchiveInfoMapper;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveRestorationsMapper;
import com.archives.archive.domain.ArchiveRestorations;
import com.archives.archive.service.IArchiveRestorationsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 归还Service业务层处理
 *
 * @author é«å°å·
 * @date 2025-08-26
 */
@Service
public class ArchiveRestorationsServiceImpl implements IArchiveRestorationsService
{
    @Autowired
    private ArchiveRestorationsMapper archiveRestorationsMapper;
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;
    @Autowired
    private ArchiveBorrowMapper archiveBorrowMapper;

    /**
     * 查询归还
     *
     * @param id 归还主键
     * @return 归还
     */
    @Override
    public ArchiveRestorations selectArchiveRestorationsById(Long id)
    {
        return archiveRestorationsMapper.selectArchiveRestorationsById(id);
    }

    /**
     * 查询归还列表
     *
     * @param archiveRestorations 归还
     * @return 归还
     */
    @Override
    public List<ArchiveRestorations> selectArchiveRestorationsList(ArchiveRestorations archiveRestorations)
    {
        return archiveRestorationsMapper.selectArchiveRestorationsList(archiveRestorations);
    }

    /**
     * 新增归还
     *
     * @param archiveInfos 归还
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertArchiveRestorations(List<ArchiveInfo> archiveInfos) {
        if (CollectionUtils.isEmpty(archiveInfos)) {
            return 0;
        }

        //验证输入数据并提取ID
        List<Long> archiveIds = archiveInfos.stream()
                .peek(archiveInfo -> {
                    if (archiveInfo == null) {
                        throw new IllegalArgumentException("档案信息不能为空");
                    }
                    if (archiveInfo.getId() == null) {
                        throw new IllegalArgumentException("档案ID不能为空");
                    }
                })
                .map(ArchiveInfo::getId)
                .collect(Collectors.toList());

        // 批量查询 ArchiveBorrow 信息
        List<ArchiveBorrow> archiveBorrows = archiveBorrowMapper.getArchiveBorrowsByArchiveIds(archiveIds);
        if (CollectionUtils.isEmpty(archiveBorrows)) {
            throw new IllegalArgumentException("未找到任何档案id对应的信息，请检查输入档案id");
        }

        // 构建借阅记录映射
        Map<Long, ArchiveBorrow> borrowMap = archiveBorrows.stream()
                .collect(Collectors.toMap(
                        borrow -> Long.valueOf(borrow.getArchiveId()),
                        Function.identity(),
                        (existing, replacement) -> existing
                ));

        // 创建归还记录
        List<ArchiveRestorations> restorationsList = archiveIds.stream()
                .map(id -> {
                    ArchiveBorrow archiveBorrow = borrowMap.get(id);
                    if (archiveBorrow == null) {
                        throw new IllegalArgumentException("未找到档案ID " + id + " 对应的借阅信息");
                    }

                    ArchiveRestorations restoration = new ArchiveRestorations();
                    BeanUtils.copyProperties(archiveBorrow, restoration);
                    restoration.setReturnTime(new Date());
                    return restoration;
                })
                .collect(Collectors.toList());

        // 批量插入归还记录
        archiveRestorationsMapper.batchInsertArchiveRestorations(restorationsList);

        // 更新借阅状态
        archiveInfoMapper.restorationsBorrow(archiveIds.toArray(new Long[0]));

        return restorationsList.size();
    }


    /**
     * 修改归还
     *
     * @param archiveRestorations 归还
     * @return 结果
     */
    @Override
    public int updateArchiveRestorations(ArchiveRestorations archiveRestorations)
    {
        return archiveRestorationsMapper.updateArchiveRestorations(archiveRestorations);
    }

    /**
     * 批量删除归还
     *
     * @param ids 需要删除的归还主键
     * @return 结果
     */
    @Override
    public int deleteArchiveRestorationsByIds(Long[] ids)
    {
        return archiveRestorationsMapper.deleteArchiveRestorationsByIds(ids);
    }

    /**
     * 删除归还信息
     *
     * @param id 归还主键
     * @return 结果
     */
    @Override
    public int deleteArchiveRestorationsById(Long id)
    {
        return archiveRestorationsMapper.deleteArchiveRestorationsById(id);
    }
}
