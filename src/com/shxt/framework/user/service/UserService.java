package com.shxt.framework.user.service;

import com.shxt.framework.user.model.User;
import com.shxt.mannger.model.Pager;

public interface UserService {
	User login(String account,String password);
	Pager find(Pager pager);
	void save(User user);
	User load(Integer user_id);
	void validAccount(String account);
	void validUserName(String user_name);
	void update(User user);
	void delete(Integer user_id);
}
