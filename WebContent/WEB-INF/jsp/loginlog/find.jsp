<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
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
<title>简单表格</title>
<link href="resource/admin/css/style.css" rel="stylesheet"
	type="text/css" />


</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="index.html">首页</a></li>
			<li><a href="#">简单表格</a></li>
		</ul>
	</div>

	<div class="rightinfo">
		<!-- 查询条件开始 -->
		<form action="sys/loginlog/find" method="get" id="searchForm">
			<ul class="seachform1">
				<li><label>开始日期</label> <input name="query['startDate']"
					type="text" class="scinput1"
					onclick="WdatePicker({readOnly:true,dateFmt:yyyy-MM-dd HH:mm:ss})"
					value="${pager.query.startDate }" /></li>
				<li><label>结束日期</label> <input name="query['endDate']"
					type="text" class="scinput1"
					onclick="WdatePicker({readOnly:true,dateFmt:yyyy-MM-dd HH:mm:ss})"
					value="${pager.query.endDate }" /></li>
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

			<ul class="toolbar">
				<li class="click"><span><img
						src="resource/admin/images/t01.png" /></span>添加</li>
				<li class="click"><span><img
						src="resource/admin/images/t02.png" /></span>修改</li>
				<li><span><img src="resource/admin/images/t03.png" /></span>删除</li>
				<li><span><img src="resource/admin/images/t04.png" /></span>统计</li>
			</ul>


			<ul class="toolbar1">
				<li><span><img src="resource/admin/images/t05.png" /></span>设置</li>
			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th width="30">&nbsp;</th>
					<th width="50">序号</th>
					<th>用户姓名</th>
					<th>账号</th>
					<th>登录时间</th>
					<th>IP地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.pager.datas }" var="loginLog"
					varStatus="vs">

					<tr>
						<td><input type="checkbox" name="log_id"
							value="${loginLog.id }"></td>
						<td>${vs.count }</td>
						<td>${loginLog.user.user_name }</td>
						<td>${loginLog.user.account }</td>
						<td><fmt:formatDate value="${loginLog.login_time }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${loginLog.ip }</td>
						<td><a href="javascript:;" class="tablelink"
							log_id="${loginLog.id }">彻底删除</a></td>
					</tr>


				</c:forEach>

			</tbody>
		</table>


		<div class="pagin">
			<div class="message">
				共<i class="blue">${pager.totalCount }</i>条记录，当前显示第&nbsp;<i
					class="blue">${pager.pageNow }&nbsp;/&nbsp;${pager.totalpages }</i>页
			</div>
			
			<ul class="paginList">
				<li class="paginItem"><a href="javascript:;" id="start">首页</a></li>
				<li class="paginItem"><a href="javascript:;" id="pre">上一页</a></li>
				<li class="paginItem"><a href="javascript:;" id="next">下一页</a></li>
				<li class="paginItem"><a href="javascript:;" id="end">尾页</a></li>
			</ul>
		</div>

	</div>
	<%-- <form action="sys/loginlog/find" method="get" id="searchForm">
            <input type="hidden" name="pageNow" id="pageNow" value="${pager.pageNow }">
            <input type="hidden" id="totalpages" value="${pager.totalpages }">
        </form> --%>

	<script type="text/javascript" src="resource/admin/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>resource/admin/My97DatePicker/WdatePicker.js"></script>
	<!--分页操作  -->
	<script type="text/javascript">
         $(function(){
        	 $("#start").click(function(){
        		 $("#pageNow").val(1);
                 $("#searchForm").submit();
        	 });
        	 $("#pre").on("click",function(){
        		 var pageNow = $("#pageNow").val();
        		 if(pageNow ==1){
        			 alert("没有上一页了");
        			 return false;
        		 }
        		 $("#pageNow").val(pageNow - 1);
        		 $("#searchForm").submit();
        	 });
        	 
        	 $("#next").on("click",function(){
                 var pageNow=$("#pageNow").val();
                 var totalpages = $("#totalPages").val();
                 if(pageNow ==totalpages){
                     alert("没有下一页了");
                     return false;
                 }
                 $("#pageNow").val(parseInt(pageNow) + 1);
                 $("#searchForm").submit();
             });
        	 
        	 
        	  $("#end").click(function(){
                 var totalpages = $("#totalPages").val();
                 $("#pageNow").val(totalpages);
                 $("#searchForm").submit();
                 
             });
        	  $("#searchBtn").click(function(){
                  $("#pageNow").val(1);
                  $("#searchForm").submit();
              });
         });
        </script>


	<script type="text/javascript">
        $(function(){
        	$(".tablelink").on("click",function(){
        		var id = $(this).attr("log_id");
        		if(window.confim("您确定要删除该条记录吗？")){
        			$.post("sys/loginlog/delete",{id:id,_method:"delete",function(data){
        			}
        			});
        			
        	}
         });
        });
     </script>

</body>

</html>