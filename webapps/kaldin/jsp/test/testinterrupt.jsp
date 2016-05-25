<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>

<body>
	<div id="wrapper">
		<div id="header">
    	<h1><a href="<%=request.getContextPath()%>/userhome.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
		</div>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav"></ul>
			</div>
			<div id="main">
				<h3><a href="<%=request.getContextPath()%>/executetest.do?testid=<%=(String) request.getSession().getAttribute("TestId")%>&examid=<%=(String) request.getSession().getAttribute("ExamId")%>" class="btn_green">Resume Exam</a></h3>
			</div>
		</div>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
