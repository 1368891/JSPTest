<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<script type="text/javascript">
	$(function() {
		$("#span-user-query").click(function() {
			$('#tt').tabs(
				'add', {
					title: $("#span-user-query").text(),
					content: '<iframe src="usertable.jsp" width=100% height=100% frameborder="0"></iframe>',
					cache: true,
					closable: true,
				}
			);
		})
	})
</script>

<html>
	<head>
		<meta charset="GB18030">
		<title></title>
	</head>
	<body class="easyui-layout">
		<!-- 布局 北 -->
		<div data-options="region:'north'" style="height: 40px;">
			<span style="margin-left: 20px;">
				<img src="themes/bootstrap/images/datebox_arrow.png" width="30px" style="margin-top: 3px;">
				<font size="4px" color="#0000FF">XXX系统</font>
			</span>
			<span style="float: right;margin-top: 7px;margin-right: 15px;">
				欢迎<span style="color: red;">admin</span>登录 &nbsp;&nbsp;
				<a href="javascript:void(0)">修改密码</a>&nbsp;
				<a href="javascript:void(0)">退出</a>
			</span>
		</div>
		<!-- 布局 南 -->
		<div data-options="region:'south',title:'版本信息',collapsible:false" style="height:100px;">
			&copy;2008-2019 个人网站，仿冒必究
		</div>
		<!-- 布局 西 -->
		<div data-options="region:'west',title:'系统菜单',split:true,border:false" style="width:200px;">
			<div id="aa" class="easyui-accordion" data-options="fit:true">
				<div title="常用网站">
					<ul class="easyui-tree">
						<li>
							<span>用户管理</span>
							<ul>
								<li><a id="span-user-query" href="javascript:void(0)">用户查询</a></li>
							</ul>
						</li>
						<li>
							<span>产品管理</span>
							<ul>
								<li><a id="" href="javascript:void(0)">产品查询</a></li>
							</ul>
						</li>
						<li>
							<span>订单管理</span>
							<ul>
								<li><a id="" href="javascript:void(0)">订单查询</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div title="Title2">
					content2
				</div>
				<div title="Title3">
					content3
				</div>
			</div>
		</div>
		<!-- 布局 中 -->
		<div id="tt" class="easyui-tabs" data-options="region:'center',title:'主页',fit:true" style="padding:5px;background:#eee;">
			<div title="主页" style="padding:20px;display:none;background-image: url(img/16pic_1492891_b.jpg);">
				tab1
			</div>
		</div>
	</body>
</html>