<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/questionbank/Technology.js"></script>
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
					<!-- <li><a href="<%=request.getContextPath()%>/PaymentAction.do">More
							Question Papers</a></li>
					<li><a href="<%=request.getContextPath()%>/callxlsimport.do">Import Candidate Data</a></li>
					<li><a href="<%=request.getContextPath()%>/callqueimport.do">Import
							Question Data</a></li> -->
					<li><a
						href="<%=request.getContextPath()%>/callAdminProfile.do">My
							Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/Technology.do"
						class="active">Technology</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User
							Profile Required</a></li>
					<li><a
						href="<%=request.getContextPath()%>/calladminchangepass.do">Change
							Password</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
			</div>
		<div id="main">
			<h3>Technology Details</h3>
					<hr />
			
			<logic:present name="TopicMessage">
				<p class="message info">
					<b><bean:write name="TopicMessage" filter="true" /></b>
				</p>
			</logic:present>
			<div id='basic-modal'>
			<div class="table_top"><input type="button" value="Add technology" class="btn_green_sml" onclick="showDialog();">
			</div>
				<logic:present name="Technology">
					<div id="dialog"></div>

					<table cellpadding="0" cellspacing="0" border="0" class="display"
						id="example">
						<thead>
							<tr>
								<th class="col">ID</th>
								<th class="col">Technology</th>
								<th class="col">Edit</th>
								<th class="col">Delete</th>
							</tr>
						</thead>
						<tbody>
							<%
								int technoCounter = 1;
							%>
							<logic:iterate id="showResult" name="Technology">

								<tr>
									<td width="5%"><%=technoCounter++%></td>
									<td width="75%"><bean:write name="showResult" property="technology" filter="true" /></td>
									<td width="10%"><a href="#"
										onclick="showEditDialog(${showResult.ctechId},'${showResult.technology}');">
											<img src="<%=request.getContextPath()%>/images/edit.png"
											title="Edit">
									</a></td>
									<td width="10%"><a href="#" class='basicDelete'
										onclick="return doTechnologyDelete(${showResult.ctechId},'${showResult.technology}');">
											<img src="<%=request.getContextPath()%>/images/delete.png"
											title="Delete">
									</a></td>
								</tr>
							</logic:iterate>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
					<div id="basic-modal-content">
						<br>
						<div align="center">
							<table>
								<logic:present name="Technology">
									<html:form action="/Technology">
										<html:hidden property="operation"></html:hidden>
										<tr>
											<td><html:hidden property="ctechId" /></td>
										</tr>
										<tr>
											<td>Technology:</td>
											<td><html:text property="technology"
													styleId="technologyName" size="30"></html:text></td>
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
			</div></div></div>
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
						{ "sType": 'string-case', "aTargets": [ 2 ] }
					]
				} );
			} );
		</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>