package com.archives.web.controller.archive;

import com.archives.archive.domain.SearchJson;
import com.archives.archive.domain.template.*;
import com.archives.common.utils.poi.ExcelUtil;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/export")
public class ArchiveExportController {


    @PostMapping("/exportTemplate")
    public void exportTemplate( SearchJson searchJson, HttpServletResponse response) {
        ExcelUtil util = null;
        switch (searchJson.getCategoryId()) {
            case "32":
                util = new ExcelUtil<WenShu>(WenShu.class);
                break;
            case "35":
                util = new ExcelUtil<KejiAnjuan>(KejiAnjuan.class);
                break;
            case "36":
                util = new ExcelUtil<KejiJuannei>(KejiJuannei.class);
                break;
            case "65":
                util = new ExcelUtil<YewuAnjuan>(YewuAnjuan.class);
                break;
            case "66":
                util = new ExcelUtil<YewuJuannei>(YewuJuannei.class);
                break;

        }
        util.importTemplateExcel(response, "导出模版");

    }

}
