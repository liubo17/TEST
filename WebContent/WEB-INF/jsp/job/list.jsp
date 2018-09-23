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
<title>职位管理</title>
<link href="resource/admin/css/style.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:;">首页</a></li>
			<li><a href="#">职位管理列表</a></li>
		</ul>
	</div>

	<div class="rightinfo">
	<!-- 查询条件开始 -->
        <form action="sys/job/find" method="get" id="searchForm">
            <ul class="seachform1">
                <li><label>职位</label>
                 <input name="query['jobName']"
                    type="text" class="scinput1" onclick="WdatePicker()" value="${pager.query.startDate }" />
                </li>
                <li><input type="button" class="scbtn" id="searchBtn"
                    value="查询"></li>
            </ul>
            <!-- 隐藏域信息 -->
            <input type="hidden" name="pageNow" id="pageNow"
                value="${pager.pageNow }"> 
            <input type="hidden"
                id="totalPages" value="${pager.totalpages }">
        </form>
        <!-- 查询条件结束 -->

		<div class="tools">


			<ul class="toolbar1">
				<li id="add"><span><img src="resource/admin/images/t01.png" /></span>新增职位</li>
			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th width="80">编号</th>
					<th width="80">职位名称</th>
					<th width="60">工作职能</th>
					<th width="40">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.jobList }" var="job"
					varStatus="vs">
					<tr>
						<td>${vs.count }</td>
						<td><c:out value="${job.job_name }"></c:out></td>
						<td><c:out value="${job.remark }"></c:out></td>
						<td><a href="javascript:;" class="tablelink" onclick="update('${job.job_id}')">更新</a>
							&nbsp;|&nbsp; <a href="javascript:;" class="tablelink">删除</a></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script src="plugin/layer/layer.js" type="text/javascript"></script>
	<script type="text/javascript">
            $(function(){
            	$("#add").click(function(){
            		   //iframe层-父子操作
                    parent.layer.open({
                        type: 2,
                        title:"职位管理  | 新增",
                        area: ['700px', '530px'],
                        fixed: false, //不固定
                        //maxmin: true,
                        content: 'sys/job/add'
                            
                    });
            	});
            });
            function update(job_id){
                //iframe层-父子操作
                //使用占位符传递数据
                parent.layer.open({
                    type : 2,
                    title:"职能管理 | 更新",
                    area : [ '700px', '530px' ],
                    fixed : false, //不固定
                    //maxmin: true,
                    content : 'sys/job/update/'+job_id
                });
            }
        </script>

</body>

</html>