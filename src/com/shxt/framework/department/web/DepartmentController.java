package com.shxt.framework.department.web;

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
import com.shxt.framework.department.model.Department;
import com.shxt.framework.department.service.DepartmentService;

@Controller
@RequestMapping("/sys/department")
public class DepartmentController {
	@Autowired
	private DepartmentService departmentService;
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("departmentList",this.departmentService.list());
		return "jsp/department/list";
	}
	@GetMapping("/add")
	public String toAdd(){
		return "jsp/department/add";
	}
	@PostMapping("/add")
	public String save(Department department,Model model){
		try {
			this.departmentService.save(department);
			model.addAttribute("flag","success");
			model.addAttribute("message","新增部门成功");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";
	}
	//占位符使用
	@GetMapping("/update/{id}")
	public String toUpdate(@PathVariable("id") Integer dept_id,Model model){
		model.addAttribute("department",this.departmentService.load(dept_id));
		return "jsp/department/update";
	}
	@PutMapping("/update")
	public String udate(Department department,Model model){
		try {
			this.departmentService.update(department);
			model.addAttribute("flag","success");
			model.addAttribute("message","更新部门成功");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";

	}
	@DeleteMapping("/delete")
	@ResponseBody
	public Map<String, Object> delete(Integer dept_id){

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.departmentService.delete(dept_id);
			map.put("flag","success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag","error");
			map.put("flag",ex.getMessage());
		}
		return map;

	}
	@GetMapping("/validDepartmentName")
	@ResponseBody
	public Map<String, Object> validDepartmentName(String dept_name){

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.departmentService.validDepartmentName(dept_name);
			map.put("flag","success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag","error");
			map.put("message",ex.getMessage());
		}
		return map;

	}

}
