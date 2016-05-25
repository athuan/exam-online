<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.setting.forgotpass.page.title"/></title>
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
		var frm = document.forms["ForgotPassForm"];
		var email = document.ForgotPassForm.email.value;
		//var question = document.ForgotPassForm.question.value;
		//var answer = document.ForgotPassForm.answer.value;
		if (email == "") {
			alert('<bean:message key="jsp.setting.forgotpass.page.error1"/>');
			return false;
		}
		if (validEmail(document.ForgotPassForm.email)) {
			alert('<bean:message key="jsp.setting.forgotpass.page.error2"/>');
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
						<h4>
							<bean:message key="jsp.setting.forgotpass.page.resetpass" />
						</h4>
					</logic:notPresent>
					
					<logic:present name="password">
						<logic:equal name="msgtype" value="error">
							<p class="message invalid">
								<bean:write name="password" filter="true"></bean:write>
							</p>
							<html:form action="/forgotpassword" onsubmit="return false;">
								<p>
									<label><bean:message
											key="jsp.setting.forgotpass.page.email" /></label>
									<html:text property="email"></html:text>
								</p>

								<p style="display: none">
									<label>Question:</label>
									<html:select property="question">
										<html:option value="0">Select Question</html:option>
										<html:option value="School Name">What is Your School Name</html:option>
										<html:option value="Nick Name">What is Your Nick Name</html:option>
										<html:option value="Mother Name">What is Your Mother Name</html:option>
										<html:option value="Birth Place">What is Your Birth Place</html:option>
									</html:select>
								</p>
								<p style="display: none">
									<label>Answer: </label>
									<html:text property="answer"></html:text>
								</p>
								<p>
									<label></label>
									<button class="btn_green" id="submit_btn"
										onclick="return doSubmit();">
										<bean:message key="jsp.setting.forgotpass.page.sendbtn" />
									</button>
								</p>
							</html:form>
						</logic:equal>
						<logic:notEqual name="msgtype" value="error">
							<p class="message success">
								<bean:write name="password" filter="true"></bean:write>
							</p>
						</logic:notEqual>
					</logic:present>
					
					<logic:notPresent name="password">
						<html:form action="/forgotpassword" onsubmit="return false;">
							<p>
								<label><bean:message
										key="jsp.setting.forgotpass.page.email" /></label>
								<html:text property="email"></html:text>
							</p>

							<p style="display: none">
								<label>Question:</label>
								<html:select property="question">
									<html:option value="0">Select Question</html:option>
									<html:option value="School Name">What is Your School Name</html:option>
									<html:option value="Nick Name">What is Your Nick Name</html:option>
									<html:option value="Mother Name">What is Your Mother Name</html:option>
									<html:option value="Birth Place">What is Your Birth Place</html:option>
								</html:select>
							</p>
							<p style="display: none">
								<label>Answer: </label>
								<html:text property="answer"></html:text>
							</p>
							<p>
								<label></label>
								<button class="btn_green" id="submit_btn"
									onclick="return doSubmit();">
									<bean:message key="jsp.setting.forgotpass.page.sendbtn" />
								</button>
							</p>
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
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
