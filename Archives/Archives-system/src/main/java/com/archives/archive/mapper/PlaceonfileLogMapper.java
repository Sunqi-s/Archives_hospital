package com.archives.archive.mapper;

import java.util.List;
import com.archives.archive.domain.PlaceonfileLog;

/**
 * placeonlogMapper接口
 * 
 * @author é«å°å·
 * @date 2024-12-26
 */
public interface PlaceonfileLogMapper 
{
    /**
     * 查询placeonlog
     * 
     * @param placeonfileId placeonlog主键
     * @return placeonlog
     */
    public PlaceonfileLog selectPlaceonfileLogByPlaceonfileId(Long placeonfileId);

    /**
     * 查询placeonlog列表
     * 
     * @param placeonfileLog placeonlog
     * @return placeonlog集合
     */
    public List<PlaceonfileLog> selectPlaceonfileLogList(PlaceonfileLog placeonfileLog);

    /**
     * 新增placeonlog
     * 
     * @param placeonfileLog placeonlog
     * @return 结果
     */
    public int insertPlaceonfileLog(PlaceonfileLog placeonfileLog);

    /**
     * 修改placeonlog
     * 
     * @param placeonfileLog placeonlog
     * @return 结果
     */
    public int updatePlaceonfileLog(PlaceonfileLog placeonfileLog);

    /**
     * 删除placeonlog
     * 
     * @param placeonfileId placeonlog主键
     * @return 结果
     */
    public int deletePlaceonfileLogByPlaceonfileId(Long placeonfileId);

    /**
     * 批量删除placeonlog
     * 
     * @param placeonfileIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePlaceonfileLogByPlaceonfileIds(Long[] placeonfileIds);
}
