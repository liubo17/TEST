package com.shxt.framework.user.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.shxt.framework.user.model.User;
import com.shxt.mannger.model.Pager;
@Repository
public interface UserDao {
	User login(@Param("account") String account,@Param("password") String password);
	List<User> list(Pager pager);
	int countUsers(Pager pager);
	void save(User user);
	User load(@Param("user_id") Integer user_id);
	int countAccount(String account);
	int countUserName(String user_name);

	/**
	 * 用户更新
	 * */
	void update(User user);
	/**
	 * 用户删除
	 * */
	void delete(User user);
}
