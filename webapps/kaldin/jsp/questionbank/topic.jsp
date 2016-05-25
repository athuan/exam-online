<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.questionbank.topic.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/questionbank/topic.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script type="text/javascript">
function addSubCategory(){
	showDialog('add');
	var frm=document.forms[0];
	//var frm1=document.forms[1];
	frm.operation.value="add";
	frm.topicName.value="";
	document.getElementById("category").style.display = '';
}
function showDialog(opr) {	
	var frm=document.forms[0];
	frm.operation.value=opr;
	document.getElementById("dialog").style.display='';
	document.getElementById("add_subcategory").style.display='none';
	
}
function cancelAddOpr(){
	var frm=document.forms[0];
	frm.operation.value="";
	document.getElementById("dialog").style.display='none';
	document.getElementById("add_subcategory").style.display='';
}
function submitSearch(){
	var keyword = document.getElementById("searchtext").value;
	var frm = document.forms[0];
	frm.searchKeyword.value = keyword;
	frm.operation.value="search";
	frm.submit();
}
$(document).ready(function() { 
	$("#subjectname").select2({
		placeholder: "",
		allowClear: true
	});
});
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
	<%
		request.setAttribute("topicmenu", "filter");
	%>

	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'"><bean:message key="jsp.questions.tab.sidemenu.link.questions"/></a></li>		
					<li><a href="<%=request.getContextPath()%>/Subject.do"><bean:message key="jsp.questions.tab.sidemenu.link.category"/></a></li>
					<li><a href="<%=request.getContextPath()%>/Topic.do" class="active"><bean:message key="jsp.questions.tab.sidemenu.link.subcategory"/></a></li>
					<li><a href="<%=request.getContextPath()%>/Level.do"><bean:message key="jsp.questions.tab.sidemenu.link.complexity"/></a></li>
					<li><a href="<%=request.getContextPath()%>/callqueimport.do"><bean:message key="jsp.questions.tab.sidemenu.link.importquest"/></a></li>				
				</ul>
				<div class="sidebar_note message note"><p><bean:message key="jsp.questionbank.topic.page.sidemenu.note1"/></p>
				<p><bean:message key="jsp.questionbank.topic.page.sidemenu.note2"/></p>
				</div>
			</div>
			<div id="main">
				<h3><bean:message key="jsp.questionbank.topic.page.header"/></h3>
				<hr />
				<logic:present name="TopicMessage">
					<p class="message success">
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</p>
				</logic:present>
				
				
				<div align="center" style="width:50%;padding: 10px;">
				<div id="dialog" style="display: none;">
					<%-- <html:form action="Topic"> --%>
						
						<logic:present name="subject">
							<%-- <html:hidden property="operation" value=""></html:hidden>
							<html:hidden property="topicRedirect"></html:hidden>
							<html:hidden property="topicId" />
							<html:hidden property="startPage" value="1"></html:hidden> --%>
								<table width="100%" style="border: 1px solid;">
									<tr>
										<th class="boxtitle">
											<bean:message key="jsp.questionbank.topic.page.addsubcategory"/>
										</th>										
									</tr>
									<tr>
										<td style="border:0;height: 15px;">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td style="border:0;">
											<p id="category">
												<logic:present name='subject'>
													<label><bean:message key="jsp.questionbank.topic.page.category"/></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<select id='subjectname' style="width: 367px;">
														<logic:iterate id='showResult' name='subject' >
															<option value='${showResult.subjectId}' >${showResult.subjectName}</option>
														</logic:iterate>
													</select>
												</logic:present>
												<p>
													<label><bean:message key="jsp.questionbank.topic.page.subcategory"/></label>
													<input type='text' size='30' id='topicname' onkeypress='return charsonly(event)'/>
												</p>
											</p>
										</td>
									</tr>
									<tr>
										<td style="border:0;height: 15px;">
											
											<p style='text-align: right;'>
												<input type="button" onclick="cancelAddOpr();" value="Cancel" class="btn_green"/>&nbsp;
												<input type='button' value='Save' onclick='saveTopic();' class='btn_green'>
											</p>
										</td>
									</tr>
								</table>
						</logic:present>
					<%-- </html:form> --%>
				</div>
			</div>
			
			
				<div class="table_top" style="position: relative;">
					<input type="button" id="add_subcategory" value='<bean:message key="jsp.questionbank.topic.page.addsubcategorybtn"/>' class="btn_green_sml"
						onclick="addSubCategory();">
						
					<div style="float: right; margin: 0 0 0 10px;">
							<input type="text" id="searchtext" name="searchtext" size="100" style="width:200px;important!"/>
							<button type="submit" class="btn_green_sml" onclick="submitSearch();"><bean:message key="jsp.questionbank.topic.page.searchbtn"/></button>
					</div> 
				</div>
				<div id="q_bank" class="filterdiv" style="display: none;">
					<logic:present name='subject'>
						<table align='center' width='400'>
							<tr>
								<td><bean:message key="jsp.questionbank.topic.page.category"/></td>
								<td><select id='subject' class="combo"
									onchange='return getTopic("");'>
										<option value='0'><bean:message key="jsp.questionbank.topic.page.selectcategory"/></option>
										<logic:iterate id='showResult' name='subject'>
											<option value='${showResult.subjectId}'>${showResult.subjectName}</option>
										</logic:iterate>
								</select></td>

							</tr>
						</table>
					</logic:present>
				</div>
				<logic:present name="Topic">
					<html:form action="Topic">
						<html:hidden property="searchKeyword" />
						<div id="dialog"></div>
						<table class="display" id="example">
							<thead>
								<tr>
									<th scope="col"><bean:message key="jsp.questionbank.topic.page.table.subcategory"/></th>
									<th scope="col"><bean:message key="jsp.questionbank.topic.page.table.category"/></th>
									<th scope="col" align="center"><bean:message key="jsp.questionbank.topic.page.table.options"/></th>
								</tr>
							</thead>
							<tbody>
								<logic:iterate id="showResult" name="Topic">
									<tr>
										<td width="40%"><bean:write name="showResult"
												property="topicName" filter="true" /> <logic:iterate id='topciResult'
												name="topicList">
												<logic:equal name="topciResult" property="id"
													value="${showResult.topicId}">
														&nbsp;<span class="highlight">(<bean:write
															name="topciResult" property="count" /> <logic:equal name="topciResult" property="count" value="1" >question</logic:equal><logic:notEqual name="topciResult" property="count" value="1" >questions</logic:notEqual>)
													</span>
												</logic:equal>
											</logic:iterate></td>
										<logic:iterate id='showResult1' name="subject">
											<logic:equal name="showResult1" property="subjectId"
												value="${showResult.subjectId}">
												<td width="40%"><bean:write name="showResult1"
														property="subjectName" filter="true"/></td>
											</logic:equal>
										</logic:iterate>
										<td width="10%" align="center">
											<a href="#" onclick="showEditDialog(${showResult.topicId},'${showResult.topicName}');">
												<img src="<%=request.getContextPath()%>/images/edit.png" title='<bean:message key="jsp.questionbank.topic.page.tooltip.edit"/>'></a>&nbsp;
											<a href="#" class='basicDelete' onclick="return doTopicDelete(${showResult.topicId});"> 
												<img src="<%=request.getContextPath()%>/images/delete.png" title='<bean:message key="jsp.questionbank.topic.page.tooltip.delete"/>'></a>
										</td>
									</tr>
								</logic:iterate>
							</tbody>
							<tfoot>
							</tfoot>
						</table>

						<script type="text/javascript">
							<logic:present name="subIdNo">
									var list = document.getElementById('subject');
									for (var intI = 0; intI < list.options.length; intI++) {
								  if (list.options[intI].value == <bean:write name="subIdNo"/> ) {
								    list.options[intI].selected = true;
						  			}
								}
							</logic:present>
						</script>

						<div id="basic-modal-content">
							<br>
							<div align="center">
								<table width="100%" id="box-table-a" style="padding-top: 20px;">
									<logic:present name="Topic">
										<input type="hidden" id="caller" value="JSP" />
										<html:hidden property="operation"></html:hidden>
										<html:hidden property="subjectId"></html:hidden>
										<html:hidden property="topicId" />
										<html:hidden property="questionRedirect"></html:hidden>
										<tr>
											<td><bean:message key="jsp.questionbank.topic.page.subcategory"/></td>
											<td><html:text property="topicName" styleId="topicName"
													size="30"></html:text></td>
											<td><html:hidden property="startPage" value="1"></html:hidden></td>
										</tr>
										<tr>
											<td colspan="2" align="center">
													<html:submit onclick="doSubmit();return false;"><bean:message key="jsp.questionbank.topic.page.savebtn"/></html:submit>
											</td>
										</tr>
									</logic:present>
								</table>
							</div>
						</div>
					</html:form>
					
					<table style="width:100%">						
						<tr>
						<td>
							<logic:present name="pagingBean">
							<font color="red"><bean:message key="jsp.questionbank.topic.page.table.total"/> <bean:write name="pagingBean" property="count" /></font>
							</logic:present>
						</td>
						<td align="right">
						<%@include file="/jsp/common/paging.jsp" %>
						</td>
						</tr>
					</table>	
				</logic:present>
			</div>
		</div>
	</div>
	<%--
	<html:form action="Topic">
		<html:hidden property="searchKeyword" />
	</html:form>
	--%>				
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
		/* $('#example').dataTable( {
			"aaSorting": [ [0,'asc'], [1,'asc'] ],
			"aoColumnDefs": [
				{ "sType": 'string-case', "aTargets": [ 2 ] }
			]
		} ); */

		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	} ); 
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
