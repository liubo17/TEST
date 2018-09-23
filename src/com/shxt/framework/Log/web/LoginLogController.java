package com.shxt.framework.Log.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shxt.framework.Log.service.LoginLogService;
import com.shxt.mannger.model.Pager;

@Controller
@RequestMapping("/sys/loginlog")
public class LoginLogController {
	@Autowired
	private LoginLogService loginLogService;
	@GetMapping("/find")
	public String find(Pager pager,ModelMap modelMap){
		//传递数据
		//modelMap.addAttribute("loginLogList", this.loginLogService.list());
		modelMap.addAttribute("pager", this.loginLogService.find(pager));
		return "jsp/loginlog/find";
	}

}
