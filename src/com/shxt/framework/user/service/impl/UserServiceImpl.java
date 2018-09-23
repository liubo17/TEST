package com.shxt.framework.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shxt.framework.department.model.Department;
import com.shxt.framework.user.dao.UserDao;
import com.shxt.framework.user.exception.LoginException;
import com.shxt.framework.user.model.User;
import com.shxt.framework.user.service.UserService;
import com.shxt.mannger.model.Pager;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public User login( String account , String password ) {
		User user = this.userDao.login(account, password);
		if(user==null){
			throw new LoginException("用户名或密码错误，请重新输入");//自定义异常
		}
		return user;

	}
	@Override
	public Pager find( Pager pager ) {
		pager.setDatas(this.userDao.list(pager));
		pager.setTotalCount(this.userDao.countUsers(pager));
		return pager;
	}
	@Override
	public void save( User user ) {
		try {
			this.userDao.save(user);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("保存用户信息失败");
		}

	}
	@Override
	public User load( Integer user_id ) {
		return this.userDao.load(user_id);
	}
	@Override
	public void validAccount( String account ) {
		int count = this.userDao.countAccount(account);
		if(count>0){
			throw new RuntimeException("该账号已被使用，请重新设置");
		}

	}
	@Override
	public void validUserName( String user_name ) {
		int count = this.userDao.countUserName(user_name);
		if(count>0){
			throw new RuntimeException("该姓名已被使用，请重新设置");
		}
	}
	@Override
	public void update( User user ) {
		try {
			this.userDao.update(user);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("更新职位信息失败");
		}

	}
	@Override
	public void delete( Integer user_id ) {
		User user= this.load(user_id);
		if(user.getStatus()==1){
			user.setStatus(-1);
		}else{
			user.setStatus(1);
		}
		try {
			this.userDao.delete(user);
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("删除用户失败");
		}

	}

}
