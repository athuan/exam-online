<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.questionbank.addquestion.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/questionbank/questionshow.js?dt=30dec2015"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor/nicEdit.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script>

$(document).ready(function() { 
	$("#subjectid").select2({
		placeholder: "",
		allowClear: true
	});
	
	$("#topicidresponse").select2({
		placeholder: "",
		allowClear: true
	});
	
	$("#levelid").select2({
		placeholder: "",
		allowClear: true
	});
	$("#qtype").select2({
		placeholder: "",
		allowClear: true
	});
	
});

function setSubCategory(){
	var subCatId = document.getElementById('topicidresponse').value;
	var frm = document.forms["QuestionForm"];
	frm.subjectId.value = subCatId;
	//document.getElementById('subjectId').value = subCatId ;
}

var contextpath = '<%=request.getContextPath()%>';

</script>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
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
					<div class="sidebar_note message note"><p><bean:message key="jsp.questionbank.addquestion.page.sidemenu.note1"/></p>
				<p> <bean:message key="jsp.questionbank.addquestion.page.sidemenu.note2"/></p>
				</div>
			</div>
			<!--RIGHT SECTION ENDS HERE-->
			<div id="main">
				<h3><bean:message key="jsp.questionbank.addquestion.page.header"/></h3>
				<hr>
				<logic:present name="TopicMessage">
					<p class="message success">
						<bean:write name="TopicMessage" filter="true" />
					</p>
				</logic:present>
				<div id="ouestionshows" class="add_question">
					<p>
						<label><bean:message key="jsp.questionbank.addquestion.page.category"/></label>
						<logic:present name='subject'>
								<select id='subjectid' onchange='getTopicSecond();' style="width: 460px;">
									<option value='0'><bean:message key="jsp.questionbank.addquestion.page.selectcategory"/></option>
                            		<logic:iterate id='showResult' name='subject'>
                            		<logic:equal name='subject_id' value="${showResult.subjectId}">
                            		    <option value='${showResult.subjectId}' selected="selected"><bean:write name="showResult" property="subjectName" filter="true" /></option>
                            		</logic:equal>
                            		<logic:notEqual name='subject_id' value="${showResult.subjectId}">
                            		    <option value='${showResult.subjectId}'><bean:write name="showResult" property="subjectName" filter="true" /></option>
                            		</logic:notEqual>
									</logic:iterate>
								</select>
							</logic:present>
					</p>
					<p>
					<logic:equal name='selectedtopicid' value="0">
						<label><bean:message key="jsp.questionbank.addquestion.page.subcategory"/></label>
							<span id='topicContain'>
								<select id='topicidresponse' style="width: 460px;">
								<option value='0'><bean:message key="jsp.questionbank.addquestion.page.selectsubcategory"/></option>
								</select>
							</span>
							<small><bean:message key="jsp.questionbank.addquestion.page.subcategory"/></small>
					</logic:equal>
					<logic:notEqual name='selectedtopicid' value="0">
						<label><bean:message key="jsp.questionbank.addquestion.page.subcategory"/></label>
							<span id='topicContain'>
								<select id='topicidresponse' style="width: 460px;">
								<option value='0'><bean:message key="jsp.questionbank.addquestion.page.selectsubcategory"/></option>
                            	<logic:iterate id='showTopic' name='topic'>
                            		<logic:equal name='topic_id' value="${showTopic.topicId}">
                            		    <option value='${showTopic.topicId}' selected="selected"><bean:write name="showTopic" property="topicName" filter="true" /></option>
                            		</logic:equal>
                            		<logic:notEqual name='topic_id' value="${showTopic.topicId}">
                            		    <option value='${showTopic.topicId}'><bean:write name="showTopic" property="topicName" filter="true" /></option>
                            		</logic:notEqual>
									</logic:iterate>
								</select>
							</span>
							<small><bean:message key="jsp.questionbank.addquestion.page.subcategory.optional"/></small>
					</logic:notEqual>
					</p>
					 <p>
						<label><bean:message key="jsp.questionbank.addquestion.page.complexity"/></label>
						<logic:present name='level'>
								<select id='levelid' style="width: 460px;">
									<option value='0'><bean:message key="jsp.questionbank.addquestion.page.selectcomplexity"/></option>
									<logic:iterate id='showLevel' name='level'>
									<logic:equal name='complexity' value="${showLevel.levelid}">
        								<option value='${showLevel.levelid}' selected="selected"><bean:write name="showLevel" property="level" filter="true" /></option>
                            		</logic:equal>
                            		<logic:notEqual name='complexity' value="${showLevel.levelid}">
   										<option value='${showLevel.levelid}'><bean:write name="showLevel" property="level" filter="true" /></option>
                            		</logic:notEqual>
			
									</logic:iterate>
								</select>
							</logic:present>
							<small><bean:message key="jsp.questionbank.addquestion.page.complexity.optional"/></small>
					</p>
					<p><label>Question Type:</label>
						<select id="qtype" style="width: 150px;" onchange="showhideqtype();">
							<option value="0">Text</option>
							<option value="1">Audio</option>
							<option value="2">Video</option>
						</select>
					</p>
					<div id="questtype" style="display:none;"><p><label>URL:</label> <input type="text" name="qtypeurl" id="qtypeurl" placeholder="Enter the URL" size="50"/>
					<small id="typeSupport"></small></p>
					</div>
					<table>
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.question"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="newquestion" cols="80" rows="5"></textarea></td>
						</tr>
					</table>						
					
					<p style="margin: 5px 0;">
						<label><bean:message key="jsp.questionbank.addquestion.page.answertype"/></label>
						<span style="margin: 5px 0;">
						<input type='radio' name='answerType' onclick='getChoice();' checked="checked" id="singleAswerType"/><bean:message key="jsp.questionbank.addquestion.page.single"/>  
						&nbsp; &nbsp; &nbsp;<input type='radio' name='answerType' onclick='getChoice();' id="mulitpleAswerType" />&nbsp;<bean:message key="jsp.questionbank.addquestion.page.multiple"/>
						&nbsp; &nbsp; &nbsp;<input type='radio' name='answerType' onclick='getChoice();' id="subjectiveAswerType" />&nbsp;<bean:message key="jsp.questionbank.addquestion.page.subjective"/>
						</span>
					</p>
					
					<p id="lblTotalOptions">
						<label><bean:message key="jsp.questionbank.addquestion.page.options"/></label>
						<select id='TotalOptions' onChange='getTextBoxes();'>
								<option value='0'><bean:message key="jsp.questionbank.addquestion.page.selectoptions"/></option>
								<option value='2'>2</option>
								<option value='3'>3</option>
								<option value='4' selected="selected">4</option>
								<option value='5'>5</option>
								<option value='6'>6</option>
								<option value='7'>7</option>
						</select>
					</p>
					
					
					<table id="optA">
						<tr >
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.opta"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionA" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
					
					<table id="optB">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.optb"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionB" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
					
					<table  id="optC">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.optc"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionC" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
					
					<table id="optD">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.optd"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionD" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
					
					<table id="optE">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.opte"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionE" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
					
					<table id="optF">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.optf"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionF" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
									
					
					<table id="optG">
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.optg"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="optionG" cols="60" rows="2" > </textarea></td>
						</tr>
					</table>						
							
					
				
					
					<p>
						<span id='PlaceAnswerChoice' style="width: 100%;"></span>
					</p>
					
					<table>
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.addquestion.page.hint"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><textarea id="questionHint" cols="53" rows="2" placeholder="optional"></textarea></td>
						</tr>
					</table>
					
					<p>
						<label></label>
						<input type='button' class="btn_green" value='<bean:message key="jsp.questionbank.addquestion.page.savebtn"/>' onclick='saveQuestion("");'>
						<input type='button' class="btn_green" value='<bean:message key="jsp.questionbank.addquestion.page.saveandaddbtn"/>' style="text-transform:none;" onclick='saveQuestion("addanother");'>
					</p>
					<input type="hidden" name="selectedsubjectid" id="selectedsubjectid">
					<input type="hidden" name="selectedtopicid" id="selectedtopicid">
					<input type="hidden" name="selectedcomplexity" id="selectedcomplexity">
					
				</div>
				<html:form action="/showQuestion" acceptCharset="utf-8">
					<html:hidden property="operation"></html:hidden>
					<html:hidden property="question"></html:hidden>
					<html:hidden property="topicid"></html:hidden>
					<html:hidden property="optionA"></html:hidden>
					<html:hidden property="optionB"></html:hidden>
					<html:hidden property="optionC"></html:hidden>
					<html:hidden property="optionD"></html:hidden>
					<html:hidden property="optionE"></html:hidden>
					<html:hidden property="optionF"></html:hidden>
					<html:hidden property="optionG"></html:hidden>
					<html:hidden property="answer"></html:hidden>
					<html:hidden property="levelid"></html:hidden>
					<html:hidden property="subjectId"></html:hidden>
					<html:hidden property="questionid"></html:hidden>
					<html:hidden property="showAsMCQ"></html:hidden>
					<html:hidden property="questionHint"></html:hidden>
					<html:hidden property="selectedsubjectid" styleId="selectedsubjectid"></html:hidden>
					<html:hidden property="selectedtopicid" styleId="selectedtopicid"></html:hidden>
					<html:hidden property="selectedcomplexity" styleId="selectedcomplexity"></html:hidden>
					<html:hidden property="questionURL"></html:hidden>
					<html:hidden property="questiontype"></html:hidden>
				</html:form>
			</div>
		</div>
	</div>
	<script>
		new nicEditor({fullPanel : true}).panelInstance('newquestion');
		
		new nicEditor({fullPanel : true}).panelInstance('optionA');
		new nicEditor({fullPanel : true}).panelInstance('optionB');
		new nicEditor({fullPanel : true}).panelInstance('optionC');
		new nicEditor({fullPanel : true}).panelInstance('optionD');
		new nicEditor({fullPanel : true}).panelInstance('optionE');
		new nicEditor({fullPanel : true}).panelInstance('optionF');
		new nicEditor({fullPanel : true}).panelInstance('optionG');		
		new nicEditor({fullPanel : true}).panelInstance('questionHint');		
		getTextBoxes();
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>