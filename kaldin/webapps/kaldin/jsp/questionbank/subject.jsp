<%@ include file="/jsp/common/includetags.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.questionbank.subject.page.title"/></title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>

<script type="text/javascript" charset="utf-8">
function savesubject() {	
	var sub=document.getElementById("subName").value;

	if(sub==""){
			alert('<bean:message key="jsp.questionbank.subject.page.error1"/>');
			return false;
	}else if(sub[0]==" "){
			alert('<bean:message key="jsp.questionbank.subject.page.error2"/>');
			return false;
	}else {
		$.post("Subject.do", {
			check : "checksubject",
			subname : sub
		},
				function(data) {
					if (data == 'Found') {
						alert('<bean:message key="jsp.questionbank.subject.page.error3"/>');
					} else {
						var frm=document.forms[1];
						//frm.operation.value="add";
						frm.subjectName.value=sub;			
						frm.topicRedirect.value=false;
						frm.submit();
					}
				});
	}
}
function dopage(page,op){
    <logic:present name="search">
    	document.forms[0].operation.value ="LIST";
    	document.forms[0].startPage.value = page;
    	document.forms[0].submit();
    </logic:present>
    <logic:notPresent name="search">
    	document.forms[1].operation.value ="LIST";
    	document.forms[1].startPage.value = page;
    	document.forms[1].submit();
    </logic:notPresent>
}
function doSubmit(){
	var frm=document.forms[1];
	frm.submit();
}

function doSubjectAdd(){	
	document.getElementById("subName").value="";	
}
function charsonly(e){
	var unicode=e.charCode? e.charCode : e.keyCode
	if (unicode!=8 && unicode!=43 && unicode!=35 && unicode!=32 && unicode!=37 && unicode!=38 && unicode!=39 && unicode!=40 &&  unicode!=127 && unicode!=46 && (unicode<65||unicode>90) && (unicode<97 || unicode>122)){ //if the key isn't the backspace key (which we should allow)
		return false // disable key press
	}
}
function showDialog(opr) {
		var frm=document.forms[0];
		frm.operation.value=opr;
		document.getElementById("dialog").style.display='';
		document.getElementById("add_category").style.display= 'none';
}

function cancelAddOpr(){
	var frm=document.forms[0];
	frm.operation.value="";
	document.getElementById("dialog").style.display='none';
	document.getElementById("add_category").style.display= '';
}

function addCategory(){
	showDialog('add');
	var frm=document.forms[0];
	var frm1=document.forms[1];
	frm1.operation.value="add";
	frm.subjectName.value="";
	
}

function showEditDialog(subid,subName) {
	showDialog('edit');
	var frm=document.forms[0];
	var frm1=document.forms[1];
	frm.subjectName.value=subName;
	//frm.operation.value="edit";
	
	frm.subjectId.value=subid;
	
	frm1.subjectId.value=subid;
	frm1.operation.value="edit";
	
	/*$(document).ready(function() {
		$("#editdialog").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
	    $("#editdialog").dialog('option', 'title', "Question Category");
		$("#editdialog").dialog('option', 'show', 'drop');
	    $("#editdialog").dialog('option', 'resizable', true)
		$("#editdialog").dialog('open');
	} );*/
}

	
	
	
function doSubjectDelete(subid,subName,formno)	{
		document.getElementById("subName").value=subName;
		if(formno== "1"){
		var frm1=document.forms[1];
		frm1.subjectId.value=subid;
		frm1.operation.value="delete";
		if(confirm('<bean:message key="jsp.questionbank.subject.page.error4"/>')){
			doSubmit();
		}}
		else{
			//alert("wrong form");
			if(formno== "2"){
		var frm2=document.forms[2];
		frm2.subjectId.value=subid;
		frm2.operation.value="delete";
		if(confirm('<bean:message key="jsp.questionbank.subject.page.error4"/>')){
			doSubmit();
			}}
	}}

function editsubject()	{
	var sub=document.getElementById("newsubjectname").value;
	if(sub==""){
		alert('<bean:message key="jsp.questionbank.subject.page.error5"/>');
		return false;
	}else if(sub==" "){
		alert('<bean:message key="jsp.questionbank.subject.page.error2"/>');
		return false;
	}else {
		$.post("Subject.do", {
			check : "checksubject",
			subname : sub
		},
			function(data) {
				if (data == 'Found') {
					alert('<bean:message key="jsp.questionbank.subject.page.error3"/>');
				} else {
					var frm=document.forms[1];		
					frm.operation.value="edit";
					frm.submit();
				}
			});
	}
}	

function submitSearch(){
	var keyword = document.getElementById("searchtext").value;
	var frm = document.forms[2];
	frm.searchKeyword.value = keyword;
	frm.submit();
}
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
				<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'"><bean:message key="jsp.questions.tab.sidemenu.link.questions"/></a></li>		
				<li><a href="<%=request.getContextPath()%>/Subject.do" class="active"><bean:message key="jsp.questions.tab.sidemenu.link.category"/></a></li>
				<li><a href="<%=request.getContextPath()%>/Topic.do"><bean:message key="jsp.questions.tab.sidemenu.link.subcategory"/></a></li>
				<li><a href="<%=request.getContextPath()%>/Level.do"><bean:message key="jsp.questions.tab.sidemenu.link.complexity"/></a></li>
				<li><a href="<%=request.getContextPath()%>/callqueimport.do"><bean:message key="jsp.questions.tab.sidemenu.link.importquest"/></a></li>
			</ul>
			<div class="sidebar_note message note"><p><bean:message key="jsp.questionbank.subject.page.sidemenu.note1"/></p>
				<p><bean:message key="jsp.questionbank.subject.page.sidemenu.note2"/></p>
				</div>
		</div>
		<!--RIGHT SECTION ENDS HERE-->
		<div id="main">
			<h3><bean:message key="jsp.questionbank.subject.page.header"/></h3>
			<hr>
			<logic:present name="TopicMessage">
				<p class="message success">
					<b><bean:write name="TopicMessage" filter="true" /></b>
				</p>
			</logic:present>
			<logic:present name="ErrTopicMessage">
				<p class="message invalid">
					<b><bean:write name="ErrTopicMessage" filter="true" /></b>
				</p>
			</logic:present>
			
			<div align="center" style="width:50%;padding: 10px;">
				<div id="dialog" style="display: none;">
					<html:form action="Subject">
						
						<logic:present name="subject">
							<html:hidden property="operation" value=""></html:hidden>
							<html:hidden property="topicRedirect"></html:hidden>
							<html:hidden property="subjectId" />
							<html:hidden property="startPage" value="1"></html:hidden>
								<table width="100%" style="border: 1px solid;">
									<tr>
										<th class="boxtitle">
											<bean:message key="jsp.questionbank.subject.page.addcategory"/>
										</th>										
									</tr>
									<tr>
										<td style="border:0;height: 15px;">
										&nbsp;
										</td>
									</tr>
									<tr>
										<td style="border:0;">
											<bean:message key="jsp.questionbank.subject.page.category"/> <html:text property="subjectName" styleId="subName" size="30" ></html:text>
										</td>
									</tr>
									<tr>
										<td align="right" style="border:0">
											<input type="button" onclick="cancelAddOpr();" value='<bean:message key="jsp.questionbank.subject.page.cancelbtn"/>' class="btn_green"/>&nbsp;
											<input type="button" onclick="savesubject();" value='<bean:message key="jsp.questionbank.subject.page.savebtn"/>' class="btn_green"/>
										</td>
									</tr>
								</table>
						</logic:present>
					</html:form>
				</div>
			</div>
			
			<div class="table_top" style="position: relative;">
			<button class="btn_green_sml"  id="add_category"  onclick="addCategory();"><bean:message key="jsp.questionbank.subject.page.addcategorybtn"/></button>
				<div style="float: right; margin: 0 0 0 10px;">
						<input type="text" id="searchtext" name="searchtext" size="100" style="width:200px;important!"/>
						<button type="button" class="btn_green_sml" onclick="submitSearch();"><bean:message key="jsp.questionbank.subject.page.searchbtn"/></button>
				</div> 
			</div>
							
			<logic:present name="subject">
				<table class="display" id="example">
					<thead>
						<tr>
							<th scope="col"><bean:message key="jsp.questionbank.subject.page.table.category"/></th>
							<th scope="col" align="center"><bean:message key="jsp.questionbank.subject.page.table.options"/></th>
						</tr>
					</thead>
					<tbody>
						<logic:iterate id="showResult" name="subject">
							<tr>
								<td>
										<bean:write name="showResult" property="subjectName" filter="true" />
										<logic:iterate id='subjectResult' name="subjectList">
											  <logic:equal name="subjectResult" property="id" value="${showResult.subjectId}"> 
											  (<bean:write name="subjectResult" property="count" /> 
											  <logic:equal name="subjectResult" property="count" value="1" >question)</logic:equal>
											  <logic:notEqual name="subjectResult" property="count" value="1" >questions)</logic:notEqual>
											  </logic:equal>
										</logic:iterate>
										</td>	
								<td width="10%" align="center"><a href="#"
									onclick="showEditDialog(${showResult.subjectId},'${showResult.subjectName}');">
										<img src="<%=request.getContextPath()%>/images/edit.png"
										title='<bean:message key="jsp.questionbank.subject.page.tooltip.edit"/>'>
								</a>&nbsp;<a href="#" class='basicDelete'
									onclick="return doSubjectDelete(${showResult.subjectId},'${showResult.subjectName}','1');">
										<img src="<%=request.getContextPath()%>/images/delete.png"
										title='<bean:message key="jsp.questionbank.subject.page.tooltip.delete"/>'>
								</a></td>
							</tr>
						</logic:iterate>
					</tbody>
				</table>
				
				
				<div id="editdialog" style="display: none;">
					<html:form action="Subject">
						<html:hidden property="startPage" value="1"></html:hidden>
						<html:hidden property="operation" value=""></html:hidden>
						<html:hidden property="topicRedirect"></html:hidden>
						<logic:present name="subject">
							<html:hidden property="subjectId" />
												
								<p><bean:message key="jsp.questionbank.subject.page.category"/> <html:text property="subjectName" styleId="newsubjectname" size="30"></html:text></p>
								<p style="text-align: right;"><input type="button" onclick="editsubject();" value='<bean:message key="jsp.questionbank.subject.page.savebtn"/>' class="btn_green" /></p>
							
						</logic:present>
					</html:form>
				</div>
				
				<table style="width:100%">						
					<tr>
					<td>
						<logic:present name="pagingBean">
						<font color="red"><bean:message key="jsp.questionbank.subject.page.table.total"/> <bean:write name="pagingBean" property="count" /></font>
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

<html:form action="Subject">
	<html:hidden property="searchKeyword" />
</html:form>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });			
	} );
</script> 
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>