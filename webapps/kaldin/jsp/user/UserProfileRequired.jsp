<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>User Profile - Kaldin - Online Exam To Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
</head>
<body>
	<%
		request.setAttribute("menu", "Setting");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/emailtemplate.do">Email Templates</a></li>
					<li><a href="<%=request.getContextPath()%>/settings.do">Show Result</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do" class="active">User Profile Required</a></li>
					<li><a href="<%=request.getContextPath()%>/customizeui.do">Customize UI</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Ask your candidates to fill his profile information by setting the status of User Profile Required to Yes.</p></div>
			</div>
			<div id="main">
			<h3>User Profile Required</h3>
			<hr />
				<div>
					<p class="message info">
						Change to "Yes" if you want to make Candidate to fill his
						Profile before giving the Exam.
					</p>
					<logic:present name="msg">
						<p class="message success" id="messagep">
							<bean:write name="msg" filter="true"/>
						</p>
					</logic:present>
					<html:form action="/UserProfileRequired">
						<div class="usr_pro_req">
							<p>
								<label>User Profile Required:</label>
								<html:select property="isprofile">
										<html:option value="1">Yes</html:option>
										<html:option value="0">No</html:option>
									</html:select>
									<button class="btn_green" onclick="return doSubmit();">Submit</button>
							</p>
						</div>
							
					</html:form>
				</div>
			</div>
		</div></div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
