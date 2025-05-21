package com.archives.web.controller.archive;

import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import com.archives.archive.service.IFilePreviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/archive/preview")
public class FilePreviewController extends BaseController {

    @Autowired
    private IFilePreviewService filePreviewService;

    /**
     * 获取文件预览URL
     */
    @GetMapping("/url")
    public AjaxResult getPreviewUrl(@RequestParam("filePath") String filePath) {

        String previewUrl = filePreviewService.generatePreviewUrl(filePath);
        if (previewUrl == null) {
            return error("文件不可预览或路径错误");
        }

        return success(previewUrl);
    }
}
