<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>欢迎登录后台管理系统</title>
<link href="resource/admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="resource/admin/js/jquery.js"></script>

<script language="javascript">
    $(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    $(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

</head>

<body style="background-color:#31A469; background-image:url(resource/admin/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


    <div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <form action="sys/login" method="post">
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
    <li><input id="account" name="account" type="text" class="loginuser" value="${account }" placeholder="请输入账号" autofocus="autofocus"/></li>
    <li><input id="password" name="password" type="password" class="loginpwd" placeholder="请输入密码"/></li>
    <li><input type="button" class="loginbtn" value="登录"/>
    <label style="color:red;">${message }</label></li>
    </ul>
    </div>
    </div>
    </form>
    <div class="loginbm">版权所有  2017  <a href="http://www.jianshu.com/u/f89cad0c1a52">jianshu.com</a>  仅供学习交流，勿用于任何商业用途</div>
    <script type="text/javascript" src="resource/jquery-1.11.3.js"></script>
    <script type="text/javascript">
    $(function(){
        $(".loginbtn").on("click",function(){
            var account = $.trim($("#account").val());
            var password = $.trim($("#password").val());//trim去掉两端的空格
            if(account=== ""){
                $("form  label").html("请输入账号");
                $("#account").focus();
                return false
            }
            if(password=== ""){
                $("form  label").html("请输入密码");
                $("#password").focus();
                return false
            }
            /*重新赋值  */
            $("#account").val(account);
            $("#password").val(password);
            $("form").submit();
        });
    });
    </script>
</body>

</html>

