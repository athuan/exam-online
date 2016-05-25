<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Admin - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "SuHome");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="middle_section">
				<div class="box_outer">
					<div class="box">
						<h3>Admin Settings</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/activateAdmin.do?action=activation">Activate Admin</a></li>
							<li><a href="<%=request.getContextPath()%>/activateAdmin.do?action=deactivation">Deactivate Admin</a></li>
							<li><a href="<%=request.getContextPath()%>/emailSetting.do">SMTP</a></li>
							<li><a href="<%=request.getContextPath()%>/university.do">University</a></li>
						</ul>
					</div>
					<div class="box">
						<h3>Reports</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/callAdminWiseQuestion.do">Admin	Wise Questions</a></li>
							<li><a href="<%=request.getContextPath()%>/callAdminWiseTest.do">Admin Wise Tests</a></li>
							<li><a href="<%=request.getContextPath()%>/callCompanyWiseUser.do">Company Wise Users</a></li>
							<li><a href="<%=request.getContextPath()%>/feedbackReport.do">Feedback Report</a></li>
						</ul>
					</div>
					<div class="box">
						<h3>Email Templates</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/emailtemplate.do">Listing</a></li>
<%-- 							<li><a href="<%=request.getContextPath()%>/newemailtemplate.do">Add New</a></li> --%>
						</ul>
					</div>
					<div class="box">
						<h3>Profile</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
							<li><a href="<%=request.getContextPath()%>/superadminchangepass.do">Change Password</a></li>
						</ul>
					</div>
					<div class="box">
						<h3>Statistics</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/statistics.do">Exam Statistics</a></li>
						</ul>
					</div>
					<div class="box">
						<h3>Plan</h3>
						<ul>
							<li><a href="<%=request.getContextPath()%>/plans.do" class="active">Plan List</a></li>
							<li><a href="<%=request.getContextPath()%>/newplan.do">Add New Plan</a></li>
							<li><a href="<%=request.getContextPath()%>/assignplan.do">Assign Plan</a></li>
							<li><a href="<%=request.getContextPath()%>/plancontacts.do">Plan Change Request</a></li>
							<li><a href="<%=request.getContextPath()%>/viewtransactions.do">Transaction History</a></li>
							<li><a href="<%=request.getContextPath()%>/managefeatures.do">Manage Features</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--MAIN ENDS HERE-->
	<%@ include file="/jsp/common/feedback.jsp" %>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
</body>
</html>
