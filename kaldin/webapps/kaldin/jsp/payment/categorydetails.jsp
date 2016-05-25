<%@page import="java.util.TimeZone"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Buy Questions - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/creditcard.js?dt=19aug2013'></script>
<script type="text/javascript">
	function doSubmit(operationType) {
		frm = document.forms[0];
		frm.operation.value = operationType;
		frm.submit();
	}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calladminchangepass.do">Change Password</a></li>
					<li><a href="<%=request.getContextPath()%>/settings.do" >Setting</a></li>
					<li><a href="<%=request.getContextPath()%>/emailSetting.do">SMTP</a></li>
					<li><a href="<%=request.getContextPath()%>/PaymentAction.do" class="active">Payment</a></li>
				</ul>
			</div>
			<div id="main">
				<logic:present name='subjectList'>
					<html:form action="/PaymentAction">
						<html:hidden property="operation" value="cartdetails"></html:hidden>	
					<div style="overflow: auto; height: 450px;">
					<table class="display" style="width: 95%">
						<tr>
							<th>&nbsp;</th>
							<th>Category Name</th>
							<th>Total Question</th>
							<th>Count</th>
						</tr>
						
						<logic:iterate id='subjectList' name='subjectList'>
							<tr>
								<td><input type="checkbox" name="${subjectList.id}"></td>
								<td>${subjectList.name}</td>
								<td>${subjectList.count}</td>
								<td><input type="text" name="txt${subjectList.id}"></td>
							</tr>
						</logic:iterate>
						
					</table>
					</div>
					<div style="text-align: center;">
					<button class="btn_green" type="submit" style="text-align: center;">Add</button>
					</div>
				</html:form>
				</logic:present>
			</div>
		</div>
		
	</div>
	<img height="1" width="1" src='/log/hit.php?pageName=mypro&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />
<script type="text/javascript">
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>