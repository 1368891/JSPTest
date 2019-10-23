<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
HttpSession ss = null;
Cookie cookies[] = request.getCookies();
if(cookies != null) {
	for(int i = 0; i < cookies.length; i++) {
		out.println("cookie name:" + cookies[i].getName() + " | cookie value:" + cookies[i].getValue());
	}
	ss = request.getSession(true);
	ss.setAttribute("JSESSIONID", request.getAttribute("JSESSIONID"));
	Enumeration<String> enu = ss.getAttributeNames();
}

if(ss != null) {
	System.out.println("session:" + ss.getAttribute("JSESSIONID"));
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>