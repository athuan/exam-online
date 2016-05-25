<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Email Template - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor/nicEdit.js?dt=19aug2013"></script>
<script type="text/javascript">
$(document).ready(function() {
	Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
} );
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "emailtemp");
	%>
	<div id="wrapper">
	<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
			<%@ include file="/jsp/common/header.jsp"%>
	<%}else{ %>
		<%@ include file="/jsp/common/adminHeader.jsp"%>
	<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/emailtemplate.do">Listing</a></li>
<%-- 				<li><a href="<%=request.getContextPath()%>/newemailtemplate.do" class="active">Add New</a></li> --%>
				</ul>
				<div class="sidebar_note">
					<p class="message note">Tokens enclosed with $$ will get replaced with real values while sending email.</p>
				</div>
			</div>
			<div id="main">
				<h3>Email Template: ${edto.mailtype}</h3>
				<hr />
				<html:form action="/emailtemplate">
				<div class="email_template">
					<p>
						<label style="width:auto;">Subject:</label>
						<html:text property="mailsubject" value="${edto.mailsubject}" size="60"/>
					</p>
					<p>
						<label style="width:auto;vertical-align: top;">Message:</label>
						<html:textarea property="mailcontent" styleId="mailcontent" cols="80" rows="13" value="${edto.mailcontent}" style="width:589px;"></html:textarea>
						<div style="width: 589px; border-bottom: 1px solid #4D5B76;background: #6C7A95;position: relative;padding: 10px 0;font-size: 12px;color: white;bottom: 0;text-align: center;clear: both; margin-top: -10px;">
					&copy; Copyright 2014&nbsp;<a href="http://www.kaldin.com" target="_blank" style="color: white;">kaldin.com</a></div>
					</p>
					<p>
						<input type="submit" value="Save Email Template" class="btn_green" />
					</p>
				</div>
				<html:hidden property="operation" value="${operation}"></html:hidden>
				<html:hidden property="id" value="${edto.id}"/>
				<html:hidden property="startPage" value="1"></html:hidden>
				</html:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	new nicEditor().panelInstance('mailcontent');
</script>	
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
</body>
</html>