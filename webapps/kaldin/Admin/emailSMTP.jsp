<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Admin - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script src="js/jquery-1.4.2.min.js?dt=19aug2013" type="text/javascript"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="middle_section">
				<div class="box_outer">
					<html:form action="/emailSetting">
						<html:hidden property="action"></html:hidden>
						<table style="width: 50%;float: none;" class="display">
							<tr>
								<th colspan="2" style="text-align: center;">Email Settings</th>
							</tr>
							<tr>
								<td>Host:</td>
								<td><html:text property="host" /></td>
							</tr>
							
							<tr>
								<td>Mail From:</td>
								<td><html:text property="mailFrom" /></td>
							</tr>
							
							<tr>
								<td>Port:</td>
								<td><html:text property="port" /></td>
							</tr>
							
							<tr>
								<td>User Name:</td>
								<td><html:text property="userName" /></td>
							</tr>
							
							<tr>
								<td>Password:</td>
								<td><html:password property="password" /></td>
							</tr>
							
							<tr>
								<td>Auth:</td>
								<td>
									<html:select property="auth">
										<html:option value='1'>True</html:option>
										<html:option value='0'>False</html:option>
									</html:select>
												
								</td>
							</tr>
							
							<tr>
								<td colspan="2" style="text-align: center;"><input type="submit" value="Submit" class="btn_green"></td>
							</tr>
							
						</table>
					</html:form>
				</div>
			</div>
		</div>
	</div>
	<!--MAIN ENDS HERE-->
	<%@ include file="/jsp/common/feedback.jsp" %>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
</body>
</html>
