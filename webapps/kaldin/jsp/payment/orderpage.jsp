<%@ page import="java.util.TimeZone" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Buy Question Papers - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/creditcard.js?dt=19aug2013'></script>
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
					<!-- <li><a href="<%=request.getContextPath()%>/PaymentAction.do"
						class="active">More Question Papers</a></li>
					<!-- <li><a href="<%=request.getContextPath()%>/callxlsimport.do">Import Candidate Data</a></li> -->
					<li><a href="<%=request.getContextPath()%>/callqueimport.do">Import
							Question Data</a></li>
					<li><a href="<%=request.getContextPath()%>/Technology.do">Technology</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User
							Profile Required</a></li>
					<li><a
						href="<%=request.getContextPath()%>/calladminchangepass.do">Change
							Password</a></li>
					<li><a
						href="<%=request.getContextPath()%>/callAdminProfile.do">My
							Profile</a></li>
				</ul>
			</div>
			<div id="main">
				<html:form action="/PaymentAction">
					<html:hidden property="operation" value=""></html:hidden>
					<table align="center">
						<tr>
							<td><h3>More Question Papers</h3></td>
						</tr>
						<tr>
							<td align="center">
								<div>
									<h3>5 Aptitude Question Papers</h3>
								</div>
							</td>
							<td><button class="btn_green"
									onclick="return doSubmit('paymentpage');">
									<span>Add Now</span>
								</button></td>
						</tr>
						<tr>
							<td align="center">
								<div>
									<h3>5 Logical Question Papers</h3>
								</div>
							</td>
							<td><button class="btn_green"
									onclick="return doSubmit('paymentpage');">
									<span>Add Now</span>
								</button></td>
						</tr>
					</table>
				</html:form>
			</div>
		</div>
		<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>