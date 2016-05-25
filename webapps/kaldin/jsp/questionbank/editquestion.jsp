<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.questionbank.editquestion.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/questionbank/questionshow.js?dt=18jan2016"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor/nicEdit.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script>
$(document).ready(function() { 
	setTopic(${questDTO.topicid});
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
// 	$("#qtype").select2({
// 		placeholder: "",
// 		allowClear: true
// 	});
	setQuestionType(${questDTO.questiontype});
	showhideqtype();
});


function setSubCategory(){
	var subCatId = document.getElementById('topicidresponse').value;
	var frm = document.forms["QuestionForm"];
	frm.subjectId.value = subCatId;
	//document.getElementById('subjectId').value = subCatId ;
}

</script>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
	<% int totalOptions = 4; %>
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
					<div class="sidebar_note message note"><p><bean:message key="jsp.questionbank.editquestion.page.sidemenu.note1"/></p>
				<p> <bean:message key="jsp.questionbank.editquestion.page.sidemenu.note1"/></p>
				</div>
			</div>
			<!--RIGHT SECTION ENDS HERE-->
			<div id="main">
				<h3><bean:message key="jsp.questionbank.editquestion.page.header"/></h3>
				<hr>
				<html:form action="/editQuestion" acceptCharset="utf-8">
				<div id="ouestionshows" class="add_question">
					<p>
						<label><bean:message key="jsp.questionbank.editquestion.page.category"/></label>
						<logic:present name='subject'>
								<html:select property="subjectId" styleId='subjectid' onchange='getTopicSecond();' style="width: 460px;" value="${questDTO.subjectId}">
									<option value='0'><bean:message key="jsp.questionbank.editquestion.page.selectcategory"/></option>
									<logic:iterate id='showResult' name='subject'>
										<html:option value='${showResult.subjectId}'><bean:write name="showResult"
												property="subjectName" filter="true" /></html:option>
									</logic:iterate>
								</html:select>
							</logic:present>
					</p>
					<p>
						<label><bean:message key="jsp.questionbank.editquestion.page.subcategory"/></label>
							<span id='topicContain'>
								<select id='topicidresponse' style="width: 460px;">
								<option value='0'><bean:message key="jsp.questionbank.editquestion.page.selectsubcategory"/></option>
								</select>
							</span>
							<small><bean:message key="jsp.questionbank.editquestion.page.subcategory.optional"/></small>
					</p>
					<script type="text/javascript">getTopicSecond();</script>
					<p>
						<label><bean:message key="jsp.questionbank.editquestion.page.complexity"/></label>
						<logic:present name='level'>
								<html:select property="levelid" styleId='levelid' style="width: 460px;" value="${questDTO.levelid}">
									<option value='0'><bean:message key="jsp.questionbank.editquestion.page.selectcomplexity"/></option>
									<logic:iterate id='showLevel' name='level'>
										<html:option value='${showLevel.levelid}'><bean:write name="showLevel"
												property="level" filter="true" /></html:option>
									</logic:iterate>
								</html:select>
							</logic:present>
							<small><bean:message key="jsp.questionbank.editquestion.page.complexity.optional"/></small>
					</p>
					<p><label>Question Type:</label>
						<html:select styleId="qtype" property="questiontype" style="width: 150px;"  onchange="showhideqtype();">
							<html:option value="0">Text</html:option>
							<html:option value="1">Audio</html:option>
							<html:option value="2">Video</html:option>
						</html:select>
					</p>
					<div id="questtype" style="display:none;"><p><label>URL:</label> <html:text property="questionURL" styleId="qtypeurl" placeholder="Enter the URL" value="${questDTO.questionURL}" size="50"/>
					<small id="typeSupport"></small></p>
					</div>
			    	
					<table>
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.question"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea property="question" cols="80" rows="10" styleId='newquestion' value="${questDTO.question}"></html:textarea></td>
						</tr>
					</table>	
					
					<p>
						<label><bean:message key="jsp.questionbank.editquestion.page.options"/></label>
						<select id='TotalOptions' onChange='getTextBoxesForEdit();getChoiceForEdit();'>
								<option value='0'><bean:message key="jsp.questionbank.editquestion.page.selectoptions"/></option>
								<option value='2'>2</option>
								<option value='3'>3</option>
								<option value='4' selected="selected">4</option>
								<option value='5'>5</option>
								<option value='6'>6</option>
								<option value='7'>7</option>
						</select>
					</p>
					
					<logic:notEmpty name="ansDTO" property="optionA">					
						<% totalOptions = 1; %>		
						</logic:notEmpty>				
						<table id="optA">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.opta"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optiona" property="optionA" value="${ansDTO.optionA}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optiona');						
						</script>
					
					<logic:notEmpty name="ansDTO" property="optionB">						
						<% totalOptions = 2; %>
						</logic:notEmpty>
						<table id="optB">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.optb"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optionb" property="optionB" value="${ansDTO.optionB}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optionb');						
						</script>
					
					<logic:notEmpty name="ansDTO" property="optionC">
					<% totalOptions = 3; %>
					</logic:notEmpty>						
						<table id="optC">
							<tr>
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.optc"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optionc" property="optionC" value="${ansDTO.optionC}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optionc');						
						</script>
						
					<logic:notEmpty name="ansDTO" property="optionD">	
					<% totalOptions = 4; %>
					</logic:notEmpty>					
						<table id="optD">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.optd"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optiond" property="optionD" value="${ansDTO.optionD}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optiond');						
						</script>
						
					<logic:notEmpty name="ansDTO" property="optionE">	
					<% totalOptions = 5; %>
					</logic:notEmpty>											
						<table id="optE">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.opte"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optione" property="optionE" value="${ansDTO.optionE}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optione');						
						</script>
						
					<logic:notEmpty name="ansDTO" property="optionF">
					<% totalOptions = 6; %>
					</logic:notEmpty>					
						<table id="optF">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.optf"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optionf" property="optionF" value="${ansDTO.optionF}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optionf');						
						</script>
						
					<logic:notEmpty name="ansDTO" property="optionG">	
					<% totalOptions = 7; %>
					</logic:notEmpty>					
						<table id="optG">
							<tr >
								<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.optg"/></td>
								<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea styleId="optiong" property="optionG" value="${ansDTO.optionG}" cols="60" rows="2"/></td>
							</tr>
						</table>
						<script>
							new nicEditor({fullPanel : true}).panelInstance('optiong');						
						</script>
						
				

					<p><label><bean:message key="jsp.questionbank.editquestion.page.showoption"/></label> 
						<html:radio styleId='MCQnewRadio' property='showAsMCQ' value="0" onclick='getChoiceForEdit();'>&nbsp;<bean:message key="jsp.questionbank.editquestion.page.radiobtn"/></html:radio>
						<html:radio styleId='MCQnewCheck' property='showAsMCQ' value="1" onclick='getChoiceForEdit();'>&nbsp;<bean:message key="jsp.questionbank.editquestion.page.checkbox"/></html:radio> 
						<html:radio styleId='MCQnewText' property='showAsMCQ' value="3" onclick='getChoiceForEdit();'>&nbsp;<bean:message key="jsp.questionbank.editquestion.page.textarea"/></html:radio>
					</p>
					<p>
						<label style="vertical-align: top"><bean:message key="jsp.questionbank.editquestion.page.correctanswer"/></label>
						<span id='answerContain'></span>
					</p>

					<script>document.getElementById("TotalOptions").value = <%= totalOptions %>;
						getTextBoxesForEdit();				
					</script>
					<table>
						<tr>
							<td valign="top" style="border:0px;imprtant!;width: 120px;" align="right"><bean:message key="jsp.questionbank.editquestion.page.hint"/></td>
							<td style="border:0px;padding-left:0px;imprtant!; "><html:textarea property="questionHint"  styleId="questionHint" cols="60" rows="2" value="${questDTO.questionHint}"></html:textarea></td>
						</tr>
					</table>
					<script>
							new nicEditor({fullPanel : true}).panelInstance('questionHint');						
						</script>
					<p>
						<label></label>
						<input type='button' class="btn_green" value='<bean:message key="jsp.questionbank.editquestion.page.savebtn"/>' onclick='editQuestion();'>
					</p>
				</div>
				
					<html:hidden property="operation" value="edit"></html:hidden>
					<html:hidden property="topicid"></html:hidden>
					<html:hidden property="answer"></html:hidden>
					<html:hidden property="questionid" value="${questDTO.questionid}"></html:hidden>
				</html:form>
			</div>
		</div>
	</div>
<script type="text/javascript">
new nicEditor({fullPanel : true}).panelInstance('newquestion');
	showAnswers(${questDTO.questionid});
	function setTopic(topicid){
		var list = document.getElementById('topicidresponse');
		for (var intI = 0; intI < list.options.length; intI++) {
			if (list.options[intI].value == topicid) {
	    		list.options[intI].selected = true;
			}
		}
	}
	function setQuestionType(qType){
	  document.getElementById('qtype').value = qType;
	}
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>