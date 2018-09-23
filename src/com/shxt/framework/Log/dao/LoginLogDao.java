package com.shxt.framework.Log.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.shxt.framework.Log.model.LoginLog;
import com.shxt.mannger.model.Pager;
@Repository
public interface LoginLogDao {
	/**
	 * 业务逻辑层--添加登录日志
	 * @param loginLog
	 * @return返回影响的函数
	 */
	int insert(LoginLog loginLog);
	/**
	 * 数据访问层--返回登陆日志倒序列表
	 * @return
	 */
	List<LoginLog> list(Pager pager);
	/**
	 * 数据访问层--返回总页数
	 * @return
	 */
	int count(Pager pager);


}
