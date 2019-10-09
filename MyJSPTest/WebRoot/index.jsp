<%@page import="com.gz.kl.user.*"%>
<%@page import="com.gz.kl.util.DBMgr"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.Cookie"%>

<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	int pageSize = 0;
	User currentUser = (User)request.getSession().getAttribute("user");
	if(currentUser == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	
	if(request.getParameter("pageSize") != null) {
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
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
			<th>操作</th>
		</tr>
    <%
    	int length = UserMgr.getInstance().getTableLength();
    	int pangeNum = 2;
    	List<User> listUsers = UserMgr.getInstance().getUsers(pageSize*2, pangeNum);
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
    		<td><a href="user/modifyuser.jsp?currentuserid=<%=user.getUserId()%>">改</a>&nbsp<a>删除</a></td>
    	</tr>
    <%  		
    	}
     %>
    </table>
    <div style="margin-left: 63%; "><a href="user/adduser.jsp" target="blank">增加用户</a></div><br>
    <%
    	int forward = pageSize;
    	int backward = pageSize;
     %>
    <b>第<%= pageSize + 1 %>页</b>&nbsp&nbsp
    <a href="index.jsp?pageSize=<%= backward <= 0? 0 : --backward%>"><%= pageSize == 0 ? "首页":"上一页" %></a>&nbsp&nbsp
    <a href="index.jsp?pageSize=<%= forward >= length/pangeNum-1? length/pangeNum-1 : ++forward%>"><%= pageSize == length/pangeNum-1 ? "末页":"下一页" %></a>
  </body>
</html>
