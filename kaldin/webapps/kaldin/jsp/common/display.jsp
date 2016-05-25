<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>

<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>

	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<!-- CONTENT -->
		<div id="content">
			<div id="main">
			<div id='basic-modal'>
				<logic:present name="TopicMessage">
					<center>
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</center>
				</logic:present>

				<logic:present name="ScheduleTestMessage">
					<center>
						<b><bean:write name="ScheduleTestMessage" filter="true" /></b>
					</center>
				</logic:present>

				<logic:present name="success">
					<center>
						<b><bean:write name="success" filter="true"></bean:write></b>
					</center>
				</logic:present>

				<logic:present name="error">
					<center>
						<b><bean:write name="error" filter="true"></bean:write></b>
					</center>
				</logic:present>

				<logic:present name="count">
					<center>
						<b><bean:write name="count" filter="true"></bean:write> records imported</b>
					</center>
				</logic:present>
			</div>
			<br>
			<center>
				<a href="<%=request.getContextPath()%>/sitemap.do"><b><u>Go
							to home</u></b></a>
			</center></div>
		</div>
		<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>	
</body>
</html>