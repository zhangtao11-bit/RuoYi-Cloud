package com.ruoyi.business.controller;

import com.ruoyi.common.core.web.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 参数配置 信息操作处理
 *
 * @author ruoyi
 */
@RestController
public class TestController extends BaseController {

    @RequestMapping("/test")
    public String test(){
        return "业务模块";
    }
}
