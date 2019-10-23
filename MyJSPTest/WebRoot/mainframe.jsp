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
		<!-- ���� �� -->
		<div data-options="region:'north'" style="height: 40px;">
			<span style="margin-left: 20px;">
				<img src="themes/bootstrap/images/datebox_arrow.png" width="30px" style="margin-top: 3px;">
				<font size="4px" color="#0000FF">XXXϵͳ</font>
			</span>
			<span style="float: right;margin-top: 7px;margin-right: 15px;">
				��ӭ<span style="color: red;">admin</span>��¼ &nbsp;&nbsp;
				<a href="javascript:void(0)">�޸�����</a>&nbsp;
				<a href="javascript:void(0)">�˳�</a>
			</span>
		</div>
		<!-- ���� �� -->
		<div data-options="region:'south',title:'�汾��Ϣ',collapsible:false" style="height:100px;">
			&copy;2008-2019 ������վ����ð�ؾ�
		</div>
		<!-- ���� �� -->
		<div data-options="region:'west',title:'ϵͳ�˵�',split:true,border:false" style="width:200px;">
			<div id="aa" class="easyui-accordion" data-options="fit:true">
				<div title="������վ">
					<ul class="easyui-tree">
						<li>
							<span>�û�����</span>
							<ul>
								<li><a id="span-user-query" href="javascript:void(0)">�û���ѯ</a></li>
							</ul>
						</li>
						<li>
							<span>��Ʒ����</span>
							<ul>
								<li><a id="" href="javascript:void(0)">��Ʒ��ѯ</a></li>
							</ul>
						</li>
						<li>
							<span>��������</span>
							<ul>
								<li><a id="" href="javascript:void(0)">������ѯ</a></li>
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
		<!-- ���� �� -->
		<div id="tt" class="easyui-tabs" data-options="region:'center',title:'��ҳ',fit:true" style="padding:5px;background:#eee;">
			<div title="��ҳ" style="padding:20px;display:none;background-image: url(img/16pic_1492891_b.jpg);">
				tab1
			</div>
		</div>
	</body>
</html>