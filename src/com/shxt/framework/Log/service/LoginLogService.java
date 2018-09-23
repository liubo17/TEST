package com.shxt.framework.Log.service;

import com.shxt.framework.Log.model.LoginLog;
import com.shxt.mannger.model.Pager;

public interface LoginLogService {
	/**
	 * 业务逻辑层--添加登录日志
	 * @param loginLog
	 * @return返回影响的函数
	 */
	void insert(LoginLog loginLog);
	/**
	 * 数据访问层--返回登陆日志倒序列表
	 * @return
	 */
	Pager find(Pager pager);

}
