<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.questionbank.level.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/questionbank/level.js?dt=19aug2013"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<!-- header end here -->
		<!-- CONTENT -->
			<div id="content">
				<div id="sidebar">
					<ul class="sidebar_nav">
						<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'"><bean:message key="jsp.questions.tab.sidemenu.link.questions"/></a></li>		
						<li><a href="<%=request.getContextPath()%>/Subject.do"><bean:message key="jsp.questions.tab.sidemenu.link.category"/></a></li>
						<li><a href="<%=request.getContextPath()%>/Topic.do"><bean:message key="jsp.questions.tab.sidemenu.link.subcategory"/></a></li>
						<li><a href="<%=request.getContextPath()%>/Level.do" class="active"><bean:message key="jsp.questions.tab.sidemenu.link.complexity"/></a></li>
						<li><a href="<%=request.getContextPath()%>/callqueimport.do"><bean:message key="jsp.questions.tab.sidemenu.link.importquest"/></a></li>	
					</ul>
					<div class="sidebar_note message note"><p><bean:message key="jsp.questionbank.level.page.sidemenu.note1"/></p>
				<p><bean:message key="jsp.questionbank.level.page.sidemenu.note2"/></p>
				</div>
				</div>
			<div id="main">
				<h3><bean:message key="jsp.questionbank.level.page.header"/></h3>
					<hr />
				<logic:present name="TopicMessage">
					<p class="message success">
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</p>
				</logic:present>
				<logic:present name="Level">
					<div class="table_top"><input type="button" value='<bean:message key="jsp.questionbank.level.page.addcomplexitybtn"/>' class="btn_green_sml" onclick="showDialog();"></div>
					<div id="dialog"></div>
					<table class="display" id="example">
						<thead>
							<tr>
								<th scope="col"><bean:message key="jsp.questionbank.level.page.table.complexity"/></th>
								<th scope="col" align="center"><bean:message key="jsp.questionbank.level.page.table.options"/></th>
							</tr>
						</thead>
						<logic:iterate id="showResult" name="Level">
							<tr>

								<td width="80%"><bean:write name="showResult" property="level" filter="true"/>&nbsp;
								<logic:iterate id='levelResult' name="levelCntList">
									<logic:equal name="levelResult" property="id"
										value="${showResult.levelid}">
										&nbsp;<span class="highlight">(<bean:write name="levelResult"	property="count" filter="true" /> <logic:equal name="levelResult"	property="count" value="1" >question</logic:equal><logic:notEqual name="levelResult" property="count" value="1" >questions</logic:notEqual>)</span>
									</logic:equal>
								</logic:iterate>
								</td>

								<td width="10%" align="center"><a href="#"
									onclick="showEditDialog(${showResult.levelid},'<bean:write name="showResult" property="level" filter="true"/>');">
										<img src="<%=request.getContextPath()%>/images/edit.png"
										title='<bean:message key="jsp.questionbank.level.page.tooltip.edit"/>'>
								</a>&nbsp;<a href="#" class='basicDelete'
									onclick="return doLevelDelete(${showResult.levelid});"> <img
										src="<%=request.getContextPath()%>/images/delete.png"
										title='<bean:message key="jsp.questionbank.level.page.tooltip.delete"/>'>
								</a></td>
							</tr>
						</logic:iterate>
					</table>
					
					<div id="basic-modal-content">
						<div align="center">
							<table>
								<logic:present name="Level">
									<html:form action="Level" acceptCharset="utf-8">
										<html:hidden property="operation"></html:hidden>
										<tr>
											<td><html:hidden property="levelid" /></td>
										</tr>
										<tr>
											<td><bean:message key="jsp.questionbank.level.page.complexity"/></td>
											<td><html:text property="level" styleId="levelName" size="30"></html:text>
											</td>
											<td><html:hidden property="startPage" value="1"></html:hidden></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
													<html:submit onclick="doSubmit();return false;"><bean:message key="jsp.questionbank.level.page.savebtn"/></html:submit>
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
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>