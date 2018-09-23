package com.shxt.mannger.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class InitDataListener implements ServletContextListener {
	@Override
	public void contextInitialized( ServletContextEvent sce ) {
		//固定数据
		Map<String, String> roleMap = new HashMap<String,String>();
		roleMap.put("admin", "超级管理员");
		roleMap.put("manager", "经理");
		roleMap.put("employee", "普通员工");
		//WEB域保存到Application的范围
		ServletContext application = sce.getServletContext();
		application.setAttribute("roles", roleMap);

		Map<String, Object> map1 = new HashMap<>();
		map1.put("url", "sys/user/index");
		map1.put("name", "系统用户管理");
		Map<String,Object> map2 = new HashMap<>();
		map2.put("url", "sys/loginlog/find");
		map2.put("name", "登陆日志管理");
		Map<String,Object> map3 = new HashMap<>();
		map3.put("url", "sys/employee/find");
		map3.put("name", "雇员信息管理");
		Map<String,Object> map4 = new HashMap<>();
		map4.put("url", "sys/department/list");
		map4.put("name", "部门信息管理");
		Map<String,Object> map5 = new HashMap<>();
		map5.put("url", "sys/job/list");
		map5.put("name", "职位信息管理");
		Map<String,Object> map6 = new HashMap<>();
		map6.put("url", "sys/notice/find");
		map6.put("name", "公告管理");
		Map<String,Object> map7 = new HashMap<>();
		map7.put("url", "sys/document/find");
		map7.put("name", "文档管理");
		Map<String,Object> map8 = new HashMap<>();
		map8.put("url", "sys/user/password");
		map8.put("name", "修改口令");

		List<Map<String,Object>> adminList = new ArrayList<>();
		adminList.add(map1);
		adminList.add(map2);
		adminList.add(map4);
		adminList.add(map5);
		adminList.add(map8);
		List<Map<String,Object>> managerList = new ArrayList<>();
		managerList.add(map1);
		managerList.add(map3);
		managerList.add(map6);
		managerList.add(map7);
		managerList.add(map8);
		List<Map<String,Object>> employeeList = new ArrayList<>();
		employeeList.add(map7);
		employeeList.add(map8);
		Map<String,Object> menuMap = new HashMap<>();
		menuMap.put("admin", adminList);
		menuMap.put("manager", managerList);
		menuMap.put("employee", employeeList);
		application.setAttribute("menus", menuMap);

	}
	@Override
	public void contextDestroyed( ServletContextEvent arg0 ) {
		// TODO Auto-generated method stub

	}


}
