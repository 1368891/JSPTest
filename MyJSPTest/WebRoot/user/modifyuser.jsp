<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%!
	int userId = 0;
%>

<%
	User currentUser = (User)request.getSession().getAttribute("user");
	if(currentUser == null) {
		response.sendRedirect("../login.jsp");
		return;
	}
	
	request.setCharacterEncoding("gbk");
	String userName = request.getParameter("userName");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String validate = request.getParameter("validate");
	if(request.getParameter("userId") == null) {
		userId = 0;
	} else {
		userId = Integer.valueOf(request.getParameter("userId"));
	}
	
	if(userName != null && phone != null && address != null && validate != null  && validate.equals("pass")) {
		if(userId != 0) {
			UserMgr.getInstance().modifyUser(userName, phone, address, userId);
			out.println("更新成功！");
			return;
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<%
	if(request.getParameter("currentuserid") == null) {
		response.sendRedirect("../index.jsp");
		return;
	}
	userId = Integer.valueOf(request.getParameter("currentuserid"));
	User user = UserMgr.getInstance().getUser(userId);
%>
<form action="modifyuser.jsp" method="post">
	<input type="hidden" name="validate" value="pass">
	<input type="hidden" name="userId" value="<%=userId %>">
	用户名<input type="text" name="userName" readonly="readonly" value="<%=user.getUserName() %>"><br>
	电话号码<input type="text" name="phone" value="<%=user.getPhone() %>"><br>
	地址<input type="text" name="address" value="<%=user.getAddress() %>"><br>
	<input type="submit" value="提交">
</form>
</body>
</html>