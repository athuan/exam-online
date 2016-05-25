<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Admin Activation - Kaldin Online Exam to Evaluate
	Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {		
		  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	});	
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div style="margin: 50px auto; width: 500px;">
				<p class="message success">
					<logic:present name="AdminActivationMessage">
						<bean:write name="AdminActivationMessage" filter="true" />
					</logic:present>
				</p>
				<a href='http://www.kaldin.com<%=request.getContextPath()%>'>Click Here</a>
			</div>
		</div>
	<%@ include file="/jsp/common/footer.jsp"%>
	</div>
	<img height="1" width="1"
		src='/log/hit.php?pageName=activate&sessionId=<%=session.getId()%>&uid=0&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>