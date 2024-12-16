package com.archives.web.controller.archive;

import com.archives.archive.domain.HomeData;
import com.archives.archive.service.IHomePageService;
import com.archives.common.core.controller.BaseController;
import com.archives.common.core.domain.AjaxResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/home")
public class HomePageController extends BaseController {

    @Autowired
    private IHomePageService homePageService;

    @GetMapping("/data")
    public AjaxResult data( HomeData homeData) {
        System.out.println("homeData: " + homeData);
        return AjaxResult.success(homePageService.getData(homeData));
    }

    @GetMapping("/get")
    public AjaxResult get() {
        return AjaxResult.success(homePageService.get());
    }

    @GetMapping("/import")
    public AjaxResult importData() {return AjaxResult.success(homePageService.importData());}

    @GetMapping("/importOss")
    public AjaxResult importOss() {return AjaxResult.success(homePageService.importOss());}

}
