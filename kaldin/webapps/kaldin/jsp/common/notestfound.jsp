<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>No Exam Found - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<body>
	<div id="wrapper">
		<div id="header">
    		<h1><a href="<%=request.getContextPath()%>/userhome.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>		
		</div>
		<div id="content">
			<div id="sidebar">
			</div>
			<div id="main">
				<div class="message invalid">
					<p>The Exam you requested is not found please try other Exam.</p>
				</div>
				<a href="login.do" class="btn_green_sml">Back to Login</a>
			</div>
		</div>
	</div>
<img height="1" width="1" src='/log/hit.php?pageName=noexam&sessionId=<%=session.getId()%>&uid=c-<%=session.getAttribute("UserId")%>&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>