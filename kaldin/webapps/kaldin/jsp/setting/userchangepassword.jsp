<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Change Password - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/tabber.js?dt=19aug2013"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/setting/changepassword.js?dt=19aug2013"></script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/userhome.do">Scheduled Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/loadtest.do"">Given Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/callCandidateProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calluserchangepass.do" class="active">Change Password</a></li>
				</ul>
				<div class="sidebar_note message note"><p>You may Edit/Update and change the password for your profile.</p></div>
			</div>
			<div id="main">
				<html:form action="/changepassword">
					<h3>Change Password</h3>
					<hr />
					<logic:present name="result">
						<p class="message success"><bean:write name="result" filter="true"></bean:write></p>
					</logic:present>
					<div class="change_pass">
						<p>
							<label>Current Password:</label>
							<html:password property="currentPassword" value=""
									style="btn_corner" size="28" />
						</p>
						<p>
							<label>New Password:</label>
							<html:password property="newPassword" value=""
									style="btn_corner" size="28" />
						</p>
						<p>
							<label>Confirm Password:</label>
							<html:password property="confirmPassword" value=""
									style="btn_corner" size="28" />
						</p>
						<p>
							<label></label>
									<button class="btn_green" onclick="javaScript:submit1();">Submit</button>
						</p>
					</div>
					<html:hidden property="userId"></html:hidden>
					<html:hidden property="userrole" value="User"></html:hidden>
				</html:form>
			</div>
		</div>
	</div>
<img height="1" width="1" src='/log/hit.php?pageName=cpcan&sessionId=<%=session.getId()%>&uid=c-<%=session.getAttribute("UserId")%>&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/feedback.jsp" %>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
