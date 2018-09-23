package com.shxt.mannger.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class indexController {
	//登陆页面
	@GetMapping(path={"/","/index"})
	public String login(){
		return "jsp/login";
	}
	@GetMapping("/sys/main")
	public String main(){

		return "jsp/main";
	}

}
