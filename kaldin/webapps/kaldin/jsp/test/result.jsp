<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Thanks - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
</head>

<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/userhome.do">Scheduled Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/loadtest.do">Given Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/callCandidateProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calluserchangepass.do">Change Password</a></li>
					</ul>
				</div>
			<div id="main">
				<logic:present name="Result">
					<h3><bean:message key="jsp.exam.completion.message"/></h3>
				</logic:present>
			</div>
		</div>
		<script>
			history.go(1);
		</script>
	</div>
<img height="1" width="1" src='/log/hit.php?pageName=thanks&sessionId=<%=session.getId()%>&uid=c-<%=session.getAttribute("UserId")%>&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
