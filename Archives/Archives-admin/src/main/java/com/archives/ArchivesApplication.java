package com.archives;

import com.bstek.ureport.console.UReportServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;

/**
 * 启动程序
 *
 * @author archives
 */

@ImportResource("classpath:ureport-console-context.xml")
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class ArchivesApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(ArchivesApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  数字档案管理系统启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "     ,   ,       ,   ,      ,   ,      ,   , \n" +
                "    ///// |     ///// |    ///// |    ///// |\n" +
                "   /////  |    /////  |   /////  |   /////  |\n" +
                "  /////   |   /////   |  /////   |  /////   |\n" +
                " |~~~~| | |  |~~~~| | | |~~~~| | | |~~~~| | |\n" +
                " |====| |/|  |====| |/| |====| |/| |====| |/|\n" +
                " |    |/| |  |    |/| | |    |/| | |    |/| |\n" +
                " | 坤 | | |  | 坤 | | |  | 坤 | | |  | 坤 | | |\n" +
                " | 鹏 | | |  | 鹏 | | |  | 鹏 | | |  | 鹏 | | |\n" +
                " | 档 |  /   | 档 |  /   | 档 |  /   | 档 |  / \n" +
                " | 案 | /    | 案 | /    | 案 | /    | 案 | /  \n" +
                " |====|/     |====|/    |====|/     |====|/   \n" +
                " '----'      '----'     '----'      '----'    \n" );
    }

    @Bean
    public ServletRegistrationBean buildUReportServlet(){
        return new ServletRegistrationBean(new UReportServlet(),"/ureport/*");
    }
}



