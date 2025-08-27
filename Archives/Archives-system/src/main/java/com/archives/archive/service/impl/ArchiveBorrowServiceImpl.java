package com.archives.archive.service.impl;

import com.archives.archive.domain.ArchiveBorrow;
import com.archives.archive.domain.ArchiveInfo;
import com.archives.archive.domain.SearchJson;
import com.archives.archive.mapper.ArchiveBorrowMapper;
import com.archives.archive.mapper.ArchiveInfoMapper;
import com.archives.archive.service.IArchiveBorrowService;
import com.archives.common.core.domain.entity.SysUser;
import com.archives.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

@Service
public class ArchiveBorrowServiceImpl implements IArchiveBorrowService {
    @Autowired
    private ArchiveBorrowMapper archiveBorrowMapper;
    @Autowired
    private ArchiveInfoMapper archiveInfoMapper;

    /**
     * 查询ArchiveBorrow
     *
     * @param id ArchiveBorrow主键
     * @return ArchiveBorrow
     */
    @Override
    public ArchiveBorrow selectArchiveBorrowById(Long id)
    {
        return archiveBorrowMapper.selectArchiveBorrowById(id);
    }

    /**
     * 查询ArchiveBorrow列表
     *
     * @param archiveBorrow ArchiveBorrow
     * @return ArchiveBorrow
     */
    @Override
    public List<ArchiveBorrow> selectArchiveBorrowList(ArchiveBorrow archiveBorrow)
    {
        return archiveBorrowMapper.selectArchiveBorrowList(archiveBorrow);
    }

    /**
     * 新增ArchiveBorrow
     *
     * @param archiveBorrow ArchiveBorrow
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertArchiveBorrow(ArchiveBorrow archiveBorrow) {
        // 输入参数验证
        if (archiveBorrow == null) {
            throw new IllegalArgumentException("archiveBorrow cannot be null");
        }

        String archiveNumber = archiveBorrow.getArchiveNumber();
        String title = archiveBorrow.getTitle();
        String archiveId = archiveBorrow.getArchiveId();

        // 处理档案号分割逻辑
        String[] archiveNumbers = parseArchiveNumbers(archiveNumber);
        String[] titles = parseTitles(title, archiveNumbers.length);
        String[] archiveIds = parseArchiveIds(archiveId);

        // 验证档案号不能为空
        if (archiveNumbers.length == 0) {
            throw new IllegalArgumentException("archiveNumber cannot be null or empty");
        }

        // 验证标题数量与档案号数量匹配
        if (titles.length != archiveNumbers.length) {
            throw new IllegalArgumentException("档案号数量与标题数量不匹配");
        }

        int insertCount = 0;

        // 为每个档案号创建独立的借阅记录
        for (int i = 0; i < archiveNumbers.length; i++) {
            // 创建新的借阅对象
            ArchiveBorrow singleBorrow = new ArchiveBorrow();

            // 复制公共字段
            singleBorrow.setBorrower(archiveBorrow.getBorrower());
            singleBorrow.setApplicant(archiveBorrow.getApplicant());
            singleBorrow.setBorrowingTime(archiveBorrow.getBorrowingTime());
            singleBorrow.setBorrowingPurpose(archiveBorrow.getBorrowingPurpose());
            singleBorrow.setReturnTime(archiveBorrow.getReturnTime());
            singleBorrow.setCreateBy(archiveBorrow.getCreateBy());
            singleBorrow.setCreateTime(new Date());

            // 设置当前档案号和标题
            singleBorrow.setArchiveNumber(archiveNumbers[i]);
            singleBorrow.setTitle(titles[i]);
            singleBorrow.setArchiveId(archiveIds[i]);

            // 插入单条记录
            archiveBorrowMapper.insertArchiveBorrow(singleBorrow);
            insertCount++;
        }

        // 更新档案信息表中的is_borrow字段
        archiveInfoMapper.updateIsBorrow(archiveNumbers);

        return insertCount;
    }

    /**
     * 解析档案号字符串为数组
     *
     * @param archiveNumber 档案号字符串
     * @return 档案号数组
     */
    private String[] parseArchiveNumbers(String archiveNumber) {
        if (archiveNumber == null || archiveNumber.trim().isEmpty()) {
            return new String[0];
        }

        if (archiveNumber.contains(",")) {
            // 按逗号分割并去除前后空格
            return Arrays.stream(archiveNumber.split("\\s*,\\s*"))
                    .filter(s -> !s.isEmpty())
                    .toArray(String[]::new);
        } else {
            return new String[]{archiveNumber.trim()};
        }
    }

    /**
     * 解析标题字符串为数组
     *
     * @param title 标题字符串
     * @param expectedCount 期望的标题数量（与档案号数量一致）
     * @return 标题数组
     */
    private String[] parseTitles(String title, int expectedCount) {
        if (title == null || title.trim().isEmpty()) {
            // 如果标题为空，返回相同数量的空字符串
            return new String[expectedCount];
        }

        if (title.contains(",")) {
            // 按逗号分割标题
            String[] titles = Arrays.stream(title.split("\\s*,\\s*"))
                    .filter(s -> !s.isEmpty())
                    .toArray(String[]::new);

            // 如果标题数量与档案号数量不一致，用最后一个标题填充剩余位置
            if (titles.length < expectedCount) {
                String[] filledTitles = new String[expectedCount];
                System.arraycopy(titles, 0, filledTitles, 0, titles.length);
                // 用最后一个标题填充剩余位置
                for (int i = titles.length; i < expectedCount; i++) {
                    filledTitles[i] = titles.length > 0 ? titles[titles.length - 1] : "";
                }
                return filledTitles;
            } else if (titles.length > expectedCount) {
                // 如果标题数量超过档案号数量，截取前面的部分
                return Arrays.copyOf(titles, expectedCount);
            } else {
                return titles;
            }
        } else {
            // 单个标题，复制到所有档案号
            String[] titles = new String[expectedCount];
            Arrays.fill(titles, title.trim());
            return titles;
        }
    }

    private String[] parseArchiveIds(String archiveId) {
        if (archiveId == null || archiveId.trim().isEmpty()) {
            return new String[0];
        }

        if (archiveId.contains(",")) {
            // 按逗号分割并去除前后空格
            return Arrays.stream(archiveId.split("\\s*,\\s*"))
                    .filter(s -> !s.isEmpty())
                    .toArray(String[]::new);
        } else {
            return new String[]{archiveId.trim()};
        }
    }

    /**
     * 修改ArchiveBorrow
     *
     * @param archiveBorrow ArchiveBorrow
     * @return 结果
     */
    @Override
    public int updateArchiveBorrow(ArchiveBorrow archiveBorrow)
    {
        return archiveBorrowMapper.updateArchiveBorrow(archiveBorrow);
    }

    /**
     * 批量删除ArchiveBorrow
     *
     * @param ids 需要删除的ArchiveBorrow主键
     * @return 结果
     */
    @Override
    public int deleteArchiveBorrowByIds(Long[] ids)
    {
        return archiveBorrowMapper.deleteArchiveBorrowByIds(ids);
    }

    /**
     * 删除ArchiveBorrow信息
     *
     * @param id ArchiveBorrow主键
     * @return 结果
     */
    @Override
    public int deleteArchiveBorrowById(Long id)
    {
        return archiveBorrowMapper.deleteArchiveBorrowById(id);
    }

    @Override
    public List<Long> getArchiveBorrowList(ArchiveInfo archiveInfo) {
        String[] dataPermiList =selectSearchByDataPermit();
        List<Long> archiveBorrowList = archiveBorrowMapper.getArchiveBorrowList(archiveInfo,dataPermiList);
        return archiveBorrowList;
    }

    @Override
    public SearchJson getArchiveBorrowListAll(SearchJson searchJson) {
        String[] dataPermiList =selectSearchByDataPermit();
        int pageNum = searchJson.getPageNum();
        int pageSize = searchJson.getPageSize();
        int offset = (pageNum - 1) * pageSize;
        String categoryId = searchJson.getCategoryId();
        String archiveNumber = searchJson.getArchiveNumber();
        String field9 = searchJson.getField9();

        List<ArchiveInfo> archiveBorrowListAll = archiveBorrowMapper.getArchiveBorrowListAll(categoryId,archiveNumber,field9,pageSize,offset,dataPermiList);
        int total = archiveBorrowMapper.getArchiveBorrowCount(categoryId,archiveNumber,field9,dataPermiList);
        searchJson.setTotal(total);
        searchJson.setSearchResults(archiveBorrowListAll);
        return searchJson;
    }

    @Override
    public SysUser getArchiveBorrowUser() {
        return SecurityUtils.getLoginUser().getUser();
    }

    public String[] selectSearchByDataPermit() {
        SysUser currentUser = SecurityUtils.getLoginUser().getUser();
        String[] dataPermiList;
        if("all".equals(currentUser.getDataPermi())){
            dataPermiList = new String[0];
        }else {
            dataPermiList = (currentUser.getDataPermi().split(","));
        }
        return dataPermiList;
    }
}
