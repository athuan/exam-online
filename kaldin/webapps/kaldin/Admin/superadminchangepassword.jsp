<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Change Password - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="js/setting/changepassword.js"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/superadminchangepass.do" class="active">Change Password</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
			</div>
			<div id="main">
			<h3>Change Password</h3>
			<hr />
				<div id="contentTable">
					<div id="q_bank">
						<div>
							<logic:present name="result">
								<p class="message success" id="messagep">
									<bean:write name="result" filter="true"/>
								</p>
							</logic:present>
							<html:form action="/changepassword">
								<div class="change_pass">
									<p>
										<label>Current Password:</label>
										<html:password property="currentPassword" style="width:200px;" />
									</p>
									<p>
										<label>New Password:</label>
										<html:password property="newPassword" styleId="newPassword" style="width:200px;" />
									</p>
									<p>
										<label>Confirm Password:</label>
										<html:password property="confirmPassword" styleId="confirmPassword" style="width:200px;" />
									</p>
									<p><label></label>
										<input type="button" value="Submit" class="btn_green" onclick="javaScript:submit1();" />
									</p>
									<html:hidden property="userId"></html:hidden>
									<html:hidden property="userrole" value="SuperAdmin"></html:hidden>
								</div>
							</html:form>
						</div>
					</div>
				</div>
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
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
</body>
</html>