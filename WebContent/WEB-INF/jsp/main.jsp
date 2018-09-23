<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%
	//项目的发布路径，例如:  /rabc
	String path = request.getContextPath();
	/*
	全路径，形式如下: http://127.0.0.1:8001/rbac/
	request.getScheme()      ——> http 获取协议
	request.getServerName()  --> 127.0.0.1 获取服务名
	request.getServerPort()  --> 8001 获取端口号
	path                     --> /rbac 获取访问的路径 路
	*/
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%-- 
	<base/>标签解决路径问题
	参考文章:http://www.cnblogs.com/muqianying/archive/2012/03/16/2400280.html
--%>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		 <title>后台主界面</title>
    <!-- 后台框架页面样式 -->
    <link rel="stylesheet" href="resource/admin/css/home.css" type="text/css"/>
    <!-- 引入字体图表 -->
    <link href="resource/admin/Font-Awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>



</head>
<div class="backAdmin">
    <div class="top">
        <!-- logo  -->
        <div class="topleft">
            <a href="main.html" target="_top"><img src="resource/admin/images/logo.png" title="系统首页"/></a>
        </div>

        <!-- 首页导航 -->
        <ul class="nav">
            <li><a href="default.html" target="rightFrame" class="selected"><img src="resource/admin/images/icon01.png" title="工作台"/>
                <h2>工作台</h2></a>
            </li>
            <li><a href="javascript:;" target="rightFrame">
                <img src="resource/admin/images/icon02.png" title="模型管理"/>
                <h2>模型管理</h2>
            </a>
            </li>
            <li><a href="imglist.html" target="rightFrame"><img src="resource/admin/images/icon03.png" title="模块设计"/>
                <h2>模块设计</h2></a>
            </li>
            <li><a href="tools.html" target="rightFrame"><img src="resource/admin/images/icon04.png" title="常用工具"/>
                <h2>常用工具</h2></a>
            </li>
            <li><a href="computer.html" target="rightFrame"><img src="resource/admin/images/icon05.png" title="文件管理"/>
                <h2>文件管理</h2></a>
            </li>
            <li><a href="markdown.html" target="rightFrame"><img src="resource/admin/images/icon06.png" title="系统设置"/>
                <h2>系统设置</h2></a>
            </li>
        </ul>


        <div class="topright">
            <ul>
                <li>
                    <span>
                        <img src="resource/admin/images/help.png" title="帮助文档" class="helpimg"/>
                    </span>

                    <a href="javascript:void(0)">文档</a>
                </li>
                <li><a href="javascript:void(0)">关于</a></li>
                <li><a href="javascript:void(0)" id="loginout">安全退出</a></li>
            </ul>

            <div class="user">
                <img src="resource/admin/images/hanpang.png" alt="用户头像"/>
                <span>想不想有钱</span>
                <b>5</b>
            </div>

        </div>
    </div>

    <div class="left">
        <div class="lefttop">
            <i class="icon-cloud icon-large pull-left icon-border"></i>
            <span>信息导航</span>
        </div>

        <dl class="leftmenu">

            <dd>
                <div class="title">
                    <i class="icon-gears icon-large pull-left icon-border"></i>
                    <span>人事管理系统</span>
                </div>
                <ul class="menuson">
                <c:forEach items="${applicationScope.menus[sessionScope.session_user.role_name] }" var="menu">
                    <li> <i class="icon-github-sign"></i><a href="${menu.url }" target="rightFrame">${menu.name }</a></li>
                </c:forEach>
                   
                </ul>
            </dd>
        </dl>


    </div>
    <div class="right">
        <div class="inner">
            <!-- 设置iframe -->
            <iframe id="rightFrame" name="rightFrame" class="mainIframe" scrolling="no" frameborder="0" src="index123.html"
                    onload="initIframe()"></iframe>
        </div>
    </div>
    <div class="bottom">
        <span>码迷码迷吽, 仅供学习交流，请勿用于任何商业用途</span>
        <i> 版权所有 @ 2017 <a href="http://www.jianshu.com/u/f89cad0c1a52">胖先森简书</a> </i>
    </div>
</div>
<!-- Jquery支持 -->
<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
<script src="resource/admin/plugin/layer/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="resource/admin/js/home.js"></script>
<script type="text/javascript">
$(function(){
	$("#loginout").on("click",function(){
		if(window.confirm("你确定要退出该系统吗？")){
			window.top.location.href="sys/loginout";
		}
	    });
})
</script>

</body>
</html>