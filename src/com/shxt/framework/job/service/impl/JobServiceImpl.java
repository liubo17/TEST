package com.shxt.framework.job.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shxt.framework.job.dao.JobDao;
import com.shxt.framework.job.model.Job;
import com.shxt.framework.job.service.JobService;
@Service
public class JobServiceImpl implements JobService {
	@Autowired
	private JobDao jobDao;
	@Override
	public List<Job> list() {

		return this.jobDao.list();
	}
	@Override
	public void save( Job job ) {
		try {
			this.jobDao.save(job);
		} catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
			throw new RuntimeException("保存职位信息失败");
		}

	}
	@Override
	public Job load( Integer job_id ) {
		return this.jobDao.load(job_id);
	}
	@Override
	public void update( Job job ) {
		try {
			this.jobDao.update(job);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("更新职位信息失败");
		}

	}
	@Override
	public void validJobName( String job_name ) {
		int count = this.jobDao.countJobName(job_name);
		if(count>0){
			throw new RuntimeException("该名称已被使用，请重新设置");
		}

	}

}
