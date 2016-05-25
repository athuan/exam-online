<%@page import="com.kaldin.questionbank.question.dto.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Import Questions - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'">Questions</a></li>
					<li ><a href="<%=request.getContextPath()%>/Subject.do">Question Category</a></li>
					<li><a href="<%=request.getContextPath()%>/Topic.do">Question Sub-Category</a></li>
					<li><a href="<%=request.getContextPath()%>/Level.do">Complexity</a></li>
					<li><a href="<%=request.getContextPath()%>/callqueimport.do" class="active">Import Questions</a></li>
				</ul>
				<div class="sidebar_note message note">
				<p>Step1: Prepare the Questions datafeed within the specific format, You can download the sample data feed file from here.</p>
				<p>Step2: Browse the Questions datafeed file by clicking on Choose file button provided here </p>
				<p>Step3: Select the delimiter if you are importing .TXT file or .CSV file, and ignore the delimiter part if you are importing via .XLS file format and Click on import button</p>
				<p>Step4: Map the fields and import the questions </p>	
				</div>
			</div>
			<div id="main">
				<div style="margin: 0px auto; text-align: center; width: 100%; height: 100%; font-size: 20px;margin-top: 100px;text-align: center;">
					<div>
						This feature is available for saas(On Premises) and Commercial versions.<br/>Please visit <a href="http://www.kaldin.com" target="_blank">Kaldin</a> for more details
					</div>
				</div>
			</div>
		</div>
	</div>
<img height="1" width="1" src='/log/hit.php?pageName=importq&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/feedback.jsp"%>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>