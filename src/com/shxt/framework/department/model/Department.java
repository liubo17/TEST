package com.shxt.framework.department.model;

public class Department {

	private Integer dept_id;
	private String dept_name;
	private String remark;
	private Integer is_delete;
	public Integer getDept_id() {
		return this.dept_id;
	}
	public void setDept_id( Integer dept_id ) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return this.dept_name;
	}
	public void setDept_name( String dept_name ) {
		this.dept_name = dept_name;
	}
	public String getRemark() {
		return this.remark;
	}
	public void setRemark( String remark ) {
		this.remark = remark;
	}
	public Integer getIs_delete() {
		return this.is_delete;
	}
	public void setIs_delete( Integer is_delete ) {
		this.is_delete = is_delete;
	}
	@Override
	public String toString() {
		return "Department [dept_id=" + this.dept_id + ", dept_name=" + this.dept_name + ", remark=" + this.remark
				+ ", is_delete=" + this.is_delete + "]";
	}

}
