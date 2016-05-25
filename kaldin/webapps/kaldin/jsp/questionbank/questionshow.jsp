<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<title><bean:message key="jsp.questionbank.questionshow.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/questionbank/questionshow.js?dt=18jan2016"></script>

	<%
		request.setAttribute("menu", "QuestionBank");
	    String complexity = (String) request.getParameter("levelid");
	    String subId = (String) request.getParameter("subjectid");
	    String topicId = (String) request.getParameter("topicid");	
	%>

<script type="text/javascript">
$(document).ready(function() { 
	$("#subject").select2({
		placeholder: "",
		allowClear: true
	});
	
	$("#topicList").select2({
		placeholder: "",
		allowClear: true
	});
	
	$("#levelList").select2({
		placeholder: "",
		allowClear: true
	});
});

var contextpath = '<%=request.getContextPath()%>';
var complexity = '<%=complexity%>';
var subId = '<%=subId%>';
var topicId = '<%=topicId%>';
var levelId = '<%=complexity%>';


</script>
</head>
<body>


	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'" class="active"><bean:message key="jsp.questions.tab.sidemenu.link.questions"/></a></li>		
					<li><a href="<%=request.getContextPath()%>/Subject.do"><bean:message key="jsp.questions.tab.sidemenu.link.category"/></a></li>
					<li><a href="<%=request.getContextPath()%>/Topic.do"><bean:message key="jsp.questions.tab.sidemenu.link.subcategory"/></a></li>
					<li><a href="<%=request.getContextPath()%>/Level.do"><bean:message key="jsp.questions.tab.sidemenu.link.complexity"/></a></li>
					<li><a href="<%=request.getContextPath()%>/callqueimport.do"><bean:message key="jsp.questions.tab.sidemenu.link.importquest"/></a></li>
				</ul>
				<div class="sidebar_note message note">
				<p><bean:message key="jsp.questionbank.questionshow.page.sidemenu.note1"/></p>
				<p><bean:message key="jsp.questionbank.questionshow.page.sidemenu.note2"/></p>
				</div>
			</div>
			<div id="main">
				<h3><bean:message key="jsp.questionbank.questionshow.page.header"/></h3>  
				<hr />
				
				<logic:present name="TopicMessage1">
					<p class="message success">
						<b><bean:write name="TopicMessage1" filter="true" /></b>
					</p>
				</logic:present>
				<div style="width:100%;">
				<html:form action="/callshowQuestion">
					<html:hidden property="startPage" value="1"></html:hidden>
					<html:hidden property="operation"></html:hidden>
					<html:hidden property="question"></html:hidden>					
					<html:hidden property="optionA"></html:hidden>
					<html:hidden property="optionB"></html:hidden>
					<html:hidden property="optionC"></html:hidden>
					<html:hidden property="optionD"></html:hidden>
					<html:hidden property="optionE"></html:hidden>
					<html:hidden property="optionF"></html:hidden>
					<html:hidden property="optionG"></html:hidden>
					<html:hidden property="answer"></html:hidden>					
					<html:hidden property="questionid"></html:hidden>
					<html:hidden property="showAsMCQ"></html:hidden>
					<html:hidden property="questionHint"></html:hidden>
					<html:hidden property="selectedsubjectid" styleId="selectedsubjectid"></html:hidden>
					<html:hidden property="selectedtopicid" styleId="selectedtopicid"></html:hidden>
					<html:hidden property="selectedcomplexity" styleId="selectedcomplexity"></html:hidden>
					<div id="q_bank" class="filterdiv" style="padding: 10px 0;">
						
							<div style="margin-top: -21px;important!;float:left;">
							
								<div style="float: left">
									<logic:present name="subject">
										<html:select property="subjectId" styleId="subject" onchange="getQuestionsByCategory();" style="width:200px">
											<option value="0"><bean:message key="jsp.questionbank.questionshow.page.select.option1"/></option>
											<logic:iterate id="subjectida" name="subject">
												<option value="${subjectida.subjectId}"><bean:write name="subjectida" property="subjectName" filter="true" /></option>
											</logic:iterate>
										</html:select>
									</logic:present>
								</div>
								<div style="float: left; margin: 0 0 0 10px;">
									<html:select property="topicid" styleId="topicList"
										onchange="getQuestions();" style="width: 200px;">
										<option value="0"><bean:message key="jsp.questionbank.questionshow.page.select.option2"/></option>
										<logic:present name="topicList">
										<logic:iterate id="topicListData" name="topicList">
											<option value="${topicListData.topicId}"><bean:write name="topicListData"
														property="topicName" filter="true" /></option>
										</logic:iterate>
										</logic:present>
									</html:select>
								</div> 
								
								<div style="float: left; margin: 0 0 0 10px;">
									<html:select property="levelid" styleId="levelList"
										onchange="getQuestions();" style="width: 200px;">
										<option value="0"><bean:message key="jsp.questionbank.questionshow.page.select.option3"/></option>
										<logic:present name="level">
										<logic:iterate id="levelListData" name="level">
											<option value="${levelListData.levelid}"><bean:write name="levelListData"
														property="level" filter="true" /></option>
										</logic:iterate>
										</logic:present>
									</html:select>
								</div>
								
								<div style="float: left;"><a id="add_question" href="#" onclick="addQuestion();" class="btn_green_sml"><bean:message key="jsp.questionbank.questionshow.page.addquestbtn"/></a></div>
							</div>
							<div style="float:right;">
								<div style="float: right; margin: 0 0 0 10px;">
									<html:text property="searchKeyword" size="100" style="width:200px;important!"/>
									<a href="#" onclick="javascript:getQuestions();" class="btn_green_sml"><bean:message key="jsp.questionbank.questionshow.page.searchbtn"/></a>							
								</div> 
							</div>
						<script type="text/javascript">
							<logic:present name="sub">
								var list = document.getElementById('subject');
								for (var intI = 0; intI < list.options.length; intI++) {
						  			if (list.options[intI].value == <bean:write name="sub" filter="true"/>) {
							    	list.options[intI].selected = true;
						  			}
								}							
							</logic:present>
							
							<logic:present name="topid">
								var list = document.getElementById('topicList');								
								for (var intI = 0; intI < list.options.length; intI++) {
						  			if (list.options[intI].value == <bean:write name="topid" filter="true"/>) {
							    	list.options[intI].selected = true;
						  			}
								}
							</logic:present>
							
							<logic:present name="levid">
								var list = document.getElementById('levelList');								
								for (var intI = 0; intI < list.options.length; intI++) {
						  			if (list.options[intI].value == <bean:write name="levid" filter="true"/>) {
							    	list.options[intI].selected = true;
						  			}
								}
							</logic:present>
								
						</script>
					</div>
				</html:form>
				</div>
				<div style="float:left;width:100%;">
				<logic:present name="question">
						<table width="100%"  style="float: left;" class="display">
							<thead>
								<tr>
									<th scope="col" width="5%"><bean:message key="jsp.questionbank.questionshow.page.table.no"/></th>
									<th scope="col" width="*" style="text-align: left"><bean:message key="jsp.questionbank.questionshow.page.table.question"/></th>
									<th scope="col" width="8%"><bean:message key="jsp.questionbank.questionshow.page.table.options"/></th>	
								</tr>
							</thead>
							<tbody>
								<%
									int i = 0;
								%>
								<logic:iterate id="showResult" name="question">
									<tr>
										<td valign="top"><%=i+1 %></td>
										<td><input
											id="hiddenquest_${showResult.questionid}" type="hidden"
											value="<bean:write name='showResult' property='question' filter='true' />" />
											<input id="hiddenhint_${showResult.questionid}" type="hidden"
											value="<bean:write name='showResult' property='questionHint' filter='true' />" />
											<div id="questdiv_<%=i%>"></div> 
											
											<bean:define id="qDesc" name="showResult" property="question" type="java.lang.String"/>
											<%
											if(!qDesc.contains("<img")){
											qDesc= qDesc.replaceAll("<!--.*?-->", "").replaceAll("<[^>]+>", "").replaceAll("\\<.*?\\>", "");								
							                qDesc = (qDesc.length()> 115) ? (qDesc.substring(0,115) + "...") : (qDesc);
											}
											out.print(qDesc);
											%> 
										</td>										
										
										<td>
										<a href="editQuestion.do?qid=${showResult.questionid}"><img src="<%=request.getContextPath()%>/images/edit.png"	title='<bean:message key="jsp.questionbank.questionshow.page.tooltip.edit"/>'/></a>&nbsp;&nbsp;
										<a href="#" onclick="return doQuestionDelete(${showResult.questionid});"><img src="<%=request.getContextPath()%>/images/delete.png"	title='<bean:message key="jsp.questionbank.questionshow.page.tooltip.delete"/>'/></a>
										</td>
									</tr>
									<%
										i = i + 1;
									%>
								</logic:iterate>
							</tbody>
						</table>
						<table style="width:100%">						
							<tr>
							<td>
								<logic:present name="pagingBean">
								<font color="red"><bean:message key="jsp.questionbank.questionshow.page.table.total"/> <bean:write name="pagingBean" property="count" /></font>
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
	</div>		
<script type="text/javascript">
function getQuestions(){
	document.getElementById('selectedsubjectid').value = document.getElementById('subject').value;
	document.getElementById('selectedtopicid').value = document.getElementById('topicList').value;
	document.forms[0].submit();
}
function getQuestionsByCategory(){
	var list = document.getElementById('topicList');
	document.getElementById('selectedsubjectid').value = document.getElementById('subject').value;
	document.getElementById('selectedtopicid').value = list.options[0].value;
	list.options[0].selected = true;
	document.forms[0].submit();
}

function addQuestion(){
	if(document.getElementById('selectedsubjectid').value == ''){
		document.getElementById('selectedsubjectid').value = subId;
	}
	if(document.getElementById('selectedtopicid').value == ''){
		document.getElementById('selectedtopicid').value = topicId;
	}
	
	if(document.getElementById('selectedcomplexity').value == ''){
		document.getElementById('selectedcomplexity').value = levelId;
	}
	
	document.getElementById('add_question').href = contextpath+"/newQuestion.do?subjectid="+document.getElementById('selectedsubjectid').value+"&topicid="+document.getElementById('selectedtopicid').value+"&complexity="+complexity;
	return false;
}


function dopage(page,op){	
	<logic:present name="Filter">
		var frm=document.forms[1];
		frm.operation.value ="GETQUESTION";
	    frm.startPage.value = page;
	    frm.submit();
	</logic:present>
	<logic:notPresent name="Filter">
		var frm=document.forms[0];
		frm.operation.value ="LIST";
	    frm.startPage.value = page;
	    frm.submit();
	</logic:notPresent>	
}

</script>
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
		 Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	} );
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
