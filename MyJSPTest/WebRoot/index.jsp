<%@page import="com.gz.kl.user.UserMgr"%>
<%@page import="com.gz.kl.user.User"%>
<%@page import="com.gz.kl.util.DBMgr"%>
<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String login = request.getParameter("login");
	System.out.println(username + password + login);
	if(login == null || username == null || password == null) {
		response.sendRedirect("login.htm");
		return;
	}
	if(!login.equals("login_ok")) {
		response.sendRedirect("login.htm");
		return;
	}
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body >
  <p align="center">用户列表</p>
    <table align="center" border="1" cellpadding="10">
		<tr>
			<th>用户名</th>
			<th>电话</th>
			<th>地址</th>
			<th>注册时间</th>
			<th>等级</th>
		</tr>
    <%
    	List<User> listUsers = UserMgr.getInstance().getUsers();
    	Iterator<User> it = listUsers.iterator();
    	while(it.hasNext()) {
    		User user = (User)it.next();
	%>
    	<tr>
    		<td><%=user.getUserName() %></td>
    		<td><%=user.getPhone() %></td>
    		<td><%=user.getAddress() %></td>
    		<td><%=user.getRegistTime() %></td>
    		<td><%=user.getGrade() %></td>
    	</tr>
    <%  		
    	}
     %>
    </table>	
  </body>
</html>
