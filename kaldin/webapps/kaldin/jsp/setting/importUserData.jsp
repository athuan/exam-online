<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Import Users - Kaldin Online Exam to Evaluate Knowledge</title>
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
					<li><a href="<%=request.getContextPath()%>/group.do" >User Groups</a></li>
					<li><a href="<%=request.getContextPath()%>/CreateUser.do">Add User</a></li>
					<li><a href="<%=request.getContextPath()%>/ViewUser.do">User List</a></li>
					<li><a href="<%=request.getContextPath()%>/importUser.do" class="active">Import Users</a></li>
				</ul>
				<div class="sidebar_note message note">
				<p> Rather than add users manually one at a time, you can add many users in a bulk import. To do this, you have your users data in a .CSV (comma separated values) or.TXT file or XLS file.</p>
				<p> Step1: Prepare the Users Data feed within the specific format. You can download the sample data feed format from here.</p>
				<p> Step2: Browse the users Data feed file by clicking on Choose file button provided here</p>
				<p> Step3: Select the delimiter if you are importing .TXT file or .CSV file or .XLS file and Click on import button.</p>
				<p> Step4: Map the fields and Import.</p>
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