<%@page import="com.gz.kl.user.PasswordErrorException"%>
<%@page import="com.gz.kl.user.UserNotFoundException"%>
<%@page import="com.gz.kl.user.*"%>
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
<body>
<BODY style="text-align: center;">
<FORM id="form1"  method="post" 
name="form1" action="logincheck.jsp">
<INPUT id="__LASTFOCUS" name="login" type="hidden" value="login_ok">
<SCRIPT type="text/javascript">
//<![CDATA[
var theForm = document.forms['form1'];
if (!theForm) {
    theForm = document.form1;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</SCRIPT>

<SCRIPT type="text/javascript" src="login_files/WebResource.js"></SCRIPT>

<SCRIPT type="text/javascript" src="login_files/WebResource(1).js"></SCRIPT>

<SCRIPT type="text/javascript" src="login_files/WebResource(2).js"></SCRIPT>

<SCRIPT type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {
if (typeof(ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) return false;
return true;
}
//]]>
</SCRIPT>
<DIV style="margin-top: 10px;" id="remarks"></DIV>
<DIV style="border-width: 1px; border-color: rgb(51, 153, 204) rgb(51, 153, 204) rgb(204, 204, 204); width: 520px; height: 170px; margin-top: 200px; margin-right: auto; margin-left: auto; border-bottom-style: double;" 
id="all">
<TABLE>
  <TBODY>
  <TR>
    <TD style="height: 100px;" vAlign="top"><IMG style="border-width: 0px;" 
      id="syslogo" src="login_files/gz001.png"></TD>
    <TD style="width: 300px;" rowSpan="2">
      <DIV style="width: 300px; border-left-color: rgb(204, 255, 153); border-left-width: 1px; border-left-style: outset;" 
      id="logindiv">
      <TABLE style="width: 100%; height: 150px;">
        <TBODY>
        <TR>
          <TD colSpan="2" align="left">
            <DIV style="width: 100%; border-bottom-color: rgb(153, 204, 51); border-bottom-width: 1px; border-bottom-style: dashed;"><IMG 
            alt="登录图片" src="login_files/login.gif"></DIV></TD></TR> 
        <TR>
          <TD style="width: 100px;" align="right">用户名：                </TD>
          <TD style="width: 300px;" align="left"><INPUT style="width: 110px;" 
            id="txtstaff_id" name="username" type="text"><SPAN style="width: 100px; color: red; display: inline-block; visibility: hidden;" 
            id="RequiredFieldValidator1">请输入用户名！</SPAN></TD></TR>
        <TR>
          <TD style="width: 100px;" align="right">密码：                 </TD>
          <TD style="width: 300px;" align="left"><INPUT style="width: 110px;" 
            id="txtstaffpass" name="password" type="password"><SPAN style="width: 100px; color: red; display: inline-block; visibility: hidden;" 
            id="RequiredFieldValidator2">请输入密码！</SPAN></TD></TR>
        <TR>
          <TD style="height: 34px;" colSpan="2" align="center"><INPUT style="border-width: 0px;" 
            id="ImageButton1" onclick='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ImageButton1", "", true, "", "", false, false))' 
            name="ImageButton1" src="login_files/login_btn.gif" 
        type="image"></TD></TR></TBODY></TABLE></DIV></TD></TR>
  <TR>
    <TD style="height: 26px;" vAlign="top" align="left">                
    &nbsp;</TD></TR>
  <TR>
    <TD style="height: 21px;" colSpan="2" align="left">
      <DIV style="border-top-color: rgb(102, 153, 204); border-top-width: 1px; border-top-style: outset;" 
      id="sm"><BR> <BR> <BR> 
      <BR></DIV>建议:使用IE浏览器,1024×768以上分辨率,加入信任站点方便下载数据&nbsp;          &nbsp; 
      &nbsp; &nbsp;&nbsp;          </TD></TR>
  <TR>
    <TD style="height: 20px;" colSpan="2" align="left">Copyright ©2014-2015 
      如需帮助请发“易问”</TD></TR></TBODY></TABLE></DIV>
<SCRIPT type="text/javascript">
//<![CDATA[
var Page_Validators =  new Array(document.getElementById("RequiredFieldValidator1"), document.getElementById("RequiredFieldValidator2"));
//]]>
</SCRIPT>

<SCRIPT type="text/javascript">
//<![CDATA[
var RequiredFieldValidator1 = document.all ? document.all["RequiredFieldValidator1"] : document.getElementById("RequiredFieldValidator1");
RequiredFieldValidator1.controltovalidate = "txtstaff_id";
RequiredFieldValidator1.errormessage = "请输入手机！";
RequiredFieldValidator1.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator1.initialvalue = "";
var RequiredFieldValidator2 = document.all ? document.all["RequiredFieldValidator2"] : document.getElementById("RequiredFieldValidator2");
RequiredFieldValidator2.controltovalidate = "txtstaffpass";
RequiredFieldValidator2.errormessage = "请输入密码！";
RequiredFieldValidator2.evaluationfunction = "RequiredFieldValidatorEvaluateIsValid";
RequiredFieldValidator2.initialvalue = "";
//]]>
</SCRIPT>

<SCRIPT type="text/javascript">
//<![CDATA[

var Page_ValidationActive = false;
if (typeof(ValidatorOnLoad) == "function") {
    ValidatorOnLoad();
}

function ValidatorOnSubmit() {
    if (Page_ValidationActive) {
        return ValidatorCommonOnSubmit();
    }
    else {
        return true;
    }
}
        WebForm_AutoFocus('txtstaff_id');//]]>
</SCRIPT>
</FORM>
</body>
</html>