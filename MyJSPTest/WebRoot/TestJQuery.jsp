<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("gbk");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<script src="js/jquery-3.4.1.js" charset="GB18030">
</script>
<script charset="GB18030">
	$(document).ready(function(){
		$("#test").click(function(){
			$("#test").html("<b>修改</b>");
			$("#test").css("background-color","orange");
		});
		$("#hide").click(function(){
			$("p").toggle("slow");
		});
		$("#fade").click(function(){
			$("#divfade").fadeToggle("slow");
		});
		$("#slide").click(function(){
			$("#divslide").slideToggle();
		});
		//Callback + chaining
		$("#animate").click(function(){
			$("#divanimate").animate({left:'250px'},"slow",function(){
				alert("move!");
			}).animate({fontSize:'2em'},"slow");
		});
		$("#css").click(function(){
			$("#divcss").css({"background-color":"orange", "font-size":"large"});
		});
		$("#parent").click(function(){
			$("#bchild").parent().css({"background-color":"red", "font-size":"large"});
		});
		$("#ajax").click(function(){
			$("#divajax").load("ajaxdemo.txt");
		});
	});
</script>
<style type="text/css">
.blue
{
	background-color:orange;
	color: blue;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<p>test</p>
	<div id="test" style="background-color: red;width: 100px;" class="test1">this is <b>div</b>.</div>
	<p>hide and show demo.</p>
	<button id="hide">hide and show</button><br>
	<p>fade demo.</p>
	<button id="fade">fadeToggle</button>
	<div id="divfade" style="width: 180px;height: 50px;background-color: red;font-size: large;">fadeTest</div>
	<p>slide demo.</p>
	<button id="slide">slideToggle</button>
	<div id="divslide" style="width: 180px;height: 50px;background-color: green;font-size: large;">slideTest</div>
	<p>animate demo.</p>
	<button id="animate">animate</button>
	<div id="divanimate" style="width: 180px;height: 50px;background-color: pink;font-size: large;position: absolute;">animateTest</div>
	<p>css() demo.</p>
	<button id="css">css</button>
	<div id="divcss" style="width: 180px;height: 50px;background-color: pink;font-size: small;position: absolute;">cssTest</div>
	<p>遍历 demo.</p>
	<button id="parent">parent</button>
	<div id="divparent" style="width: 180px;height: 50px;background-color: pink;font-size: small;position: absolute;">
		div area.
		<b id="bchild">b area.</b>
	</div>
	<p>AJAX demo.</p>
	<button id="ajax">ajax</button>
	<div id="divajax" style="width: 300px;height: 50px;background-color: pink;font-size: small;position: absolute;">
		<h2>使用 jQuery AJAX 修改文本内容</h2>
	</div>
</body>
</html>