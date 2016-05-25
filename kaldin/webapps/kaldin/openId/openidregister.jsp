<%@page import="com.kaldin.openid.OauthUser"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>User Login - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath() %>/css/style.css"
	rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="images/favicon.ico" rel="shortcut icon" />
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/tabber.js" type="text/javascript"></script>
<script type="text/javascript">
function submitForm(){
	document.LoginForm.submit();
}
</script>
<style>
.adminlink  {
    color: #333333;
    font-family: Century Gothic;
    font-size: 18px;
    font-weight: bold;
    margin: 26px 0 0 -10px;
    position: absolute;
    text-align: right;
    text-transform: capitalize;
    width: 100%;
}

.adminlink a, a:link  {
    color: #FFF;
    text-decoration: none;
}
</style>
</head>
<body onload="javascript:submitForm();">
<%  
	String isFromOpenId = (String) session.getAttribute("isFromOpenId");
	OauthUser oauthUser = null;
	if(org.apache.commons.lang.StringUtils.isNotEmpty(isFromOpenId)) {
		oauthUser = (OauthUser) session.getAttribute("oauthUser");
	}
    session.setAttribute("Admin", null);
	session.setAttribute("User", "UserLogin");
%>
<div id="wrapper">

   <div id="header">
    <h1>
    	<a href="http://www.kaldin.com"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a>
	</h1>
	<div class="adminlink"><a href="<%=request.getContextPath() %>/jsp/common/index.jsp">Admin</a></div>
   </div>	
  
  <!--HEADER ENDS HERE-->
  

  <div id="content" >
    <div id="login">
      
           
      <logic:present name="message">
   			<p class="message invalid" id="messagep">
   			<bean:write name="message" filter="true"></bean:write>
   			<span class="x" onclick="hidemessage();">X</span>
   			</p>
	  </logic:present>
      
       
    <form name="LoginForm" method="post" action="<%=request.getContextPath() %>/login.do">
     <div class="login_box" style="float: left;">
      <h2>user login</h2>
     

  
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
  
  <!-- LOGIN ENDS HERE  -->
  </div>
  <!-- CONTENT ENDS HERE  -->
 
  <!--FOOTER ENDS HERE  --> 
</div>
 <%@ include file="/jsp/common/footer.jsp"%>
<!--MAIN ENDS HERE-->
</body>
</html>