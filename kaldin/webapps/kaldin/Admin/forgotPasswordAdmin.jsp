<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.admin.forgotpass.page.title"/></title>
<meta name="description" content="Comprehensive examination software for conducting any type of exam including online exam, 
pre-screening for colleges, universities and companies" />
<meta name="keywords" content="open source examination software, pre-screening tests, test software, practice exams, Examinations, Evaluations, Exam Reports, Online free exams, Online exam software free, 
Software for online exam Online education and assessment software, Online Tests, 
About online examination, Free online examination, Exam test online, Online testing exam,
 Open source examination tool" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script type="text/javascript">
	function validEmail(object) {
		var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if (object.value.match(emailRegEx)) {
			return false;
		} else {
			return true;
		}
	}
	function doSubmit() {
		var frm = document.forms["ForgotPasswordAdminForm"];
		var email = document.ForgotPasswordAdminForm.userName.value;
		if (email == "") {
			alert('<bean:message key="jsp.admin.forgotpass.page.error1"/>');
			return false;
		}
		if (validEmail(document.ForgotPasswordAdminForm.userName)) {
			alert('<bean:message key="jsp.admin.forgotpass.page.error2"/>');
			document.ForgotPassForm.email.focus();
			return false;
		} 
		document.getElementById('submit_btn').disabled  = true;
		frm.submit();
	}
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="login1">
				<div id="signin_menu">
				 <logic:notPresent name="password">
					   <h4><bean:message key="jsp.admin.forgotpass.page.resetpass"/></h4>	
				 </logic:notPresent>
					<logic:present name="password">
						<logic:equal name="msgtype"  value="error" >
							<p  class="message invalid">
								<bean:write name="password" filter="true"></bean:write>					
							</p>
							<html:form action="/forgotsendPassword" onsubmit="return false;">
								<p>
									<label><bean:message key="jsp.admin.forgotpass.page.email" /></label>
									<html:text property="userName"></html:text>
								</p>
								<p>
									<label></label>
									<button id="submit_btn" class="btn_green" onclick="return doSubmit();">
										<bean:message key="jsp.admin.forgotpass.page.sendbtn" />
									</button>
								</p>
							</html:form>
						</logic:equal>
						<logic:notEqual name="msgtype"  value="error" >
							<p  class="message success">
								<bean:write name="password" filter="true"></bean:write>					
							</p>
						</logic:notEqual>
							
					</logic:present>
					<logic:notPresent name="password">
					<html:form action="/forgotsendPassword" onsubmit="return false;">
						<p><label><bean:message key="jsp.admin.forgotpass.page.email"/></label>
							<html:text property="userName"></html:text>
						</p>
						<p><label></label><button id="submit_btn" class="btn_green" onclick="return doSubmit();"><bean:message key="jsp.admin.forgotpass.page.sendbtn"/></button></p>
					</html:form>
					</logic:notPresent>
				</div>
			</div>
		</div>
	<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/feedback.jsp"%>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>