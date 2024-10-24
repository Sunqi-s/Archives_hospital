package com.archives.web.controller.common;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

// 该控制器用于获取指定路径下的文件夹
@RestController
@RequestMapping("/getFolders")
public class FolderController {

    @Value("${archives.profile}")
    private String baseFolderPath;

    // 获取指定路径下的文件夹
    @PostMapping("/api/folders")
    @ResponseBody
    public List<String> getFolders() {

        String folderPath = baseFolderPath + File.separator + "handle-upload"; // 替换为实际路径
        File folder = new File(folderPath);

        List<String> folderNames = new ArrayList<>();

        // 检查路径是否存在且为目录
        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        folderNames.add(file.getName()); // 添加文件夹名称
                    }
                }
            }
        } else {
            throw new RuntimeException("无法读取文件夹");
        }
        System.out.println("folderNames: " + folderNames);
        return folderNames; // 返回文件夹名称列表
    }
}

