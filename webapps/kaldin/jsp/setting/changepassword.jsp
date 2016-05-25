<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Change PassWord - Kaldin Online Exam to Evaluate Knowledge</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/setting/changepassword.js?dt=19aug2013"></script>
</head>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
</script>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>

	<div id="wrapper">
	<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
		<%@ include file="/jsp/common/header.jsp"%>
	<%}else{ %>
		<%@ include file="/jsp/common/adminHeader.jsp"%>
	<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calladminchangepass.do" class="active">Change Password</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">You may Edit/Update and change the password for your profile.</p></div>
			</div>
			<div id="main">
					<html:form action="/changepassword">
						<logic:present name="result">
							<p class="message success" id="messagep">
								<bean:write name="result" filter="true"></bean:write>
								<span class="x" onclick="hidemessage();"></span>
							</p>
						</logic:present>
						<logic:notPresent name="result">
							<h3>Change Password</h3>
							<hr />
							<div class="change_pass">
								<p>
									<label>Current Password:</label>
									<html:password property="currentPassword" />
								</p>
								<p>
									<label>New Password:</label>
									<html:password property="newPassword"
											styleId="newPassword" />
								</p>
								<p>
									<label>Confirm Password:</label>
									<html:password property="confirmPassword"
											       styleId="confirmPassword" />
								</p>
								<p>
									<label></label>
									<input type="button" value="Submit" class="btn_green" onclick="javaScript:submit1();" />
								</p>
							</div>
							<!--	<p>-->
							<!--	<label>Current Password </label><html:password property="currentPassword" />-->
							<!--	</p>-->
							<!--	<p>-->
							<!--	<label>New Password </label><html:password property="newPassword"  styleId="newPassword"/>-->
							<!--	</p>-->
							<!--	<p>-->
							<!--    <label>Confirm Password </label><input type="password" name="confirmpassword"/>-->
							<!--    </p>-->
							<!--    <p>-->
							<html:hidden property="userId"></html:hidden>
							<html:hidden property="userrole" value="Admin"></html:hidden>
							<!--	<input type="button" value="Submit" class="btn_green"  onclick="javaScript:submit1();"/>-->
							<!--	</p>-->
						</logic:notPresent>
					</html:form>
			</div>
		</div>
		<script type="text/javascript">
			submit1 = function() {
				doSubmit();
			}

			$(document).ready(function() {
			     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
			});
		</script>
</div>
<img height="1" width="1" src='/log/hit.php?pageName=cpadmin&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>