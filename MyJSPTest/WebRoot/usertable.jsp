<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<%@page import="com.gz.kl.util.DBMgr"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="themes/icon.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	int pageSize = 0;
System.out.println(request.getParameter("page"));
System.out.println(request.getParameter("rows"));
%>

<html>
	
	<head>
		<meta charset="utf-8">
		<title></title>
	</head>
	<body>
		<!-- pagination为true时将在数据网格（datagrid）的底部生成一个分页（pagination）工具栏。 -->
		<table class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" width="1210px">
			<thead>
				<tr>
					<th data-options = "field:'userid'" style="width: 10%;">编号</th>
					<th data-options = "field:'username'" style="width: 15%;">姓名</th>
					<th data-options = "field:'phone'" style="width: 15%;">电话</th>
					<th data-options = "field:'address'" style="width: 25%;">地址</th>
					<th data-options = "field:'regist'" style="width: 25%;">注册时间</th>
					<th data-options = "field:'grade'" style="width: 10%;">等级</th>
				</tr>
			</thead>
 <%
    	int length = UserMgr.getInstance().getTableLength();
    	int maxPageSize = (length%2 == 0) ? length/2 : length/2 + 1;
    	int pangeNum = 4;
    	List<User> listUsers = UserMgr.getInstance().getUsers(pageSize*2, pangeNum);
    	Iterator<User> it = listUsers.iterator();
    	while(it.hasNext()) {
    		User user = (User)it.next();
%>
			<tbody>
			<tr>
			<td><%=user.getUserId() %></td>
    		<td><%=user.getUserName() %></td>
    		<td><%=user.getPhone() %></td>
    		<td><%=user.getAddress() %></td>
    		<td><%=user.getRegistTime() %></td>
    		<td><%=user.getGrade() %></td>
    		<td><a href="user/modifyuser.jsp?currentuserid=<%=user.getUserId()%>">改</a>&nbsp
    			<a href="user/deleteuser.jsp?currentuserid=<%=user.getUserId()%>">删除</a></td>
    		</tr>
			</tbody>
		<%  		
    	}
     	%>	
		</table>
	</body>
</html>
