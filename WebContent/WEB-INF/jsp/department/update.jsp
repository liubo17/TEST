<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>编辑部门页面</title>
<link href="resource/admin/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="formbody">

		<div class="formtitle">
			<span>部门基本信息</span>
		</div>
        <form action="sys/department/update" method="post" id="departmentForm">
		<ul class="forminfo">
			<li><label>部门名称</label><input id="dept_name" name="dept_name" type="text"class="dfinput" maxlength="10" value="${department.dept_name }"/><i id="error">部门名称不能超过10个字符</i></li>
			<li><label>部门职能</label><textarea name="remark" type="text" class="dfinput" maxlength="100"/>${department.remark }</textarea></li>
			<li><label>&nbsp;</label><input  type="button"
				class="btn" value="确认更新" /></li>
		</ul>
		<!-- 更新操作需要隐藏域 -->
		<input type="hidden" name="dept_id" value="${department.dept_id }">
		<!-- 请求方式  post请求 -->
		<input type="hidden" name="_method" value="put">
		<!-- 判断部门名称是否被修改 -->
		<input type="hidden" id="old_dept_name" value="${department.dept_name }">
		</form>
	</div>
	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){
        $(".btn").on("click",function(){
            
            var dept_name = $.trim($("#dept_name").val());
            
            if(dept_name===""){
                //alert("部门名称不允许为空")；
                $("#error").css("color","orange").html("部门名称不允许为空");
                $("#dept_name").focus();
                return false;
            }
            var old_dept_name = $("#old_dept_name").val();
            if(dept_name==old_dept_name){
                $("#departmentForm").submit();
                return;
            }else{
                //验证部门是否重复
                $.get("sys/department/validDepartmentName",{dept_name:dept_name},function(data){
                    if(data.flag=="success"){
                        $("#departmentForm").submit();
                        return;
                    }else{
                        $("#error").css("color","red").html(data.message);
                        $("#dept_name").val(old_dept_name);
                        $("#dept_name").focus();
                        return false;
                    }
                });
            }
        });
    });
		   
	</script>
</body>

</html>
