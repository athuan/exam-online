<%@page import="com.kaldin.openid.OauthUser"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Administrator Login - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.js"> </script>
<script type="text/javascript" src="js/jquery-1.3.2.js"></script>

<script type='text/javascript' src="<%=request.getContextPath()%>/js/dialog/jquery.simplemodal.js"></script>
<script type='text/javascript' src="<%=request.getContextPath()%>/js/dialog/basic.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jHtmlArea-0.7.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.core.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.draggable.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.resizable.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.dialog.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jHtmlArea-0.7.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.datepicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tabber.js"></script>
<% String isFromOpenId = ""; %>

<script type="text/javascript">

function submitForOpenIdUser(){
	'<%if(org.apache.commons.lang.StringUtils.isNotEmpty(isFromOpenId)) {%>'
		var candidateForm = document.getElementById("candidateForm");
		document.forms[candidateForm].submit();
	'<%}%>'	
}

function hidemessage(){
	document.getElementById("messagep").style.display="none";
}
login=function(){
		//var frm=document.forms["LoginForm"];
		var frm=document.getElementById("adminForm");
		var userName=frm.elements[0].value;
	   	var password=frm.elements[1].value;
	   	frm.operation.value="admin";	
	    if(userName=="" || password=="")
	    {
		       alert("Blank Not Allowed.");    
               if(userName=="")
            	   frm.elements[0].focus();
               else
            	   frm.elements[1].focus(); 
		       return false;		
	    }
	    else
	     {
	        frm.submit();
	     }
}

showDialog=function() {	
	$("#dialog").dialog({ autoOpen: false, height: 'auto', width: 'auto',draggable : false ,modal: true, closeOnEscape:false });
    $("#dialog").dialog('option', 'title', "Please wait while processing...");
    $("#dialog").dialog('open');
    $("#dialog").dialog('option', 'resizable', false);
    $("#dialog").dialog('option', 'position', 'center');
    $("#dialog").dialog('option', 'reposition', false);
    $('#dialog').dialog(). prev('.ui-dialog-titlebar'). find('a'). hide();         	
  	$('#dialog').css('overflow', 'hidden');
  	$('#dialog').css('background-color','#f5f9fc');
  	$.ui.dialog.defaults.bgiframe = true;
}
</script>
<script type="text/javascript">
        var oauthUri      ="https://accounts.google.com/o/oauth2/auth";
 		//var clientId      ="443108830279-je0vku7oiq7gf39g148hs1hpei8km8cd.apps.googleusercontent.com";
 	 	//var clientId      ="278883774348.apps.googleusercontent.com";
 	 	var clientId      = "399267301312-dq32nm2lkpuhaf41emnjqb575vqma29m.apps.googleusercontent.com";
 	 	var redirectUri   ="http://www.kaldin.com/jsp/common/index.jsp";
		var scope         ="https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email";
 	 	var rType         ="token";
		var tokenRequest  =oauthUri
            				+"?response_type="+rType
							+"&client_id="    +clientId
							+"&redirect_uri=" +redirectUri
							+"&scope="        +scope;
	    var params = {}, queryString = location.hash.substring(1),
		    regex = /([^&=]+)=([^&]*)/g, m;
		while (m = regex.exec(queryString)) {
		  params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
		}
		if(params.access_token!=null){
			showDialog();
			$.ajax({
				type: "GET",
				url: "https://www.googleapis.com/oauth2/v1/userinfo",
				data: "access_token="+params.access_token+"&format=json&jsoncallback=?",
				dataType: "jsonp",
				cache: true,
				success: function(data){
					//alert(data); 
					var profile=eval(data);
					var frm=document.forms["LoginForm"];
					frm.operation.value="glogin";
				    frm.gid.value=profile.id;
				   		    
				    if(profile.given_name)
					 frm.fname.value=profile.given_name;
				    else
				     frm.fname.value=profile.email;
					 frm.lname.value=profile.family_name;
					 frm.userName.value =profile.email;
					
					frm.submit();
				}
			});
		}else if(params.error!=null){
			alert("Access denied from Google!! Please Login or SignUP.");
		}
</script>
<style type="text/css">
.candidateLogin {
	margin: 100px auto;
    width: 440px;
    float: left;
}

.adminLogin {
	margin: 100px auto;
    width: 440px;
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
		<div id="dialog" align="center" style="display: none;">
		     <img alt="" src="<%=request.getContextPath()%>/images/icons/loging.gif">
		</div>
<div id="wrapper">
  <%@ include file="/jsp/common/header.jsp"%>
  <!--HEADER ENDS HERE-->
  <div id="content">
  	<div id="login" class="candidateLogin">
      
           
      <logic:present name="message">
   			<p class="message invalid" id="messagep">
   			<bean:write name="message" filter="true"></bean:write>
   			<span class="x" onclick="hidemessage();"></span>
   			</p>
	  </logic:present>
      
       
    <form name="LoginForm" method="post" id="candidateForm" action="<%=request.getContextPath() %>/login.do">
     <div class="login_box" style="float: left;">
      <h2>Candidate Login</h2>
        <label>Email:</label>
        <input type="text" name="userName" size="30" value="<%= oauthUser == null? "" : oauthUser.getEmail() %>"/>
        <span class="mandatory">*</span>
		
        <label>Password:</label>
        <input type="password" name="password" size="30" value="<%= oauthUser == null? "" : "any" %>"/>
        <span class="mandatory">*</span>
        <div class="forgot_pass"><a href="<%=request.getContextPath() %>/forgotpassword.do">Forgot Password?</a></div>
        <input type="hidden" name="operation" value="user"/>                    
        <button class="btn_green"   style="float:right">Log In</button>
    </div>
     </form>
   
  	</div>
    <div id="login" class="adminLogin">
    <logic:present name="message">
   			<p class="message invalid" id="messagep">
   			<bean:write name="message" filter="true"></bean:write>
   			<span class="x" onclick="hidemessage();"></span>
   			</p>
	</logic:present>
   <div class="login_box" style="float: left;">
      <h2>Administrator Login </h2>
      <html:form action="/login" styleId="adminForm">
        <label>Email:</label>
        <html:text property="userName" size="30" />
        <span class="mandatory">*</span>
        <label>Password:</label>
        <html:password property="password" size="30"/>
	    <span class="mandatory">*</span>
        <div class="forgot_pass">
        <a href="<%=request.getContextPath() %>/forgotpasswordAdmin.do" >Forgot Password?</a></div>
       
        <button class="btn_green" style="float:right" onclick="return login(); return false;">Log In</button>
   		
   		<html:hidden property="operation" value="admin"/>
   		<html:hidden  property="gid" value=""/>
   		<html:hidden  property="fname" value=""/>
   		<html:hidden  property="lname" value=""/>
      <a href="<%=request.getContextPath()%>/calladsignup.do"><input type="button" class="btn_green"  style="float:right"  value="Sign Up"/></a> 
    		<div style="float: right;">
		       <script type="text/javascript">
			     document.write("<a href='"+tokenRequest+"' onclick='return showDialog()'>"+"<img src='<%=request.getContextPath()%>/images/icons/google.png' height='45px'/></a>");
		       </script>
 			</div> 
   </html:form>
    </div>
   </div>
   <!-- LOGIN ENDS HERE  -->
  
  </div>
  <!-- CONTENT ENDS HERE  -->
  <%@ include file="/jsp/common/footer.jsp"%>
  <!--FOOTER ENDS HERE  --> 
</div>
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>
