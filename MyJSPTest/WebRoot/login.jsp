<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function() {
		//用户名和密码简单验证
		$("#btncon").click(function() {
			if ($(":text").val().trim() == "") {
				$("#span-txt").text("用户名不能为空!").css("color", "red");
			} else if ($(":password").val().trim() == "") {
				$("#span-pwd").text("密码不能为空!").css("color", "red");
			} else {
				$("form").submit();
			}
		});
		//用户框和密码框获得焦点时,提示信息消失
		$(":text").focus(function() {
			$("#span-txt").text("");
		})
		$(":password").focus(function() {
			$("#span-pwd").text("");
		})
		//选择取消按钮,清除form所有表单信息
		$("#btncan").click(function() {
			$("form").get(0).reset();
		})
	})
</script>

<style type="text/css">
	tr {
		height: 40px;
		text-align: center;
	}
</style>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>用户登录</title>
</head>
<body>
		<!-- 创建一个宽度为500px，距离顶上为100px且居中的容器 -->
		<div id="" style="margin: auto;width: 500px;margin-top: 100px;">
			<!-- 创建登录面板 -->
			<div id="" class="easyui-panel" data-options="iconCls:'icon-mycomputer',title:'登录'" style="width: 500px;height: 300px;">
				<form action="mainframe.jsp" method="get">
					<table style="margin-top: 20px;margin-left: 120px;">
						<tr>
							<!-- colspan设置为2 以便于显示用户名和密码信息提示时不顶开前面的td -->
							<td colspan="2"><span style="font-size: large;color: #6B9CDE;" ;>XXX用户登录系统</span></td>
						</tr>
						<tr>
							<td>用户名:</td>
							<td>
								<input type="text" name="" id="" value="" />
							</td>
							<td><span id="span-txt"></span></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;&nbsp;码:</td>
							<td><input type="password" name="" id="" value="" /></td>
							<td><span id="span-pwd"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<a id="btncon" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'user-login-check'">登录</a>&nbsp;&nbsp;&nbsp;
								<a id="btncan" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
							</td>
						</tr>
					</table>
				</form>
				<div id="" style="margin-top: 30px;margin-left: 300px;">
					<span style="font-size: medium;">中国电信黔东南分公司</span>
				</div>
			</div>
		</div>
	</body>
</html>