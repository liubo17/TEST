package com.shxt.framework.department.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.shxt.framework.department.model.Department;

@Repository
public interface DepartmentDao {
	List<Department> list();
	void save(Department department);
	Department load(@Param("dept_id") Integer dept_id);
	void update(Department department);
	void delete(Department department);
	int countDepartmentName(String dept_name);

}
