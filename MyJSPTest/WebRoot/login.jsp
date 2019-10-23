<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function() {
		//�û������������֤
		$("#btncon").click(function() {
			if ($(":text").val().trim() == "") {
				$("#span-txt").text("�û�������Ϊ��!").css("color", "red");
			} else if ($(":password").val().trim() == "") {
				$("#span-pwd").text("���벻��Ϊ��!").css("color", "red");
			} else {
				$("form").submit();
			}
		});
		//�û����������ý���ʱ,��ʾ��Ϣ��ʧ
		$(":text").focus(function() {
			$("#span-txt").text("");
		})
		$(":password").focus(function() {
			$("#span-pwd").text("");
		})
		//ѡ��ȡ����ť,���form���б���Ϣ
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
<title>�û���¼</title>
</head>
<body>
		<!-- ����һ�����Ϊ500px�����붥��Ϊ100px�Ҿ��е����� -->
		<div id="" style="margin: auto;width: 500px;margin-top: 100px;">
			<!-- ������¼��� -->
			<div id="" class="easyui-panel" data-options="iconCls:'icon-mycomputer',title:'��¼'" style="width: 500px;height: 300px;">
				<form action="mainframe.jsp" method="get">
					<table style="margin-top: 20px;margin-left: 120px;">
						<tr>
							<!-- colspan����Ϊ2 �Ա�����ʾ�û�����������Ϣ��ʾʱ������ǰ���td -->
							<td colspan="2"><span style="font-size: large;color: #6B9CDE;" ;>XXX�û���¼ϵͳ</span></td>
						</tr>
						<tr>
							<td>�û���:</td>
							<td>
								<input type="text" name="" id="" value="" />
							</td>
							<td><span id="span-txt"></span></td>
						</tr>
						<tr>
							<td>��&nbsp;&nbsp;&nbsp;��:</td>
							<td><input type="password" name="" id="" value="" /></td>
							<td><span id="span-pwd"></span></td>
						</tr>
						<tr>
							<td colspan="2">
								<a id="btncon" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'user-login-check'">��¼</a>&nbsp;&nbsp;&nbsp;
								<a id="btncan" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">ȡ��</a>
							</td>
						</tr>
					</table>
				</form>
				<div id="" style="margin-top: 30px;margin-left: 300px;">
					<span style="font-size: medium;">�й�����ǭ���Ϸֹ�˾</span>
				</div>
			</div>
		</div>
	</body>
</html>