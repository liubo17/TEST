<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	        + path + "/";
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
<title>编辑用户页面</title>
<link href="resource/admin/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="formbody">

		<div class="formtitle">
			<span>用户基本信息</span>
		</div>
        <form action="sys/user/update" method="post" id="userForm">
		<ul class="forminfo">
			<li><label>用户姓名</label><input id="user_name" name="user_name" type="text"class="dfinput" maxlength="10" value="${user.user_name }"/><i id="error">姓名不能超过10个字符</i></li>
			<li><label>角色</label>
			     <select name="role_name" class="select_show">
                    <option value="">请选择角色</option>
                <c:forEach items="${applicationScope.roles }" var="role">
                    <option value="${role.key }">${role.value }</option>
           </c:forEach>
        </select>
			</li>
			<li><label>&nbsp;</label><input  type="button"
				class="btn" value="确认更新" /></li>
		</ul>
		<!-- 更新操作需要隐藏域 -->
		<input type="hidden" name="dept_id" value="${user.user_id }">
		<!-- 请求方式  post请求 -->
		<input type="hidden" name="_method" value="put">
		<!-- 判断姓名是否被修改 -->
		<input type="hidden" id="old_user_name" value="${user.user_name }">
		</form>
	</div>
	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
        $(".btn").on("click",function(){
            
            var user_name = $.trim($("#user_name").val());
            if(user_name===""){
                //alert("部门名称不允许为空")；
                $("#error").css("color","red").html("姓名不允许为空");
                $("#user_name").focus();
                return false;
            }
            var old_user_name = $("#old_user_name").val();
            if(user_name==old_user_name){
            	 $("#userForm").submit();
            	 return;
            }else{
                //验证姓名是否重复
                $.get("sys/user/validUserName",{user_name:user_name},function(data){
                    if(data.flag=="success"){
                        $("#userForm").submit();
                        return;
                    }else{
                        $("#error").css("color","red").html(data.message);
                        $("#user_name").val(old_user_name);
                        $("#user_name").focus();
                        return false;
                    }
                });
            }
            
           
        });
    });
		   
	</script>
</body>

</html>
