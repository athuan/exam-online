<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Thanks - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>

<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
				</ul>
				</div>
			<div id="main">
				<logic:present name="Result">
					<h3><bean:message key="jsp.exam.completion.message"/></h3>
					<h3>Result has been sent to your email address</h3>
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
<% session.invalidate(); %>
