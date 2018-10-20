package cc.openkit.admin.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin")
public class TestController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String test(){
        return "index";
    }
}
