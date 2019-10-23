<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.4.1.js">
</script>

<script type="text/javascript">
	$(function(){
		$("#one").show(2000);
		$("#tow").hide(2000);
		$("#three").toggle(2000);
		$("#four").slideDown(2000);
		$("#five").slideUp(2000);
		$("#six").slideToggle(2000);
		$("button").click(function(){
			$("#sl").prop("disabled","disabled");
		});
	});
</script>
<body>
	<p id="one">第1段p</p>
	<p id="tow">第2段p</p>
	<p id="three">第3段p</p>
	<p id="four">第4段p</p>
	<p id="five">第5段p</p>
	<p id="six">第6段p</p>
	<button>click</button>
	<select id="sl">
		<option>1</option>
		<option selected="selected">2</option>
		<option>3</option>
	</select>
</body>
</html>