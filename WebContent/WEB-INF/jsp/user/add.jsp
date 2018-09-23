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
		<title>系统用户管理</title>
        <link href="resource/admin/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

    
    <div class="formbody">
    
    <div class="formtitle"><span>系统用户的基本信息</span></div>
    <form action="sys/user/add" method="post" id="userForm">
    <ul class="forminfo">
    <li><label>账号</label><input name="account" id="account" type="text" class="dfinput" maxlength="10" autofocus="autofocus"/><i id="error1">账号名称不能超过10个字符</i></li>
    <li><label>姓名</label><input name="user_name" id="user_name" type="text" class="dfinput" maxlength="10" autofocus="autofocus"/><i id="error2">用户名称不能超过10个字符</i></li>
    <li><label>密码</label><input name="password" id="password" type="password" class="dfinput" maxlength="10" autofocus="autofocus"/></li>
    <li><label>角色</label>
        <select name="role_name" class="select_show">
            <option value="">请选择角色</option>
           <c:forEach items="${applicationScope.roles }" var="role">
                <option value="${role.key }">${role.value }</option>
           </c:forEach>
        </select>
    </li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    </form>
    
    </div>

    <script type="text/javascript" src="resource/admin/js/jquery.js"></script>
    <script type="text/javascript">
    $(function(){
    	$(".btn").on("click",function(){
    		var account = $.trim($("#account").val());
    		var user_name = $.trim($("#user_name").val());
    		if(account===""){
                //alert("账号名称不允许为空")；
                $("#error1").css("color","red").html("账号名称不允许为空");
                $("#accont").focus();
                return false;
            }
    		//验证账号是否重复
            $.get("sys/user/validAccount",{account:account},function(data){
                if(data.flag=="success"){
                    //$("#userForm").submit();
                    return;
                }else{
                    $("#error1").css("color","red").html(data.message);
                    $("#account").focus();
                    return false;
                }
            });
    		if(user_name===""){
    			//alert("用户名称不允许为空")；
    			$("#error2").css("color","red").html("部门名称不允许为空");
    			$("#user_name").focus();
    			return false;
    		}
    		
    		//验证用户名是否重复
    		$.get("sys/user/validUserName",{user_name:user_name},function(data){
                if(data.flag=="success"){
                    $("#userForm").submit();
                    return;
                }else{
                    $("#error2").css("color","red").html(data.message);
                    $("#user_name").focus();
                    return false;
                }
            });
    	});
    });
    </script>
</body>

</html>
