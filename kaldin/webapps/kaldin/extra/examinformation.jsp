<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><logic:present name="examdetails">${examdetails.examName }</logic:present></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<body>
<div id="wrapper">
	<%@ include file="/jsp/common/header.jsp"%>
	<div id="content">
		<div id="sidebar">
		</div>
		<div id="main">
			<logic:present name="examdetails">
				<h3>${examdetails.examName }</h3>
				<hr />
					<div id="test">
						${examdetails.examDescription }
					</div>
				<br/>
				<br/>
					<div>
						<a href="<%=request.getContextPath()%>/practice-exam/${examdetails.examUrl }" class="btn_green_sml">Browse Question</a>
					</div>
				</logic:present>
		</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
 </div>
 <%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>