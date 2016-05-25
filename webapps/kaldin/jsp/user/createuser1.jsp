<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Add Your Info - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/tabber.js?dt=19aug2013" type="text/javascript"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
<script type="text/javascript">	

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

	if(checkEmpty(document.CandidateForm.email)||checkEmpty(document.CandidateForm.password)||checkEmpty(document.CandidateForm.cpassword)||checkEmpty(document.CandidateForm.answer)) {
		alert("Mandatory fields should not be empty..");
		document.CandidateForm.email.focus();
		return false;
	}
	else if(validEmail(document.CandidateForm.email)) {
		
		alert("Please Enter Valid User Name");
		document.CandidateForm.email.focus();
		return false;
	}	
	else if(document.CandidateForm.password.value != document.CandidateForm.cpassword.value) {
		
		alert("Confirm Password & Password Must Be Same");
		document.CandidateForm.cpassword.focus();
		return false;
	}
	else if(document.CandidateForm.question.value.toString()=="Question")
	{
		alert("Select Hint Question");
		document.CandidateForm.question.focus();
		return false;
    }
	else if(document.CandidateForm.password.value != "") {
		var spaceChar = " ";
		for (var i = 0; i < document.CandidateForm.password.value.length; i++) {
			if (spaceChar.indexOf(document.CandidateForm.password.value.charAt(i)) != -1) {
				alert("Password Should not Contain any space");
	 			document.CandidateForm.password.focus();
	 			return false;
	 		}
		}
	}
	else
		 {
		document.CandidateForm.submit();
	}
}
</script>

</head>
<body>

<div id="wrapper">
<div id="header">
<h1><a href="http://www.kaldin.com"><img src="images/logo-blue.png"
	alt="kaldin" /></a></h1>
</div>
<!--HEADER ENDS HERE-->
<div id="content">
<div id="login1">
<h3 align="center"><logic:present name="msg">
	<bean:write name="msg" filter="true"></bean:write>
</logic:present></h3>
<div class="login_box1" id="round_corner" style="padding-top: 1px;">
<h2>User SignUp</h2>
<html:form action="/signupNewUser">
	<html:hidden property="companyId" value='<%=(String) request.getParameter("CompanyId") %>'></html:hidden>
	<table border="2">
		<tr>
			<td><label>Email:</label></td>
			<td><html:text property="email" value='<%=(String) request.getParameter("email") %>'></html:text></td>
		</tr>
		<tr>
			<td><label>Password:</label></td>
			<td><html:password property="password"></html:password></td>
		</tr>


		<tr>
			<td><label>confirm password:</label></td>
			<td><html:password property="cpassword"></html:password></td>
		</tr>
		<tr>
			<td><label>Question:</label></td>
			<td><html:select property="question">
				<html:option value="Question">Select Question</html:option>
				<html:option value="School Name">What is Your School Name</html:option>
				<html:option value="Nick Name">What is Your Nick Name</html:option>
				<html:option value="Mother Name">What is Your Mother Name</html:option>
				<html:option value="Birth Place">What is Your Birth Place</html:option>
			</html:select></td>
		</tr>
		<tr>
			<td><label>Answer: </label></td>
			<td><html:text property="answer"></html:text></td>
		</tr>
		<tr>
			<td><a
				href="<%= request.getContextPath()%>"
				class="forgot_pass">click here to login</a></td>
			<td>
			<button class="btn_green" onclick="return validate();" style="float: right">SIGNUP</button>
			</td>
		</tr>
	</table>
</html:form>

</div>
<!--LOGIN BOX ENDS HERE--></div>
<!-- LOGIN ENDS HERE  --></div>
<!-- CONTENT ENDS HERE  --> <%@ include file="/jsp/common/footer.jsp"%>
<!--FOOTER ENDS HERE  --></div>
<!--MAIN ENDS HERE-->
</body>
</html>



	