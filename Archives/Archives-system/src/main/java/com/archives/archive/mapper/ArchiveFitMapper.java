package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.ArchiveFit;

/**
 * 保存对于文书的年度或科技的类型的Mapper接口
 * 
 * @author é«å°å·
 * @date 2024-12-02
 */
public interface ArchiveFitMapper 
{
    /**
     * 查询保存对于文书的年度或科技的类型的
     * 
     * @param id 保存对于文书的年度或科技的类型的主键
     * @return 保存对于文书的年度或科技的类型的
     */
    public ArchiveFit selectArchiveFitById(Long id);

    /**
     * 查询保存对于文书的年度或科技的类型的列表
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 保存对于文书的年度或科技的类型的集合
     */
    public List<ArchiveFit> selectArchiveFitList(ArchiveFit archiveFit);

    /**
     * 新增保存对于文书的年度或科技的类型的
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 结果
     */
    public int insertArchiveFit(ArchiveFit archiveFit);

    /**
     * 修改保存对于文书的年度或科技的类型的
     * 
     * @param archiveFit 保存对于文书的年度或科技的类型的
     * @return 结果
     */
    public int updateArchiveFit(ArchiveFit archiveFit);

    /**
     * 删除保存对于文书的年度或科技的类型的
     * 
     * @param id 保存对于文书的年度或科技的类型的主键
     * @return 结果
     */
    public int deleteArchiveFitById(Long id);

    /**
     * 批量删除保存对于文书的年度或科技的类型的
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteArchiveFitByIds(Long[] ids);
}
