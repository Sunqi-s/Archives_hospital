package com.archives.archive.domain;

public class DeptIdHolder {

    // 使用 ConcurrentHashMap 保存部门 ID（线程安全）
    private static String deptIdsHolder = "";

    // 保存部门 ID
    public static int saveDeptIds(String deptIds) {
        deptIdsHolder = deptIds;
        return 0;
    }

    // 获取部门 ID
    public static String getDeptIds() {
        return deptIdsHolder;
    }

    // 重置部门 ID
    public static void resetDeptIds() {
        deptIdsHolder = "";
    }
}
