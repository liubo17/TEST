package com.shxt.framework.job.service;

import java.util.List;
import com.shxt.framework.job.model.Job;

public interface JobService {
	List<Job> list();
	void save(Job job);
	Job load(Integer job_id);
	void update(Job job);
	void validJobName(String job_name);

}
