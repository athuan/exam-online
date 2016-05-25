<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Change Password - Kaldin The Knowledge Evaluator</title>

<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />

<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/tabber.js?dt=19aug2013" type="text/javascript"></script>
<script type="text/javascript">
function validEmail(object){
	  var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  if(object.value.match(emailRegEx)){
			return false;
	  }
	  else{
			return true;
	   }
}	
			function doSubmit(){

				var frm=document.forms["ForgotPassForm"];
				var email=document.ForgotPassForm.email.value;
				var question=document.ForgotPassForm.question.value;
			   	var answer=document.ForgotPassForm.answer.value;
			   	if(email=="" || answer=="")
			    {
			       alert("Blank Not Allowed.");
			       return false;		
			    }
               if(validEmail(document.ForgotPassForm.email))
				{
					
					alert("Please Enter Valid User Name");
					document.ForgotPassForm.email.focus();
					return false;
				}	
			   	else if(question=="0")
			   	{
			   		alert("Select Question.");
				       return false;	
			   	}
			    else
			     {
			        frm.submit();
			     }
		}
</script>
</head>
<body>

<div id="wrapper">
<%@ include file="/jsp/common/header.jsp"%>
<!--HEADER ENDS HERE-->
<div id="content">
<div id="login1">
<h2 align="center"><b><logic:present name="pass">
			<bean:write name="pass" filter="true"></bean:write>
		</logic:present></b></h2>	
<div class="login_box1" id="round_corner">
<h2>New Password</h2>
<html:form action="/Newpassword">
		<table>
		<tr>
			<td><label>New Password: </label></td>
			<td><html:password property="pass"></html:password></td>
		</tr>
		<tr>
			<td><label>Confirm Password :</label></td>
			<td><html:password property="cpass"></html:password></td>
		</tr>
		
</table>
<p class="align">
<button class="btn_green"  onclick="return doSubmit();">Submit</button>
<a href="<%=request.getContextPath()%>"><button class="btn_green" >Back</button></a>
</html:form>
</div>
<!--LoginBox ENDS HERE--></div>
</div>
<!--LEFT SECTION ENDS HERE--></div>
<!-- CONTENT ENDS HERE  -->
<%@ include file="/jsp/common/footer.jsp"%>
<!--FOOTER ENDS HERE  --></div>
<!--MAIN ENDS HERE-->
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>

