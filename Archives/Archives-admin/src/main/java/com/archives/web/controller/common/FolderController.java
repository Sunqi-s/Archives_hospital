package com.archives.web.controller.common;


import com.archives.archive.domain.SearchJson;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.*;

// 该控制器用于获取指定路径下的文件夹
@RestController
@RequestMapping("/folders")
public class FolderController {

    @Value("${archives.profile}")
    private String baseFolderPath;

    // 获取指定路径下的文件夹
    @PostMapping("/getFoldersList")
    @ResponseBody
    public List<Map<String, Object>> getFolders() {

        String folderPath = baseFolderPath + File.separator + "handle-upload"; // 替换为实际路径
        File directory = new File(folderPath);

        List<Map<String, Object>> folders  = new ArrayList<>();

        // 检查路径是否存在且为目录
        if(directory.exists()){
            if(directory.isDirectory()){
                int index = 0;
                for (File file : Objects.requireNonNull(directory.listFiles())) {
                    if (file.isDirectory()) {
                        Map<String, Object> folderInfo = new HashMap<>();
                        folderInfo.put("label", file.getName());
                        folderInfo.put("hasChildren", Objects.requireNonNull(file.listFiles(File::isDirectory)).length > 0);
                        folderInfo.put("children",getSubFolders(file));
                        folderInfo.put("value", index++);
                        folders.add(folderInfo);
                    }
                }
            }
            else {
                throw new RuntimeException("无法读取文件夹");
            }
        }else {
            throw new RuntimeException("路径不存在");
        }
        return folders; // 返回文件夹列表
    }

    // 递归获取子文件夹
    private List<Map<String, Object>> getSubFolders(File directory) {
        int index = 0;
        List<Map<String, Object>> subFolders = new ArrayList<>();
        for (File file : Objects.requireNonNull(directory.listFiles())) {
            if (file.isDirectory()) {
                Map<String, Object> subFolderInfo = new HashMap<>();
                subFolderInfo.put("label", file.getName());
                subFolderInfo.put("hasChildren", Objects.requireNonNull(file.listFiles(File::isDirectory)).length > 0);
                subFolderInfo.put("children", getSubFolders(file)); // 递归获取子文件夹
                subFolderInfo.put("value",index++);
                subFolders.add(subFolderInfo);
            }
        }
        return subFolders;
    }

    // 获取指定文件夹下的文件列表
    @GetMapping("/files/")
    public List<Map<String, Object>> getFilesInFolder(@Param("searchJson") SearchJson searchJson) {
        String folderPath = baseFolderPath + File.separator + "handle-upload" + File.separator + searchJson.getPath(); // 替换为实际路径
        String subFolderPath = "/profile/handle-upload/" + searchJson.getPath();
        File folder = new File(folderPath);
        List<Map<String, Object>> files = new ArrayList<>();

        if (folder.exists() && folder.isDirectory()) {
            File[] fileList = folder.listFiles();
            if(fileList != null){
                for (File file : Objects.requireNonNull(folder.listFiles())) {
                    Map<String, Object> fileInfo = new HashMap<>();
                    fileInfo.put("name", file.getName());
                    fileInfo.put("url", subFolderPath + "/" + file.getName());
                    if (file.isFile()) {
                        fileInfo.put("size", file.length());
                        fileInfo.put("suffix",file.getName().substring(file.getName().lastIndexOf(".")));
                    }else {
                        fileInfo.put("hasChildren", Objects.requireNonNull(file.listFiles(File::isFile)).length > 0);
                        List<Map<String, Object>> children = new ArrayList<>();
                        for (File child : Objects.requireNonNull(file.listFiles())) {
                            Map<String, Object> childInfo = new HashMap<>();
                            childInfo.put("name", child.getName());
                            childInfo.put("url", subFolderPath + "/" + file.getName() + "/" + child.getName());
                            if (child.isFile()) {
                                childInfo.put("size", child.length());
                                childInfo.put("suffix", child.getName().substring(child.getName().lastIndexOf(".")));
                            }else {
                                childInfo.put("hasChildren", Objects.requireNonNull(child.listFiles(File::isFile)).length > 0);
                            }
                            children.add(childInfo);
                        }
                        fileInfo.put("children", children);
                    }
                    files.add(fileInfo);
                }
            }else {
                throw new RuntimeException("文件夹为空");
            }
        }else {
            throw new RuntimeException("文件夹不存在");
        }
        return files;
    }
}

