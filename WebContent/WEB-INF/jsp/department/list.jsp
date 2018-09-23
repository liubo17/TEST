<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<title>部门管理</title>
<link href="resource/admin/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="#">部门管理列表</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">


			<ul class="toolbar1">
				<li id="add"><span><img src="resource/admin/images/t01.png" /></span>新增部门</li>
			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th width="80">编号</th>
					<th width="80">部门名称</th>
					<th width="50">状态</th>
					<th width="60">部门职能</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.departmentList }" var="department"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td><c:out value="${department.dept_name }"></c:out></td>
						<td><c:if test="${department.is_delete==1 }" var="flag">
								<span style="color: green; font-weight: bold;">可用</span>
							</c:if> <c:if test="${!flag }">
								<span style="color: #CCCCCC">删除</span>
							</c:if></td>
						<td><c:out value="${department.remark }"></c:out></td>
						<td><a href="javascript:;" class="tablelink" onclick="update('${department.dept_id}')">更新</a>
							&nbsp;|&nbsp; 
							<a href="javascript:;" class="tablelink" onclick="doDelete('${department.dept_id}')">
							<c:if test="${department.is_delete==1 }">
							删除
							</c:if>
							<c:if test="${!flag }">
                                                                           还原
                            </c:if>
							
							</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>




	</div>

	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script src="resource/admin/plugin/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
            $(function(){
            	$("#add").click(function(){
            		   //iframe层-父子操作
                    parent.layer.open({
                        type: 2,
                        title:"部门管理  | 新增",
                        area: ['700px', '530px'],
                        fixed: false, //不固定
                        //maxmin: true,
                        content: 'sys/department/add'
                            
                    });
            	});
            });
            function update(dept_id){
            	//使用占位符传递数据
            	parent.layer.open({
                    type: 2,
                    title:"部门管理  | 编辑",
                    area: ['700px', '530px'],
                    fixed: false, //不固定
                    //maxmin: true,
                    content: 'sys/department/update/'+dept_id
                        
                });
            }
            function doDelete(dept_id){
            	if(window.confirm("你确定执行该操作吗")){
            		$.post("sys/department/delete",{dept_id:dept_id,_method:"delete"},function(data){
            			if(data.flag=="success"){
            				//刷新
            				window.location.reload();
            				return ;
            			}else{
            				alert(data.message);
            				return ;
            			}
            		});
            	}
            	
            }
        </script>

</body>

</html>