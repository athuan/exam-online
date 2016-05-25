<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Administrator Login - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="login">
				<center>
					<p class="message note">
						<logic:present name="message">
							<bean:write name="message" filter="true"/>
						</logic:present>
					</p>
					<a href="<%=request.getContextPath()%>/admin.do" class="btn_green">Back to Login</a>
				</center>
			</div>
		</div>
	<%@ include file="/jsp/common/footer.jsp"%>
	<!--FOOTER ENDS HERE  -->
	</div>
<%@ include file="/jsp/common/feedback.jsp"%>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->	
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>