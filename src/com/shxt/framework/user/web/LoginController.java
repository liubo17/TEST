package com.shxt.framework.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shxt.framework.Log.model.LoginLog;
import com.shxt.framework.Log.service.LoginLogService;
import com.shxt.framework.user.exception.LoginException;
import com.shxt.framework.user.model.User;
import com.shxt.framework.user.service.UserService;
import com.shxt.mannger.web.BaseController;

@Controller
@RequestMapping("/sys")
public class LoginController extends BaseController {
	@Autowired
	private UserService userService ;
	@Autowired
	private LoginLogService loginLogService;
	@PostMapping("/login")
	public String login(String account,String password,ModelMap modelMap){
		try {
			User user = this.userService.login(account, password);
			//获取session保存对象

			this.session.setAttribute("session_user", user);
			LoginLog loginLog = new LoginLog();
			loginLog.setUser_id(user.getUser_id());
			loginLog.setIp(this.request.getRemoteAddr());
			this.loginLogService.insert(loginLog);

			//重定向到另一个controller
			return "redirect:/sys/main";

		} catch (LoginException ex) {

			ex.printStackTrace();
			//错误信息
			modelMap.addAttribute("message", ex.getMessage());
			//回显数据
			modelMap.addAttribute("account", account);
			return "jsp/login";
		}
	}
	@GetMapping("/loginout")
	public String loginout(){
		//手动注销Session对象
		this.session.invalidate();
		return "jsp/login";
	}

}
