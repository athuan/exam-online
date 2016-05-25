<%@page import="com.kaldin.company.register.hibernate.CompanyHibernate"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.kaldin.openid.OauthUser" %>
<%@ include file="/jsp/common/check.jsp" %>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>

<%@page import="java.util.TimeZone"%><html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.common.index.page.title" /></title>
<meta name="description" content="Comprehensive examination software for conducting any type of exam including online exam, 
pre-screening for colleges, universities and companies" />
<meta name="keywords" content="open source examination software, pre-screening tests, test software, practice exams, Examinations, Evaluations, Exam Reports, Online free exams, Online exam software free, 
Software for online exam Online education and assessment software, Online Tests, 
About online examination, Free online examination, Exam test online, Online testing exam,
 Open source examination tool" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<% String isFromOpenId = ""; 
	String domainName = request.getServerName();
	boolean enableSignUp = false;
	if(!new javax.naming.InitialContext().lookup("java:comp/env/license").equals("open-source")){	
		CompanyHibernate companyHibernate = new CompanyHibernate();
		if(!domainName.equalsIgnoreCase("www.kaldin.com") && !domainName.equalsIgnoreCase("kaldin.com") && !domainName.equalsIgnoreCase("test.kaldin.com") && !companyHibernate.isCompanyURLExists(domainName.substring(0, domainName.indexOf(".kaldin.com")))) {
		   response.sendRedirect("https://www.kaldin.com/a/");
		   return;
		}
		if(domainName.equalsIgnoreCase("www.kaldin.com") || domainName.equalsIgnoreCase("kaldin.com") || domainName.equalsIgnoreCase("test.kaldin.com")){
			enableSignUp = true;
		}
	}
%>

<script type="text/javascript">

function submitForOpenIdUser(){
	'<%if(org.apache.commons.lang.StringUtils.isNotEmpty(isFromOpenId)) {%>'
		var candidateForm = document.getElementById("candidateForm");
		document.forms[candidateForm].operation.value = "user";
		document.forms[candidateForm].submit();
	'<%}%>'	
}

function hidemessage(){
	document.getElementById("candidatemessagep").style.display="none";
}

function login(){
		var frm=document.forms[0];
		var userName=document.getElementById("adminUserName").value;
	   	var password=document.getElementById("adminpassword").value;
	    if(userName=="" || password=="") {
               if(userName=="")
            	   document.getElementById("adminUserName").focus();
               else
            	   document.getElementById("adminpassword").focus(); 
		       return false;		
	    } else {
	    	document.getElementById("adminOperationId").value = "admin";
	        frm.submit();
	        return true;		
	    } 
	  return false;
}

function userLogin(){
	var frm=document.forms[1];
	var userName=document.getElementById("userUserName").value;
   	var password=document.getElementById("userPassword").value;
    if(userName=="" || password=="") {
           if(userName=="")
        	   document.getElementById("userUserName").focus();
           else
        	   document.getElementById("userPassword").focus(); 
	       return false;		
    } else {
    	document.getElementById("operationId").value = "user";
        frm.submit();
        return true;		
    } 
  return false;
}

showDialog = function() {
	$("#dialog").dialog({ autoOpen: false, height: 'auto', width: 'auto',draggable : false ,modal: true, closeOnEscape:false });
    $("#dialog").dialog('option', 'title', '<bean:message key="jsp.common.index.page.popup.title" />');
    $("#dialog").dialog('open');
    $("#dialog").dialog('option', 'resizable', false);
    $("#dialog").dialog('option', 'position', 'center');
    $("#dialog").dialog('option', 'reposition', false);
    $('#dialog').dialog(). prev('.ui-dialog-titlebar'). find('a'). hide();         	
  	$('#dialog').css('overflow', 'hidden');
  	$('#dialog').css('background-color','#f5f9fc');
  	$.ui.dialog.prototype.bgiframe = true;
}
</script>
<script type="text/javascript">
        var oauthUri      = "https://accounts.google.com/o/oauth2/auth";
 	 	//var clientId    = "280713505834.apps.googleusercontent.com";  	 	
 	 	var clientId      = "399267301312-dq32nm2lkpuhaf41emnjqb575vqma29m.apps.googleusercontent.com";
	 	var redirectUri   = "https://www.kaldin.com/a/"; 	 	
		var scope         = "https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email";
 	 	var rType         = "token";
		var tokenRequest  = oauthUri
            				+"?response_type="+rType
							+"&client_id="    +clientId
							+"&redirect_uri=" +redirectUri
							+"&scope="        +scope;
	    var params = {}, queryString = location.hash.substring(1),
		    regex = /([^&=]+)=([^&]*)/g, m;
		while (m = regex.exec(queryString)) {
		  params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
		}
		
		$(function(){
			if(params.access_token != null){			
				showDialog();
				$.ajax({
					type: "GET",
					url: "https://www.googleapis.com/oauth2/v1/userinfo",
					data: "access_token=" + params.access_token,
					dataType: "json",
					cache: false,
					success: function(data){						
						var profile = data;					
						var frm = document.forms[0];
						if(frm != null){
							document.getElementById("adminOperationId").value = "glogin";
							frm.gid.value=profile.id;
				   		    
						    if(profile.given_name)
							 frm.fname.value=profile.given_name;
						    else
						     frm.fname.value=profile.email;
							 frm.lname.value=profile.family_name;
							 document.getElementById("adminUserName") .value = profile.email;
							 frm.submit();
						}
					}
				});
			}else if(params.error!=null){
				alert('<bean:message key="jsp.common.index.page.popup.error"/>');
			}			
		});	

		function adminhidemessage(){
			document.getElementById("adminmessagep").style.display="none";
		}

		function checkEmpty(object) {
		 	if(object.value == "") {
		  		return true;
		  	}
		  	return false;
		 }
		function validEmail(object){
			  var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			  if(object.value.match(emailRegEx)){
					return false;
			  }else{
					return true;
			   }
		}
		function validate() {
			var frm = document.getElementById("candidateForm");
		if(checkEmpty(frm.userName)||checkEmpty(frm.password)) {
			alert('<bean:message key="jsp.common.index.page.error1"/>');
			frm.userName.focus();
			return false;
		}
		else if(validEmail(frm.userName)) {
			alert('<bean:message key="jsp.common.index.page.error2"/>');
			frm.userName.focus();
			return false;
		}
		else if(frm.password.value != "" ) {
			var spaceChar = " ";
			for (var i = 0; i < frm.password.value.length; i++) {
				if (spaceChar.indexOf(frm.password.value.charAt(i)) != -1) {
					alert('<bean:message key="jsp.common.index.page.error3"/>');
		 			document.LoginForm.password.focus();
		 			return false;
		 		}
			}
		}
		else 
			frm.operation.value = "admin";
			frm.submit();
		}

		function onCandidateSelect(){
			document.getElementById("candidateTitleId").setAttribute("class", "headertitle");
			document.getElementById("adminTitleId").setAttribute("class", "headertitle unselected");
			document.getElementById("candidatesection").style.display="";
			document.getElementById("adminsection").style.display="none";
		}

		function onAdminSelect(){
			document.getElementById("candidateTitleId").setAttribute("class", "headertitle unselected");
			document.getElementById("adminTitleId").setAttribute("class", "headertitle");
			document.getElementById("candidatesection").style.display="none";
			document.getElementById("adminsection").style.display="";
		}
</script>

<style type="text/css">
.candidateLogin {
	margin: 50px auto;
    width: 440px;
    float: right;
}

.adminLogin {
	/*float: right;
    margin: 40px auto;*/
    padding-right: 20px;
}

.admin_login_box  {
    background: none repeat scroll 0 0 #FDF5E6;
    border: 10px solid #D6C69E;
    display: inline-block;
    padding: 10px;
}

.admin_login_box h2 {
    -moz-border-radius: 5px 5px 5px 5px;
    background: none repeat scroll 0 0 #D6C69E;
    font-size: 20px;
    font-weight: bold;
    margin: 0 0 10px;
    padding: 5px 0;
    text-align: center;
    text-transform: capitalize;
}

.admin_login_box label {
    width: 30%;
    float: left;
}

.login_box .forgot_pass {
    background: #FFF no-repeat scroll left center transparent;
    display: inline;
    float: left;
    font-weight: bold;
    margin: 8px 34px 0 95px;
    text-transform: capitalize;
    width: auto;
    padding: 0 0 0 0px;
}

.headertitle  {
    -moz-border-radius: 5px 5px 0 0;
    background: none repeat scroll 0 0 #D6C69E;
    font-size: 16px;
    font-weight: bold;
    padding: 10px 0;
    text-align: center;
    text-transform: capitalize;
    width: 125px;
    float:left;
    margin-left: 5px;
}
.unselected{
    background: none repeat scroll 0 0 #FFF;
}

table {
	border: 0px none;
}

table td {
	border: 0px none;
}

.admin_login_box .forgot_pass {
  background: #fff no-repeat scroll left center transparent;
  display: inline;
  float: right;
  font-weight: bold;
  padding: 35px 30px 4px;
  text-transform: capitalize;
  width: auto;
}

.admin_login_buttons {
	padding-right: 75px;
	padding-top: 10px;
}
</style>
 
</head>
<body onload="submitForOpenIdUser();">
<%  
	isFromOpenId = (String) session.getAttribute("isFromOpenId");
	OauthUser oauthUser = null;
	if(org.apache.commons.lang.StringUtils.isNotEmpty(isFromOpenId)) {
		oauthUser = (OauthUser) session.getAttribute("oauthUser");
	}
    session.setAttribute("Admin", null);
	session.setAttribute("User", "UserLogin");
    
    session.setAttribute("User",null);
	session.setAttribute("Admin", "SignUp");
%>
<% 
//Set local date in session
session.removeAttribute("localDate");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
sdf.setTimeZone(TimeZone.getDefault());
session.setAttribute("localDate", sdf.format(new Date()));
//System.out.println("d1 "+sdf.format(new Date()));
%>
<% if (request.getParameter("access_token") == null)
{
	%>
		<div id="dialog" align="center" style="display: none;">
		     <img alt="" src="<%=request.getContextPath()%>/images/loging.gif">
		</div>
<div id="wrapper">
  <div id="header">
  	<logic:notPresent name="logo">
    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img src="<%=request.getContextPath()%>/uploads/logos/logo-blue.png" alt="kaldin" /></a></h1>
    </logic:notPresent>
    <logic:present name="logo">
    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img id="clogo" src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></a></h1>
    </logic:present>
   </div>
  <div id="content"> 
  	<div class="container">
  	 
    <div class="adminLogin">
   
		<table style="width: 70%;">
			<tr>
				<td style="width: 30%;vertical-align: top;">
						 <div id="adminsection">
						  
						   <div id="signin_menu" style="float: left;display:block;">
						      <h4><bean:message key="jsp.common.index.page.adminlogin"/></h4>
						      <logic:present name="erroradmin1">
						   			<p class="message invalid" id="adminmessagep">
						   			<bean:write name="erroradmin1" filter="true"></bean:write>
						   			<span class="x" onclick="adminhidemessage();"></span>
						   			</p>
							</logic:present>
						      <html:form action="/login" styleId="adminForm" onsubmit="return false;">
						        <p><label><bean:message key="jsp.common.index.page.adminlogin.email"/></label>
						        <html:text property="userName" styleId="adminUserName" size="30" placeholder="Enter Email"/>
						        </p>
						        <p>
						        <label><bean:message key="jsp.common.index.page.adminlogin.password"/></label>
						        <html:password property="password" styleId="adminpassword" placeholder="Enter Password" size="30"/>
							    </p>
						        <p class="remember">
						        <label></label>
						        <a href="<%=request.getContextPath() %>/forgotpasswordAdmin.do" ><bean:message key="jsp.common.index.page.adminlogin.forgotpass"/></a>
						        <button class="btn_green" style="float:right" onclick="login(); return false;"><bean:message key="jsp.common.index.page.adminlogin.loginbtn"/></button>
						   		</p>
						   		<input type="hidden" name="operation" id="adminOperationId" value="" />
						   		<html:hidden property="gid" value=""/>
						   		<html:hidden property="fname" value=""/>
						   		<html:hidden property="lname" value=""/>
						   		<% if(!new javax.naming.InitialContext().lookup("java:comp/env/license").equals("open-source") && enableSignUp){%>
							       <script type="text/javascript">
								     document.write("<a href='"+tokenRequest+"' class='btn_gray gmail_login' onclick='return showDialog()'>"+"<img src='<%=request.getContextPath()%>/images/google.jpg' height='16px'/>&nbsp;<bean:message key="jsp.common.index.page.adminlogin.googleloginbtn"/></a>");
							       </script>
							    
						        <a href="<%=request.getContextPath()%>/calladsignup.do" class="btn_blue"  style="float:right"><bean:message key="jsp.common.index.page.adminlogin.signupbtn"/></a>
						        <%}%>
						        <input type="hidden" name="usertz" id="usertz"/>
						   </html:form>
						    </div>
					</div>
				</td>
				<td style="width: 30%;">
					<div id="candidatesection">
				    	
    <form name="LoginForm" method="post" id="candidateForm" action="<%=request.getContextPath() %>/login.do">
     <div id="signin_menu" style="float: left;">
      <h4><bean:message key="jsp.common.index.page.candidatelogin"/></h4>
      <logic:present name="error1">
				   			<p class="message invalid" id="candidatemessagep">
				   			<bean:write name="error1" filter="true"></bean:write>
				   			<span class="x" onclick="hidemessage();"></span>
				   			</p>
					  </logic:present>
     <p>  
        <label><bean:message key="jsp.common.index.page.candidatelogin.email"/></label>
        <input type="text" name="userName" id="userUserName" placeholder="Enter Email" size="30" value="<%= oauthUser == null? "" : oauthUser.getEmail() %>"/>
        </p>
		<p>
        <label><bean:message key="jsp.common.index.page.candidatelogin.password"/></label>
        <input type="password" name="password" id="userPassword" placeholder="Enter Password" size="30" value="<%= oauthUser == null? "" : "any" %>"/>
        </p> 
		<p class="remember">
		 <label></label>
		 <a href="<%=request.getContextPath() %>/forgotpassword.do"><bean:message key="jsp.common.index.page.candidatelogin.forgotpass"/></a>
        <input type="hidden" name="operation" id="operationId" value="user"/>
		<input type="hidden" name="usertz" id="usertzc"/>
        <button class="btn_green" style="float:right" onclick="userLogin();"><bean:message key="jsp.common.index.page.candidatelogin.loginbtn"/></button>
        </p>
        
    </div>
     </form>
    </div>
				</td>
			</tr>
		</table>
   </div>
   </div>
  </div>
  <%@ include file="/jsp/common/footer.jsp"%>
</div>
<%
} else {
%>
<form name="LoginForm" method="POST" action="<%=request.getContextPath()%>/login.do" >
<input type="hidden" name="userName" size="30" value="" id="adminUserName">
<input type="hidden" name="password" size="30" value="" id="adminpassword">
<input type="hidden" name="operation" id="adminOperationId" value="" />
<input type="hidden" name="gid" value="">
<input type="hidden" name="fname" value="">
<input type="hidden" name="lname" value="">
</form>
<% }
%>
<script type="text/javascript">
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });
   document.getElementById("usertz").value = new Date().getTimezoneOffset();
   document.getElementById("usertzc").value = new Date().getTimezoneOffset();
</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
