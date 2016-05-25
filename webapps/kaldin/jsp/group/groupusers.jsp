<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Group wise Users - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/group/group.js?dt=19aug2013"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "Users");
	%>
	<div id="wrapper">
		<!-- HEADER -->
		<%@ include file="/jsp/common/header.jsp"%>
		<!-- header end here -->
		<!-- CONTENT -->
		<div id="content">
			<div id="right_section">

				<h3>Users</h3>
				<div id="right_nav">
					<ul>
						<li><a href="<%=request.getContextPath()%>/CreateUser.do">Create User</a></li>
						<li><a href="<%=request.getContextPath()%>/ViewUser.do">User List</a></li>
						<li><a href="<%=request.getContextPath()%>/group.do">User Groups</a></li>
						<li><a href="<%=request.getContextPath()%>/groupuser.do" class="active">Group wise Users</a></li>
					</ul>
				</div>
				<!-- RIGHT NAV HERE -->
			</div>
			<!--RIGHT SECTION ENDS HERE-->
			<div id="left_section">
				<h3>Group wise Users</h3>
				<logic:present name="TopicMessage">
					<p class="message success">
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</p>
				</logic:present>
					<html:form action="/groupuser">
					<table>
							<tr>
								<td>Groups:</td>
								<td>
									<select name="groupid" id="groupid" onchange="return getUsers();">
										<option value="0">Select Group</option>
										<logic:iterate id="showResult" name="groupList">
											<option value='${showResult.groupid}'>${showResult.groupname}</option>
										</logic:iterate>
									</select>
								</td>
							</tr>
					</table>
					<html:hidden property="operation" />
					</html:form>
					<logic:present name="groupuserList">
					<div id="groupusers">
						<table>
							<tr>
								<td>ID</td>
								<td>email</td>
							</tr>
						<logic:iterate id="groupuserList" name="groupuserList">
							
							<tr>
								<td>${groupuserList.userid}</td>
								<td>${groupuserList.email}</td>
							</tr>
					
						</logic:iterate>
						</table>
					</div>
					</logic:present>
			</div>
		</div>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>