package com.shxt.mannger.util;

import java.io.IOException;
import java.io.InputStream;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/*
 * final关键字
 * 修饰类：不能被继承
 * 修饰变量：常量
 * 修饰方法：不能被重写
 * */
public final class MyBatisUtils {
	private MyBatisUtils(){}//不允许进行实例化
	/*
	 * static关键字
	 * 修饰类 ：不能修饰  外部类
	 * 修饰变量：类变量，共享数据
	 * 修饰方法：类方法
	 * */
	private final static String PATH="mybatis_config.xml";
	private static SqlSessionFactory sqlSessionFactory;//成员变量
	static{
		try {
			InputStream is = Resources.getResourceAsStream(MyBatisUtils.PATH);
			MyBatisUtils.sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);

		} catch (IOException ex) {
			ex.printStackTrace();
			throw new  RuntimeException("加载核心配置文件出错");//自己处理异常
		}
	}
	//获取SqlSession
	public static SqlSession getSqlSession(){
		return MyBatisUtils.sqlSessionFactory.openSession();
	}
	//关闭资源
	public static void closeSqlSession(SqlSession sqlSession){
		if(sqlSession!=null){
			sqlSession.close();
		}
	}
}
