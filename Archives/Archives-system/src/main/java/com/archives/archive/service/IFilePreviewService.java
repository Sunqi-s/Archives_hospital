package com.archives.archive.service;

public interface IFilePreviewService {

    /**
     * 生成文件预览URL
     * @param filePath 文件路径
     * @return 预览URL
     */
    String generatePreviewUrl(String filePath);
}
