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
	
	int currentuserid = Integer.valueOf(request.getParameter("currentuserid"));
	UserMgr.getInstance().deleteUser(currentuserid);
	out.println("已删除！");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
&nbsp <a href="../index.jsp">返回主页</a>
</body>
</html>