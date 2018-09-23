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
		<title>简单表格</title>
        <link href="resource/admin/css/style.css" rel="stylesheet" type="text/css"/>


    </head>


    <body>

        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="index.html">首页</a></li>
                <li><a href="#">系统用户管理</a></li>
            </ul>
        </div>

        <div class="rightinfo">

            <div class="tools">
                <ul class="toolbar1">
                    <li id="add"><span><img src="resource/admin/images/t01.png"/></span>新建用户</li>
                </ul>

            </div>


            <table class="tablelist">
                <thead>
                    <tr>
                        <th width="80">编号</th>
                        <th>账号 </th>
                        <th>姓名</th>
                        <th>角色</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody id="user-data">
                </tbody>
            </table>


            <div class="pagin" align="center">
                <button type="button" id="more"
                style="width: 100px;height: 35px;font-size: 20px;">加载更多</button>
            </div>
        </div>

        <script type="text/javascript" src="resource/admin/js/jquery.js"></script>
        <script type="text/javascript">
        //全局变量
        var pageNow = 1;
        
        $(function(){
        	//初始化
        	getUserData();
        	//绑定事件
        	$("#more").click(function(){
        		getUserData();
        	});
        });
        
        function getUserData(){
        	$.get("sys/user/find",{pageNow:pageNow},function(pager){
                if(pager!=null){
                    if(pager.datas!=null&&pager.datas.length>0){
                        var tr = "";
                        for(var i=0;i<pager.datas.length;i++){
                            //获取用户信息
                            var user = pager.datas[i];
                            
                            tr += "<tr>";
                                tr += "<td>"+((pager.pageNow-1)*pager.pageSize+i+1)+"</td>";
                                tr += "<td>"+user.account+"</td>";
                                tr += "<td>"+user.user_name+"</td>";
                                tr += "<td>"+user.role_name+"</td>";
                                
                                var status_name = user.status==1?"<span style='color:green'>可用</span>":"<span style='color:red'>注销</span>"; 
                                
                                tr += "<td>"+status_name+"</td>";
                                tr += '<td><a href="javascript:;" class="tablelink userUpdate" data-id="'+user.user_id+'">更新</a>';
                                tr += ' &nbsp;|&nbsp; <a href="javascript:;" class="tablelink userDelete" data-id="'+user.user_id+'">';
                                if(user.status==1){
                                	 tr += '删除';
                                }else{
                                	tr +='还原';
                                }
                                tr +='</a>';
                                tr += '</td>';
                            tr += "</tr>";
                            
                        }
                        //追加数据
                        //$("#user-data").append(tr);
                        $(tr).appendTo($("#user-data")).hide().fadeIn(1000);
                        if(pageNow==pager.totalpages){
                        	$("#more").hide();
                        	return;
                        }
                        pageNow = pageNow+1;
                    }
                }
            });
        }
        </script>
        <script type="text/javascript">
        $(function(){
        	$("#user-data").on("click",".userUpdate",function(){
        		//alert("update"+$(this).attr("data-id"))
        		//使用占位符传递数据
        		var user_id = $(this).attr("data-id");
                parent.layer.open({
                    type: 2,
                    title:"用户管理  | 编辑",
                    area: ['700px', '530px'],
                    fixed: false, //不固定
                    //maxmin: true,
                    content: 'sys/user/update/'+user_id
        	});
            });    
        	$("#user-data").on("click",".userDelete",function(){
        		//alert("delete"+$(this).attr("data-id"))
        		var user_id = $(this).attr("data-id");
        		if(window.confirm("你确定执行该操作吗")){
                    $.post("sys/user/delete",{user_id:user_id,_method:"delete"},function(data){
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
        	});
        });
        </script>
        <script type="text/javascript">
        $(function(){
        	$("#add").click(function(){
        		   //iframe层-父子操作
                parent.layer.open({
                    type: 2,
                    title:"系统用户管理  | 新建",
                    area: ['700px', '530px'],
                    fixed: false, //不固定
                    //maxmin: true,
                    content: 'sys/user/add'
                });
        	});
        });
        </script>
        
    </body>

</html>