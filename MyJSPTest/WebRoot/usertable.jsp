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
		<!-- paginationΪtrueʱ������������datagrid���ĵײ�����һ����ҳ��pagination���������� -->
		<table class="easyui-datagrid" fitColumns="true" pagination="true" rownumbers="true" width="1210px">
			<thead>
				<tr>
					<th data-options = "field:'userid'" style="width: 10%;">���</th>
					<th data-options = "field:'username'" style="width: 15%;">����</th>
					<th data-options = "field:'phone'" style="width: 15%;">�绰</th>
					<th data-options = "field:'address'" style="width: 25%;">��ַ</th>
					<th data-options = "field:'regist'" style="width: 25%;">ע��ʱ��</th>
					<th data-options = "field:'grade'" style="width: 10%;">�ȼ�</th>
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
    		<td><a href="user/modifyuser.jsp?currentuserid=<%=user.getUserId()%>">��</a>&nbsp
    			<a href="user/deleteuser.jsp?currentuserid=<%=user.getUserId()%>">ɾ��</a></td>
    		</tr>
			</tbody>
		<%  		
    	}
     	%>	
		</table>
	</body>
</html>
