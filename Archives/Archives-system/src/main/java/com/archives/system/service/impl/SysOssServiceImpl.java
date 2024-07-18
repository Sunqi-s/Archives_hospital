package com.archives.system.service.impl;

import java.util.List;
import com.archives.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.system.mapper.SysOssMapper;
import com.archives.system.domain.SysOss;
import com.archives.system.service.ISysOssService;

/**
 * 文件上传Service业务层处理
 *
 * @author archives
 * @date 2024-07-05
 */
@Service
public class SysOssServiceImpl implements ISysOssService
{
    @Autowired
    private SysOssMapper sysOssMapper;

    /**
     * 查询文件上传
     *
     * @param id 文件上传主键
     * @return 文件上传
     */
    @Override
    public SysOss selectSysOssById(Long id)
    {
        return sysOssMapper.selectSysOssById(id);
    }

    /**
     * 查询文件上传列表
     *
     * @param sysOss 文件上传
     * @return 文件上传
     */
    @Override
    public List<SysOss> selectSysOssList(SysOss sysOss)
    {
        return sysOssMapper.selectSysOssList(sysOss);
    }

    /**
     * 新增文件上传
     *
     * @param sysOss 文件上传
     * @return 结果
     */
    @Override
    public int insertSysOss(SysOss sysOss)
    {
        sysOss.setCreateTime(DateUtils.getNowDate());
        return sysOssMapper.insertSysOss(sysOss);
    }

    /**
     * 批量新增文件上传
     *
     * @param sysOssList 文件上传集合
     * @return 结果
     */
    @Override
    public int insertSysOssBatch(List<SysOss> sysOssList)
    {
        for (SysOss sysOss : sysOssList) {
            sysOss.setCreateTime(DateUtils.getNowDate());
        }
        return sysOssMapper.insertSysOssBatch(sysOssList);
    }

    /**
     * 修改文件上传
     *
     * @param sysOss 文件上传
     * @return 结果
     */
    @Override
    public int updateSysOss(SysOss sysOss)
    {
        sysOss.setUpdateTime(DateUtils.getNowDate());
        return sysOssMapper.updateSysOss(sysOss);
    }

    /**
     * 批量删除文件上传
     *
     * @param ids 需要删除的文件上传主键
     * @return 结果
     */
    @Override
    public int deleteSysOssByIds(Long[] ids)
    {
        return sysOssMapper.deleteSysOssByIds(ids);
    }

    /**
     * 删除文件上传信息
     *
     * @param id 文件上传主键
     * @return 结果
     */
    @Override
    public int deleteSysOssById(Long id)
    {
        return sysOssMapper.deleteSysOssById(id);
    }
}
