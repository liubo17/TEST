package com.shxt.framework.department.service;

import java.util.List;
import com.shxt.framework.department.model.Department;

public interface DepartmentService {
	List<Department> list();
	void save(Department department);
	Department load(Integer dept_id);
	void update(Department department);
	void delete(Integer dept_id);
	void validDepartmentName(String dept_name);

}
