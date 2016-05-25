<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Registration-Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=request.getContextPath()%>/css/ui.all.css" rel="stylesheet"
	type="text/css" />
<link type='text/css' href='<%=request.getContextPath()%>/css/basic.css'
	rel='stylesheet' media='screen' />
<link href="<%=request.getContextPath()%>/css/ui.dialog.css" rel="stylesheet"
	type="text/css" />
<link href="<%=request.getContextPath()%>/css/stylenew.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js?dt=19aug2013"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.core.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jHtmlArea-0.7.0.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.datepicker.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/sendmail.js?dt=6nov2013"></script>
<script src="<%=request.getContextPath()%>/js/jquery.corner.js?dt=19aug2013" type="text/javascript"></script>
</head>
<script type="text/javascript">

function selectAll(){
	frm = document.forms["RegistrationForm"];
	if(document.getElementById("chkselectAll").checked==true){			
		CheckBoxArray = frm.email;
		for(i=0;i<CheckBoxArray.length;i++) {
			CheckBoxArray[i].checked=true;
		}
	} else {
		CheckBoxArray = frm.email;
		for(i=0;i<CheckBoxArray.length;i++) {
			CheckBoxArray[i].checked=false;
		}
	}
}

function addUser() {
	frm=document.forms["RegistrationForm"];
	if(frm.newEmailId.value == ""){
		alert("Please enter email Id");
		frm.newEmailId.focus();
		return false;
	} else if(validEmail(frm.newEmailId)){
		alert("Please enter valid user name");
		frm.newEmailId.focus();
		return false;
	} else {
		frm.operation.value="addUser";
		frm.submit();
	}
}

function validEmail(object){
	  var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  if(object.value.match(emailRegEx)){
			return false;
	  }else{
			return true;
	   }
}

function doSubmit(){
	var flag=0;
	<logic:present name="UserList">
	<logic:iterate id="user" name="UserList">
		var str=document.getElementById("${user.emailId}");
		if(str.checked==true){	
			flag=1;
		}
	</logic:iterate>
	</logic:present>
	if(flag==0) {
		alert("Please Select at least one user for sending link.");
		return false;
	} else {
		frm=document.forms["RegistrationForm"];
		frm.operation.value="sendEmail";
		frm.submit();
	}
}
</script>
<body>
<div id="wrapper">
<%@ include file="/jsp/common/header.jsp"%><!--	 header end here -->
<!--	CONTENT -->
<div id="content">
    <div id="right_section">
      	  <h3>test</h3>
	      <div id="right_nav">
	        <ul>
	          <li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" >create question paper</a></li>
	          <li><a href="<%=request.getContextPath()%>/schdultestlist.do">scheduled tests</a></li>
		      <li><a href="<%=request.getContextPath()%>/ScheduleTest.do">schedule test</a></li>
	          <li><a href="<%=request.getContextPath()%>/sendmail.do">send mail</a></li>
	          <li><a href="<%=request.getContextPath()%>/registration.do" class="active">send registration link</a></li>
	         </ul>
	      </div>
      <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE-->
	<div id="left_section">
		<logic:notPresent name="UserList"><h3>No unregistered candidate found.</h3></logic:notPresent>
		<div id="contentTable">
			<div id="registration_link">
				<logic:present name="MailSentMessage">
					<center><font color="red"><b><bean:write name="MailSentMessage" filter="true" /></b></font></center>
				</logic:present>
				<div>
					<html:form action="/registration" styleId="registrationId">
						<html:hidden property="operation" value=""></html:hidden>
						<table style="margin-bottom: 20px;">
							<tr>
								<td width="40%"><label>Email:</label>&nbsp;&nbsp;&nbsp;<html:text property="newEmailId" size="30"></html:text></td>
								<td><button class="btn_green"  onclick="addUser();">Add User</button></td>
							</tr>
						</table>
						<logic:present name="UserList">
							<table>
								<tr>
									<th>UserList</th>
								</tr>
								<tr>
									<td><input type="checkbox" onclick='selectAll();' id="chkselectAll">&nbsp;Select All</td>
								</tr>
								<logic:iterate id="user" name="UserList">
									<tr>
										<td><html:checkbox property="email" value="${user.emailId}" styleId="${user.emailId}">&nbsp;
												<bean:write name="user" property="emailId"  filter="true"/>
											</html:checkbox>
										</td>
									</tr>
								</logic:iterate>
							</table>
							<button class="btn_green"  style="float: right;" onclick="doSubmit();return false;">Send Link</button>
						</logic:present>
					</html:form>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<%@ include file="/jsp/common/footer.jsp"%>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
