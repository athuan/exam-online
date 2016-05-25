<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.IOUtils"%>

<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Kaldin | Open Source Web-based online examination software</title>
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon">
<link href="<%=request.getContextPath()%>/css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/feedback/feedback.css" type="text/css" media="screen">
<meta charset=utf-8>
<style type="text/css">
.candidateLogin {
	margin: 50px auto;
	width: 440px;
	float: right;
}

.adminLogin { /*float: right;
    margin: 40px auto;*/
	padding-right: 20px;
}

.admin_login_box {
	background: none repeat scroll 0 0 #FDF5E6;
	border: 10px solid #D6C69E;
	display: inline-block;
	padding: 10px;
}

.admin_login_box h2 {
	-moz-border-radius: 5px 5px 5px 5px;
	background: none repeat scroll 0 0 #D6C69E;
	font-size: 20px;
	font-weight: bold;
	margin: 0 0 10px;
	padding: 5px 0;
	text-align: center;
	text-transform: capitalize;
}

.admin_login_box label {
	width: 30%;
	float: left;
}

.login_box .forgot_pass {
	background: #FFF no-repeat scroll left center transparent;
	display: inline;
	float: left;
	font-weight: bold;
	margin: 8px 34px 0 95px;
	text-transform: capitalize;
	width: auto;
	padding: 0 0 0 0px;
}

.headertitle {
	-moz-border-radius: 5px 5px 0 0;
	background: none repeat scroll 0 0 #D6C69E;
	font-size: 16px;
	font-weight: bold;
	padding: 10px 0;
	text-align: center;
	text-transform: capitalize;
	width: 125px;
	float: left;
	margin-left: 5px;
}

.unselected {
	background: none repeat scroll 0 0 #FFF;
}

table {
	border: 0px none;
}

table td {
	border: 0px none;
}

.admin_login_box .forgot_pass {
	background: #fff no-repeat scroll left center transparent;
	display: inline;
	float: right;
	font-weight: bold;
	padding: 35px 30px 4px;
	text-transform: capitalize;
	width: auto;
}

.admin_login_buttons {
	padding-right: 75px;
	padding-top: 10px;
}
</style>

</head>

<BODY>

	<div id="dialog" align="center" style="display: none;">
		<img alt="" src="<%=request.getContextPath()%>/images/loging.gif">
	</div>
	<div id="wrapper">
		<div id="header">
			<h1>
				<img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" />
			</h1>
		</div>

		<div id="content">
			<div class="container">

				<br> <font size="+3" color="red"><br>Error Occured</font> <br>
				<br>
				<br> <font size="+1" color="blue"><br>
					<p>
						Message
						<jsp:expression>exception.getMessage()</jsp:expression>
						<img src="http://www.kaldin.com/support/reportError.jsp?<%=exception.getMessage()%>" width="0" height="0" />
						<%
							String databaseexists = request.getParameter("rad1");
							//out.println(databaseexists);
						%>
					
				</font><br>
				<br> <br> 
				
				<button type="button" name="back" onclick="history.back()">back</button>
			</div>
		</div>
</body>
</html>
