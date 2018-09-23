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
<title>编辑职位页面</title>
<link href="resource/admin/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="formbody">

		<div class="formtitle">
			<span>职位基本信息</span>
		</div>
        <form action="sys/job/update" method="post" id="jobForm">
		<ul class="forminfo">
			<li><label>职位名称</label><input id="job_name" name="job_name" type="text"class="dfinput" maxlength="10" value="${job.job_name }"/><i id="error">职位名称不能超过10个字符</i></li>
			<li><label>职位描述</label><textarea name="remark" type="text" class="dfinput" maxlength="100"/>${job.remark }</textarea></li>
			<li><label>&nbsp;</label><input  type="button"
				class="btn" value="确认更新" /></li>
		</ul>
		<!-- 更新操作需要隐藏域 -->
		<input type="hidden" name="job_id" value="${job.job_id }">
		<!-- 请求方式  post请求 -->
		<input type="hidden" name="_method" value="put">
		</form>
	</div>
	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script type="text/javascript">
	 $(function(){
	        $(".btn").on("click",function(){
	            
	            var job_name = $.trim($("#job_name").val());
	            
	            if(job_name===""){
	                $("#error").css("color","orange").html("职位名称不允许为空");
	                $("#job_name").focus();
	                return false;
	            }
	            
	            var old_job_name = $("#old_job_name").val();
	            if(job_name==old_job_name){
	                $("#jobForm").submit();
	                return;
	            }else{
	                //验证职位是否为空
	                $.get("sys/job/validJobName",{job_name:job_name},function(data){
	                    if(data.flag=="success"){
	                        $("#jobForm").submit();
	                        return;
	                    }else{
	                        $("#error").css("color","red").html(data.message);
	                        $("#job_name").val(old_job_name);
	                        $("#job_name").focus();
	                        return false;
	                    }
	                });
	            }
	        });
	    });
	</script>
</body>

</html>
