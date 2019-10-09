<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	User currentUser = (User)request.getSession().getAttribute("user");
	if(currentUser == null) {
		response.sendRedirect("../login.jsp");
		return;
	}
%>

<%
	String userName = request.getParameter("userName");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<form action="adduser.jsp" method="post">
	<input type="hidden" name="validate" value="pass">
	用户名<input type="text" name="userName"><br>
	密码<input type="password" name="password1"><br>
	密码确认<input type="password" name="password2"><br>
	电话号码<input type="text" name="phone"><br>
	地址<input type="text" name="address"><br>
	<input type="submit" value="提交">
</form>
</body>
</html>