<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@page import="com.gz.kl.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("gbk");
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
	if(request.getParameter("validate") != null && request.getParameter("validate").equals("pass")) {
		if(userName == null || userName.trim().equals("")) {
			out.println("�û�������Ϊ�գ�");
			return;
		}
		if(password1.trim().equals("") || password2.trim().equals("")) {
			out.println("���벻��Ϊ�գ�");
			return;
		}
		if(!UserMgr.getInstance().useExitCheck(userName)) {
			if(password1.equals(password2)) {
				UserMgr.getInstance().addUser(userName,password1,request.getParameter("phone"), request.getParameter("address"));
			} else if(!password1.equals(password2)) {
				out.println("���벻һ�£��������޸ġ�");
				return;
			}
		} else {
			out.println("�Ѿ����ڸ��û�����");
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
<form action="adduser.jsp" method="post">
	<input type="hidden" name="validate" value="pass">
	�û���<input type="text" name="userName"><br>
	����<input type="password" name="password1"><br>
	����ȷ��<input type="password" name="password2"><br>
	�绰����<input type="text" name="phone"><br>
	��ַ<input type="text" name="address"><br>
	<input type="submit" value="�ύ">
</form>
</body>
</html>