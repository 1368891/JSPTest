<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String login = request.getParameter("login");
User user = null;
if(username == null || password == null) {
	response.sendRedirect("login.jsp");
	return;
}
if(login == null || !login.equals("login_ok")) {
	response.sendRedirect("login.jsp");
	return;
}
try {
	user = UserMgr.getInstance().useVerification(username, password);
} catch (UserNotFoundException e) {
	out.println(e.getMessage());
	return;
} catch (PasswordErrorException e) {
	out.println(e.getMessage());
	return;
}

session.setAttribute("user", user);
response.sendRedirect("index.jsp");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>

</body>
</html>