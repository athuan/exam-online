<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>

<%@page import="java.util.TimeZone"%><html lang="en">
<head>
<meta charset=utf-8>
<title>Get Email for <%=request.getAttribute("examname")%> - Kaldin | Open Source Web-based online examination software</title>
<meta name="description" content="<%=request.getAttribute("examDesc")%>" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<% 
//Set local date in session
session.removeAttribute("localDate");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
sdf.setTimeZone(TimeZone.getDefault());
session.setAttribute("localDate", sdf.format(new Date()));
System.out.println("d2 "+sdf.format(new Date()));
%>
<body>
	<div id="wrapper">
		<div id="header">
			<logic:notPresent name="logo">
		    <h1><a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/uploads/logos/logo-blue.png" alt="kaldin" /></a></h1>
		    </logic:notPresent>
		    <logic:present name="logo">
		    <h1><a href="<%=request.getContextPath()%>/"><img id="clogo" src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></a></h1>
		    </logic:present>
		</div>
		<div id="content">
			<div id="sidebar">
	    	</div>
			<div id="main">
				<logic:present name="message">
					<h3>Status for Exam - <%=request.getAttribute("examname")%></h3>
					<hr />
					<p class="message invalid"><bean:write name="message" /></p>
				</logic:present>
				<logic:notPresent name="message">
					<h3>Enter Email Id to continue the Exam - <%=request.getAttribute("examname")%></h3>
					<hr />
					<p class="message note">You will get your exam result on this email</p>
					<div id="test">
						<html:form action="/starttest">
							<p><label>Name:</label><html:select property="title">
														<html:option value="Mr.">Mr.</html:option>
														<html:option value="Mrs.">Mrs.</html:option>
														<html:option value="Miss.">Miss.</html:option>
													</html:select>
								<html:text property="firstName" placeholder="Enter first name"/>
								<html:text property="lastName" placeholder="Enter last name"/>
							</p>
							<p><label>Email:</label>
								<html:text property="email" placeholder="Enter email"/>
								<html:hidden property="testid" value="${testid}"/><html:hidden property="examid" value="${examid}"/>
								<label></label><button class="btn_green_sml" onclick="return doSubmit();" style="cursor: pointer;">Start</button>
							</p>
						</html:form>
					</div>
				</logic:notPresent>
			</div>
		</div>
	</div>
<script type="text/javascript">
function validEmail(object) {
	var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if (object.value.match(emailRegEx)) {
		return false;
	} else {
		return true;
	}
}
function doSubmit() {
	var frm = document.forms["emailForm"];
	var firstname = document.emailForm.firstName.value;
	if (firstname == "") {
		alert("Please enter first name");
		document.emailForm.firstName.focus();
		return false;
	}
	var lastname = document.emailForm.lastName.value;
	if (lastname == "") {
		alert("Please enter last name");
		document.emailForm.lastName.focus();
		return false;
	}
	var email = document.emailForm.email.value;
	if (email == "") {
		alert("Please enter email");
		document.emailForm.email.focus();
		return false;
	}
	if (validEmail(document.emailForm.email)) {
		alert("Please Enter Valid email");
		document.emailForm.email.focus();
		return false;
	} else {
		frm.submit();
	}
}
</script>
<%@ include file="/jsp/common/feedback.jsp" %>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>