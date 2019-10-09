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
  <p align="center">�û��б�</p>
    <table align="center" border="1" cellpadding="10">
		<tr>
			<th>�û���</th>
			<th>�绰</th>
			<th>��ַ</th>
			<th>ע��ʱ��</th>
			<th>�ȼ�</th>
			<th>����</th>
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
    		<td><a href="user/modifyuser.jsp?currentuserid=<%=user.getUserId()%>">��</a>&nbsp<a>ɾ��</a></td>
    	</tr>
    <%  		
    	}
     %>
    </table>
    <div style="margin-left: 63%; "><a href="user/adduser.jsp" target="blank">�����û�</a></div><br>
    <%
    	int forward = pageSize;
    	int backward = pageSize;
     %>
    <b>��<%= pageSize + 1 %>ҳ</b>&nbsp&nbsp
    <a href="index.jsp?pageSize=<%= backward <= 0? 0 : --backward%>"><%= pageSize == 0 ? "��ҳ":"��һҳ" %></a>&nbsp&nbsp
    <a href="index.jsp?pageSize=<%= forward >= length/pangeNum-1? length/pangeNum-1 : ++forward%>"><%= pageSize == length/pangeNum-1 ? "ĩҳ":"��һҳ" %></a>
  </body>
</html>
