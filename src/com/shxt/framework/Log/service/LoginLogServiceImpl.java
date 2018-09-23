package com.shxt.framework.Log.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shxt.framework.Log.dao.LoginLogDao;
import com.shxt.framework.Log.model.LoginLog;
import com.shxt.mannger.model.Pager;
@Service
public class LoginLogServiceImpl implements LoginLogService {
	@Autowired
	private LoginLogDao loginLogDao;
	@Override
	public void insert( LoginLog loginLog ) {
		try {
			this.loginLogDao.insert(loginLog);

		} catch (Exception ex) {
			ex.printStackTrace();
			//处理异常
			throw new RuntimeException("保存登陆日志失败");
		}
	}

	@Override
	public Pager find(Pager pager) {
		Map<String,Object> tempMap = pager.getQuery();
		System.out.println(pager);

		if(tempMap.get("startDate")!=null&&tempMap.get("endDate")!=null
				&&!"".equals(tempMap.get("startDate").toString())&&!"".equals(tempMap.get("endDate").toString())){
			pager.getQuery().put("flag", 3);
		}else{
			if(tempMap.get("startDate")!=null&&!"".equals(tempMap.get("startDate").toString())){
				pager.getQuery().put("flag", 1);
			}
			if(tempMap.get("endDate")!=null&&!"".equals(tempMap.get("endDate").toString())){
				pager.getQuery().put("flag", 2);
			}
		}

		//1.获取结果集数据
		List<LoginLog> dataList = this.loginLogDao.list(pager);
		//2.获取总记录数
		int totalCount = this.loginLogDao.count(pager);
		//3保存数据
		pager.setDatas(dataList);
		pager.setTotalCount(totalCount);

		return pager;

	}

}
