package com.shxt.framework.user.web;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shxt.framework.user.model.User;
import com.shxt.framework.user.service.UserService;
import com.shxt.mannger.model.Pager;

@Controller
@RequestMapping("/sys/user")
public class UserController {
	//建立联系用的
	@Autowired
	private UserService userService;

	@GetMapping("/index")
	public String index(){
		return "jsp/user/find";
	}

	@GetMapping("/find")
	@ResponseBody
	public Pager find(Pager pager){
		pager = this.userService.find(pager);
		return pager;
	}
	@GetMapping("/add")
	public String toAdd(){
		return "jsp/user/add";
	}
	@PostMapping("/add")
	public String save(User user,Model model){
		try {
			this.userService.save(user);
			model.addAttribute("flag","success");
			model.addAttribute("message","新增用户成功");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";
	}

	@GetMapping("/validAccount")
	@ResponseBody
	public Map<String, Object> validAccount(String account){

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.userService.validAccount(account);
			map.put("flag","success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag","error");
			map.put("message",ex.getMessage());
		}
		return map;

	}

	@GetMapping("/validUserName")
	@ResponseBody
	public Map<String, Object> validUserName(String user_name){

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.userService.validUserName(user_name);
			map.put("flag","success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag","error");
			map.put("message",ex.getMessage());
		}
		return map;

	}
	//占位符使用
	@GetMapping("/update/{id}")
	public String toUpdate(@PathVariable("id") Integer user_id,Model model){
		model.addAttribute("user",this.userService.load(user_id));
		return "jsp/user/update";
	}
	@PutMapping("/update")
	public String udate(User user,Model model){
		try {
			this.userService.update(user);
			model.addAttribute("flag","success");
			model.addAttribute("message","更新职位成功");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";

	}
	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(Integer user_id){

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.userService.delete(user_id);
			map.put("flag","success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag","error");
			map.put("flag",ex.getMessage());
		}
		return map;

	}


}
