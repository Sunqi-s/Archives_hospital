package com.archives.archive.service.impl;

import java.util.Comparator;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.archives.archive.mapper.ArchiveFitMapper;
import com.archives.archive.domain.ArchiveFit;
import com.archives.archive.service.IArchiveFitService;

/**
 * 保存对于文书的年度或科技的类型的Service业务层处理
 * 
 * @author é«å°å·
 * @date 2024-12-12
 */
@Service
public class ArchiveFitServiceImpl implements IArchiveFitService 
{
    @Autowired
    private ArchiveFitMapper archiveFitMapper;

    /**
     * 查询保存对于文书的年度或科技的类型的
     * 
     * @param id 保存对于文书的年度或科技的类型的主键
     * @return 保存对于文书的年度或科技的类型的
     */
    @Override
    public ArchiveFit selectArchiveFitById(Long id)
    {
        return archiveFitMapper.selectArchiveFitById(id);
    }

    /**
     * 查询保存对于文书的年度或科技的类型的列表
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 保存对于文书的年度或科技的类型的
     */
    @Override
    public List<ArchiveFit> selectArchiveFitList(ArchiveFit archiveFit)
    //对列表进行排序
    {
        List<ArchiveFit> list = archiveFitMapper.selectArchiveFitList(archiveFit);
        List<ArchiveFit> result = list.stream().sorted(Comparator.comparing(ArchiveFit::getCategoryId)
                .thenComparing(
                        Comparator.comparing((ArchiveFit a) -> {
                            if(Pattern.matches("\\d+", a.getSyllable())) {
                                return Integer.valueOf(a.getSyllable());
                            }
                            return Integer.MAX_VALUE;
                        })
                )).collect(Collectors.toList());
        System.out.println("list = " + result);
        return result;
    }

    /**
     * 新增保存对于文书的年度或科技的类型的
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 结果
     */
    @Override
    public int insertArchiveFit(ArchiveFit archiveFit)
    {
        return archiveFitMapper.insertArchiveFit(archiveFit);
    }

    /**
     * 修改保存对于文书的年度或科技的类型的
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 结果
     */
    @Override
    public int updateArchiveFit(ArchiveFit archiveFit)
    {
        return archiveFitMapper.updateArchiveFit(archiveFit);
    }

    /**
     * 批量删除保存对于文书的年度或科技的类型的
     * 
     * @param ids 需要删除的保存对于文书的年度或科技的类型的主键
     * @return 结果
     */
    @Override
    public int deleteArchiveFitByIds(Long[] ids)
    {
        return archiveFitMapper.deleteArchiveFitByIds(ids);
    }

    /**
     * 删除保存对于文书的年度或科技的类型的信息
     * 
     * @param id 保存对于文书的年度或科技的类型的主键
     * @return 结果
     */
    @Override
    public int deleteArchiveFitById(Long id)
    {
        return archiveFitMapper.deleteArchiveFitById(id);
    }
}
