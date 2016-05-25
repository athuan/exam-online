<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Groups - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/group/group.js?dt=19aug2013"></script>
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
					<li><a href="<%=request.getContextPath()%>/group.do" class="active">User Groups</a></li>
					<li><a href="<%=request.getContextPath()%>/CreateUser.do">Add User</a></li>
					<li><a href="<%=request.getContextPath()%>/ViewUser.do">User List</a></li>
					<li><a href="<%=request.getContextPath()%>/importUser.do">Import Users</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">You may add new Groups to manage users for different Technologies, Departments and Categories Etc.,.</p></div>
			</div>
			<div id="main">
				<h3>User Groups</h3>
					<hr />
					
				<logic:present name="TopicMessage">
					<p class="message success">
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</p>
				</logic:present>
					<div class="table_top"><input type="button" value="Add New Group" class="btn_green_sml" onclick="showDialog();">
					</div>
				<logic:present name="groupList">

					<div id="dialog"></div>
					<table class="display" id="example">
						<thead>
							<tr>
								<th scope="col">Group Name</th>
								<th scope="col" align="center">Options</th>
							</tr>
						</thead>
						<logic:iterate id="showResult" name="groupList">
							<tr>
								<td width="80%">
								<span style="float:left;">
									<bean:write name="showResult" property="groupname" filter="true"  />
								</span>
								<span style="float:left;">
									&nbsp;<logic:notEqual name="showResult" property="userCount" value="0">
									(<bean:write name="showResult" property="userCount" filter="true" /> 
									<logic:notEqual name="showResult" property="userCount" value="1">users</logic:notEqual><logic:equal name="showResult" property="userCount" value="1">user</logic:equal>)
									</logic:notEqual>
								</span>
								</td>
								<td width="10%" align="center"><a href="#"
									onclick="showEditDialog(${showResult.groupid},'<bean:write name="showResult" property="groupname" filter="true"  />');">
										<img src="<%=request.getContextPath()%>/images/edit.png"
										title="Edit">
								</a>&nbsp;<a href="#" class='basicDelete'
									onclick="return doLevelDelete(${showResult.groupid});"> <img
										src="<%=request.getContextPath()%>/images/delete.png"
										title="Delete">
								</a></td>
							</tr>
						</logic:iterate>
					</table>
					
					<div id="basic-modal-content">
						<div align="center">
							<table>
								<logic:present name="groupList">
									<html:form action="group">
										<html:hidden property="operation"></html:hidden>
										<tr>
											<td><html:hidden property="groupid" /></td>
										</tr>
										<tr>
											<td>Group:</td>
											<td><html:text property="groupname" styleId="groupname"></html:text>
											</td>
											<td><html:hidden property="startPage" value="1"></html:hidden></td>
										</tr>
										<tr>
											<td colspan="2">
												<center>
													<html:submit onclick="doSubmit();return false;">Ok</html:submit>
												</center>
											</td>
										</tr>
									</html:form>
								</logic:present>
							</table>
						</div>
					</div>
				</logic:present>
			</div>
		</div>
	</div>
	<script type="text/javascript" charset="utf-8">

			/* Define two custom functions (asc and desc) for string sorting */
			jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
				return ((x < y) ? -1 : ((x > y) ?  1 : 0));
			};
			
			jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
				return ((x < y) ?  1 : ((x > y) ? -1 : 0));
			};
			
			$(document).ready(function() {
				/* Build the DataTable with third column using our custom sort functions */
				$('#example').dataTable( {
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 1 ] }
					]
				} );

				Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
				
			} );
		</script>
<img height="1" width="1" src='/log/hit.php?pageName=group&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />		
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>