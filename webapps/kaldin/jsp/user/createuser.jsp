<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Add New Users - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript' src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
	
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });      
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Users");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/group.do">User Groups</a></li>
					<li><a href="<%=request.getContextPath()%>/CreateUser.do" class="active">Add User</a></li>
					<li><a href="<%=request.getContextPath()%>/ViewUser.do">User List</a></li>
					<li><a href="<%=request.getContextPath()%>/importUser.do">Import Users</a></li>
				</ul>
				<div class="sidebar_note message note"><p>You can add multiple users in the group which will be used while scheduling the exam</p></div>
			</div>
		<div id="main">
				<h3>Add New Users</h3>
				<hr />
			<p class="message note">To Add multiple users please separate email ids by comma ( , ) OR have one email id in one line. </p>


			<html:form action="/CreateUsr">
				<div class="new_user">
					<logic:present name="msg">
						<div id="messagep">
								<p class="message success">
									<bean:write name="msg" filter="true" />
								</p>
						</div>
					</logic:present>
					<logic:present name="invalied">
						<div id="messagep">
								<p class="message info">
									<bean:write name="invalied" filter="true" />
								</p>
						</div>
					</logic:present>
					<logic:present name="invalidEmails">
						<div id="messagep">
								<p class="message invalid">
									<bean:write name="invalidEmails" filter="true" />
								</p>
						</div>
					</logic:present>
					<p>
						<label>Groups:</label>
						<select name="groupid" id="groupid" style="width: 442px;">
								<option value="0">Select Group</option>
								<logic:iterate id="showResult" name="groupList">
								 	<logic:equal name='selectedgroup' value="${showResult.groupid}">
                            		    <option value='${showResult.groupid}' selected="selected"><bean:write name="showResult" property="groupname" filter="true"  /></option>
                            		</logic:equal>
                            		<logic:notEqual name='selectedgroup' value="${showResult.groupid}">
                            		    <option value='${showResult.groupid}'><bean:write name="showResult" property="groupname" filter="true"  /></option>
                            		</logic:notEqual>
								</logic:iterate>
						</select>
						<a href="<%=request.getContextPath()%>/group.do" class="btn_green_sml">Add Group</a>
					</p>
					<p>
						<label style="vertical-align: top">Add emails:</label>
						<html:textarea property="email" styleId="email" rows="10" cols="50"></html:textarea>
					</p>
					
					
					
					<!--<tr>
			<td><label>	Password:</label></td>
			<td><html:password property="password" size="35"></html:password></td>
		</tr>
		-->
		
					<p>
					<label></label>
						<button class="btn_green" onclick="javaScript:echeck(); return false;">Add Users</button>
					</p>
				</div>
				<!--		<p>-->
				<!--		<label>	Status:</label>-->
				<!--			<html:select property="status">-->
				<!--				<html:option value="1">Activated</html:option>-->
				<!--				<html:option value="0">Deactivated</html:option>-->
				<!--			</html:select>-->
				<!--		</p>-->
				<html:hidden property="hiddenEmail" styleId="hiddenEmail"  value=""/>
			</html:form>
		</div>
	</div>
</div>
<img height="1" width="1" src='/log/hit.php?pageName=adduser&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
