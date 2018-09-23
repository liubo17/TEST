package com.shxt.framework.job.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.shxt.framework.job.model.Job;
@Repository
public interface JobDao {
	List<Job> list();

	void save(Job job);
	Job load(@Param("job_id") Integer job_id);

	void update(Job job);
	int countJobName(String job_name);

}
