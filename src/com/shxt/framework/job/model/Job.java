package com.shxt.framework.job.model;

public class Job {
	private Integer job_id;
	private String job_name;
	private String remark;
	public Integer getJob_id() {
		return this.job_id;
	}
	public void setJob_id( Integer job_id ) {
		this.job_id = job_id;
	}
	public String getJob_name() {
		return this.job_name;
	}
	public void setJob_name( String job_name ) {
		this.job_name = job_name;
	}
	public String getRemark() {
		return this.remark;
	}
	public void setRemark( String remark ) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Job [job_id=" + this.job_id + ", job_name=" + this.job_name + ", remark=" + this.remark + "]";
	}


}
