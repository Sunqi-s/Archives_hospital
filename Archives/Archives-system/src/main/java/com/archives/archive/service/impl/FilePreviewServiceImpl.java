package com.archives.archive.service.impl;

import com.archives.common.config.ArchivesConfig;
import com.archives.common.utils.StringUtils;
import com.archives.archive.service.IFilePreviewService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Service
public class FilePreviewServiceImpl implements IFilePreviewService {

    @Value("${kkfileview.server-url}")
    private String kkFileViewServerUrl;

    @Value("${kkfileview.allowed-file-types}")
    private String allowedFileTypes;

    // 添加文件服务器基础URL配置
    @Value("${file.server.base-url}")
    private String fileServerBaseUrl;

    /**
     * 生成文件预览URL
     */
    @Override
    public String generatePreviewUrl(String filePath) {
        if (StringUtils.isEmpty(filePath)) {
            return null;
        }

        // 检查文件类型是否允许预览
        if (!isPreviewable(filePath)) {
            return null;
        }

        try {

            // 构建完整文件URL
            String fullUrl = fileServerBaseUrl + filePath;

            // 1. 使用标准Base64编码（非URL安全模式），保留填充符
            String base64EncodedUrl = Base64.getEncoder()  // 使用标准编码器
                    .encodeToString(fullUrl.getBytes(StandardCharsets.UTF_8));

            // 2. 对Base64结果进行URI编码，转义所有特殊字符
            String encodedUrl = URLEncoder.encode(base64EncodedUrl, "UTF-8")
                    .replace("+", "%2B")  // 手动替换+为%2B（Java URLEncoder未处理）
                    .replace("=", "%3D"); // 手动替换=为%3D（可选，根据前端是否保留填充符）

            // 生成最终预览URL
            return kkFileViewServerUrl + "/onlinePreview?url=" + encodedUrl;


        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 检查文件是否可预览
     */
    private boolean isPreviewable(String filePath) {
        if (StringUtils.isEmpty(filePath)) {
            return false;
        }

        // 获取文件扩展名
        String fileExtension = StringUtils.substringAfterLast(filePath, ".").toLowerCase();

        // 检查是否在允许的文件类型列表中
        return allowedFileTypes.contains(fileExtension);
    }
}
