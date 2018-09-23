package com.shxt.framework.job.web;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shxt.framework.job.model.Job;
import com.shxt.framework.job.service.JobService;

@Controller
@RequestMapping("/sys/job")
public class JobController {
	@Autowired
	private JobService jobService;
	@GetMapping("/list")
	public String list(Model model){
		model.addAttribute("jobList",this.jobService.list());
		return "jsp/job/list";
	}
	@GetMapping("/add")
	public String toAdd(){
		return "jsp/job/add";
	}
	@PostMapping("/add")
	public String save(Job job,Model model){
		try {
			this.jobService.save(job);
			model.addAttribute("flag","success");
			model.addAttribute("message","新增职位成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";
	}
	//占位符使用
	@GetMapping("/update/{id}")
	public String toUpdate(@PathVariable("id") Integer job_id,Model model){
		model.addAttribute("job",this.jobService.load(job_id));
		return "jsp/job/update";
	}
	@PutMapping("/update")
	public String update(Job job,Model model){
		try {
			this.jobService.update(job);
			model.addAttribute("flag","success");
			model.addAttribute("message","更新职位成功");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			model.addAttribute("flag","error");
			model.addAttribute("message",ex.getMessage());
		}
		return "jsp/message";
	}
	@GetMapping("/validJobName")
	@ResponseBody
	public Map<String, Object> validJobName(String job_name){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			this.jobService.validJobName(job_name);
			map.put("flag", "success");
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			map.put("flag", "error");
			map.put("message", ex.getMessage());
		}
		return map;
	}

}
