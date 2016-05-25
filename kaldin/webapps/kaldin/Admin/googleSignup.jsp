<%@page import="com.kaldin.user.googleLogin.GoogleinfoForm" %>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Registration - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script type="text/javascript">
	blank = function() {
		var frm = document.forms[0];
		frm.submit();
	}
</script>
</head>
<body>
	<%
		session.setAttribute("Admin", "SignUp");
	%>

	<!--     HEADER -->
	<!--  -->
	<%@ include file="/jsp/common/header.jsp"%>
	<!--     header end here -->

	<div id="content">
		<div id="regilogin">
			<%
				GoogleinfoForm gform = (GoogleinfoForm) request.getSession()
						.getAttribute("googleInfo");
			%>
			<html:form action="/register">
				<html:text property="firstName" value="<%=gform.getFristName()%>" />
				<html:hidden property="companyName" value="Kaldin" />
				<html:hidden property="contactNumber" value="0000000000" />
				<html:hidden property="userName" value="<%=gform.getEmail()%>"></html:hidden>
				<html:hidden property="lastName" value="<%=gform.getLastName()%>"></html:hidden>
				<html:hidden property="role" value="0"></html:hidden>
				<html:hidden property="email" value="<%=gform.getEmail()%>"></html:hidden>
				<html:hidden property="operation" value="GRegister"></html:hidden>
			</html:form>
		</div>
	</div>
	<div id="footer">
		<%@ include file="/jsp/common/footer.jsp"%></div>
	<script>
		blank();
	</script>
</body>
</html>