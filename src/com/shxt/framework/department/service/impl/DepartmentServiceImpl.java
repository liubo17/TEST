package com.shxt.framework.department.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shxt.framework.department.dao.DepartmentDao;
import com.shxt.framework.department.model.Department;
import com.shxt.framework.department.service.DepartmentService;
@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;
	@Override
	public List<Department> list() {
		return this.departmentDao.list();
	}
	@Override
	public void save( Department department ) {
		try {
			this.departmentDao.save(department);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("保存部门信息失败");
		}

	}
	@Override
	public Department load( Integer dept_id ) {
		return this.departmentDao.load(dept_id);
	}
	@Override
	public void update( Department department ) {
		try {
			this.departmentDao.update(department);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("更新部门信息失败");
		}

	}
	@Override
	public void delete( Integer dept_id ) {
		Department dept= this.load(dept_id);
		if(dept.getIs_delete()==1){
			dept.setIs_delete(-1);
		}else{
			dept.setIs_delete(1);
		}
		try {
			this.departmentDao.delete(dept);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("删除部门信息失败");
		}
	}
	@Override
	public void validDepartmentName( String dept_name ) {
		int count = this.departmentDao.countDepartmentName(dept_name);
		if(count>0){
			throw new RuntimeException("该名称已被使用，请重新设置");
		}
	}

}
