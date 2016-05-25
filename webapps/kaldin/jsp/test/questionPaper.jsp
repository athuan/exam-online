<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Create Question Paper - Kaldin Online Exam To Evaluate Knowledge</title>

<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/editor/nicEdit.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/test/questionPaper.js?dt=12jan2016"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/test/selectquestions.js?dt=12jan2016"></script>
<script type="text/javascript">
	history.go(1);

	function showDialog() {
		var re = /^[0-9]+/
		var givenquestion = document.getElementById("numberquestiongiven").value;
		var markperquestion = document.getElementById("markperquestion").value;
		//alert("markperquestion: " + markperquestion);
		var passingmarks = document.getElementById("passingmarks").value;
		//var markperquest =parseInt(totalMark) /parseInt(givenquestion);
		var re2 = /\./;
		var testname = document.getElementById("testname").value;
		if (testname == 0 || testname == null) {
			alert("Enter Name of Question Paper! ");
			return false;
		} else if(givenquestion == 0 || givenquestion == null) {
			alert("Enter the No of Questions!");
			return false;
		} else if (isNaN(givenquestion)) {
			alert("Please Enter Valid No of Questions");
			return false;
		} else if (markperquestion == 0 || markperquestion == null) {
			alert("Enter the marks per Questions!");
			return false;
		} else if (passingmarks == 0 || passingmarks == null) {
			alert("Enter the passing marks! ");
			return false;
		} /*else if (parseInt(passingmarks) > parseInt(totalMark)) {
			alert("Passing marks should not be greater than total marks");

			return false;
		} */else if (re2.test(markperquestion)) {
			alert("Please change total marks or number of questions.");

			return false;
		} else {
			$("#dialog").dialog("destroy");
			
			$("#dialog").dialog({
				autoOpen : true, height : '325', width : 'auto', modal : true, closeOnEscape : false
			});
			$("#dialog").dialog('option', 'title', "Manage Questions");
			//$("#dialog").dialog('option', 'show', 'drop');
			$("#dialog").dialog('option', 'resizable', true)
			var strHtml = "<table>"
			strHtml += "<tr><td><logic:present name='subjectList'>Category:</td><td><select id='subjectname' onchange='getTopic()' style='width: 223px;'><option value='0'>Select Category:</option><logic:iterate id='subjectList' name='subjectList'><option value='${subjectList.id}' >${subjectList.name} (${subjectList.count})</option></logic:iterate></select><span class='mandatory'>*</span></logic:present></td></tr>";
			strHtml += "<tr><td>Sub Category:</td><td><div id='topicCont'><select id='subsubjectname' style='width: 223px;'><option>Select Sub Category</option><logic:iterate id='topicList' name='topicList'><option value='${topicList.id}' >${topicList.name} (${topicList.count})</option></logic:iterate></select></div><div id='availableQuestions'></div></td></tr>";
			strHtml += "<tr><td>Complexity:</td><td><div id='complexity'><select name='levelid' id='testlevel' style='width: 223px;'><option value='0'>Select Complexity</option><logic:present name='LevelList'><logic:iterate id='levelCntList' name='levelCntList'><option value='${levelCntList.id}'>${levelCntList.name} (${levelCntList.count})</option></logic:iterate></logic:present></select></div></td></tr>";
			strHtml += "<tr><td>No. of Questions:</td><td><input type='text' size='5' id='numberquestion' onkeypress='return numbersonly(event)' onblur='return validate()'><span class='mandatory'>*</span></td></tr>";
			strHtml += "<tr><td colspan='2' align='center'><button onclick='return savetopic();' class='btn_green'>Save</button></td></tr></table>";
			$("#dialog").html(strHtml);
			$("#dialog").html();
			$("#dialog").dialog('open');
			
			
			$("#subjectname").select2({
				placeholder: "",
				allowClear: true
			});
			
			$("#subsubjectname").select2({
				placeholder: "",
				allowClear: true
			});
			
			$("#testlevel").select2({
				placeholder: "",
				allowClear: true
			});
		}
	}
	
	function showQuestionDialog() {
		var re = /^[0-9]+/
		var givenquestion = document.getElementById("numberquestiongiven").value;
		var markperquestion = document.getElementById("markperquestion").value;
		//alert("markperquestion: " + markperquestion);
		var passingmarks = document.getElementById("passingmarks").value;
		//var markperquest =parseInt(totalMark) /parseInt(givenquestion);
		var re2 = /\./;
		var testname = document.getElementById("testname").value;
		if (testname == 0 || testname == null) {
			alert("Enter Name of Question Paper! ");
			return false;
		} else if(givenquestion == 0 || givenquestion == null) {
			alert("Enter the No of Questions!");
			return false;
		} else if (isNaN(givenquestion)) {
			alert("Please Enter Valid No of Questions");
			return false;
		} else if (markperquestion == 0 || markperquestion == null) {
			alert("Enter the marks per Questions!");
			return false;
		} else if (passingmarks == 0 || passingmarks == null) {
			alert("Enter the passing marks! ");
			return false;
		} /*else if (parseInt(passingmarks) > parseInt(totalMark)) {
			alert("Passing marks should not be greater than total marks");

			return false;
		} */else if (re2.test(markperquestion)) {
			alert("Please change total marks or number of questions.");

			return false;
		} else {
			$("#dialog").dialog({
				autoOpen : true, height : '620', width : '1020', modal : true, closeOnEscape : false
			});
			$("#dialog").dialog('option', 'title', "Choose Individual Questions");
			//$("#dialog").dialog('option', 'show', 'drop');
			$("#dialog").dialog('option', 'resizable', true)
			var strHtml = "<div style='width: 100%;'>";
			strHtml += "<div style='float: left;padding-right: 10px;'><logic:present name='sList'><select id='subjectname' onchange='getTopic()' style='width: 223px;'><option value='0'>Select Category:</option><logic:iterate id='sList' name='sList'><option value='${sList.id}' >${sList.name} (${sList.count})</option></logic:iterate></select><span class='mandatory'>*</span></logic:present></div>";
			strHtml += "<div style='float: left;padding-right: 10px;'><div id='topicCont'><select id='subsubjectname' style='width: 223px;'><option>Select Sub Category</option><logic:iterate id='tList' name='tList'><option value='${tList.id}' >${tList.name} (${tList.count})</option></logic:iterate></select></div><div id='availableQuestions'></div></div>";
			//strHtml += "<div style='float: left;padding-right: 10px;'><div id='complexity'><select name='levelid' id='testlevel' style='width: 223px;'><option value='0'>Select Complexity</option><logic:present name='LevelList'><logic:iterate id='lList' name='lCntList'><option value='${lList.id}'>${lList.name} (${lList.count})</option></logic:iterate></logic:present></select></div></div>";
			strHtml += "<div><button class='btn_green' onclick='showQuestions();'>Show Questions</button></div>";
			strHtml += "</div>";
			strHtml += "<hr>";
			strHtml += "<div style='width: 100%;text-align:center;'>";
			strHtml += "<div style='float: left;width: 40%;'>";
			strHtml += "<b>Choose Questions</b>";
			strHtml += "</div>";
			strHtml += "<div style='float: left;width: 20%;'>";
			strHtml += "<b>Option</b>";
			strHtml += "</div>";
			strHtml += "<div style='float: left;width: 40%;'>";
			strHtml += "<b>Selected Questions</b>";
			strHtml += "</div>";
			strHtml += "<hr>";			
			strHtml += "<div style='width: 100%;text-align:center;'>";			
			strHtml += "<div id='questtochoose' style='float: left;width: 40%;overflow:auto;height:400px;'>";
			strHtml += "<table border='1' width='100%' class=\"display\" id=\"selqtable\">";
			strHtml += "<tr><th></th><th>Question</th></tr>";
			strHtml += "</table>";
			strHtml += "</div>";
			strHtml += "<div style='float: left;width: 20%;height:275px;padding-top: 125px;'>";
			strHtml += "<span id='selcount'><b>0</b></span> Questions Selected from Total <b>" + givenquestion + "</b><br>";
			strHtml += "<button class='btn_green' id='asq' onclick='addSelectedQuestions();'>Add Selected</button>";
			strHtml += "<button class='btn_green' id='rsq' onclick='removeSelectedQuestions();'>Remove Selected</button>";
			strHtml += "</div>";			
			strHtml += "<div id='questselected' style='float: left;width: 40%;overflow:auto;height:400px;'>";
			strHtml += "<table border='1' width='100%' class=\"display\" id=\"chooseqtable\">";
			strHtml += "<tr><th id='ra'></th><th>Question</th></tr>";
			strHtml += "</table>";
			strHtml += "</div>";
			strHtml += "<hr>";
			strHtml += "<div style='width: 100%;text-align:center;'><button class='btn_green' id='ssq' onclick='saveSelectedQuestions();'>Save Selected Questions</button></div>";
			strHtml += "</div>";
			$("#dialog").html(strHtml);
			$("#dialog").html();
			$("#dialog").dialog('open');
			
			$("#subjectname").select2({
				placeholder: "",
				allowClear: true
			});
			$("#subsubjectname").select2({
				placeholder: "",
				allowClear: true
			});
			//$("#testlevel").select2({
			//	placeholder: "",
			//	allowClear: true
			//});
			document.getElementById("ssq").disabled = true;
			jQuery('#ssq').css('opacity','0.6');
		}
	}
	function doSubmit() {
		var isComplete = true;
		if(document.getElementById("btnaddtopic").disabled == false || document.getElementById("btnaddquestions").disabled == false){
			isComplete = false;
			alert("Please configure questions first!");			 
		}
		if(isComplete){
		var re = /^[0-9]+/
		var re2 = /\./;
		var givenquestion = document.getElementById("numberquestiongiven").value;
		var totalMark = document.getElementById("totalmarks").value;
		var passingmarks = document.getElementById("passingmarks").value;
		var testname = document.getElementById("testname").value;
		if (testname == 0 || testname == null) {
			alert("Enter Name of Question Paper! ");
			return false;
		} else if (givenquestion == 0 || givenquestion == null) {
			alert("Enter the question number ! ");
			return false;
		} else if (totalMark == 0 || totalMark == null) {
			alert("Enter the total marks ! ");
			return false;
		} else if (passingmarks == 0 || passingmarks == null) {
			alert("Enter the passing marks! ");
			return false;
		} else if (parseInt(passingmarks) > parseInt(totalMark)) {
			alert("Passing marks should not be greater than total marks");
			return false;
		}

		totalMark1 = parseInt(totalMark);
		givenquestion1 = parseInt(givenquestion);
     	var markperquest = totalMark1 / givenquestion1;
		if (re2.test(markperquest)) {
			alert("Please change total marks or number of questions!");
			return false;
		}
		/*var marks = parseInt(document.getElementById("totalmrk").innerHTML);
		if (markperquest < marks) {
			alert("You have to add more questions.");
			document.getElementById("btnsave").disabled = true;
			document.getElementById("btnaddtopic").disabled = false;
			document.getElementById("markperquest").innerHTML = markperquest;
			return false;
		}
		if (markperquest > marks) {
			alert("Sorry! You have entered less question's");
			return false;
		}*/

		if(parseInt(document.getElementById("totalquestioncnt").value) < givenquestion1){
			document.getElementById("btnsave").disabled = true;
			if(jQuery('#testType').val() == 0){
		    	document.getElementById("btnaddtopic").disabled = false;
		    	jQuery('#btnaddtopic').css('opacity','1');
		    	jQuery('#btnaddquestions').css('opacity','0.6');
			}else if(jQuery('#testType').val() == 1){
			   document.getElementById("btnaddquestions").disabled = false;
			   jQuery('#btnaddtopic').css('opacity','0.6');
		       jQuery('#btnaddquestions').css('opacity','1');
			}
			document.getElementById("markperquestion").innerHTML = markperquest;
			alert("You have to add more questions.");
			return false;
		}
		
		var frm = document.forms["QuestionPaperForm"];
		//frm.perquestionmarks.value = document.getElementById("markperquest").innerHTML;
		frm.submit();
		}
	}
	function deletedocument(tid,fname) {
		if(confirm('Are you sure you want to delete the document?')){
			$.post("deleteexamdoc.do?check", {
				tid : tid,
				fname : fname,
				opr : "req"
			}, function(data) {
				if (data == null) {
					alert("Error while deleting document...");
				} else {			
					if(data == 'success'){
						$("#showdoc").html("");
						alert("Document deleted successfully.");
					}
				}
			});
	 	}
	}
</script>

</head>

<body>
	<%
		request.setAttribute("menu", "Test");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" class="active">Question Paper</a></li>
					<li><a href="<%=request.getContextPath()%>/schdultestlist.do?operation=LIST">Scheduled Exam</a></li>
				</ul>
				<div class="sidebar_note message note">
				<p>Combine questions from different categories and complexities to create a complete Question Paper.</p>
				<p>
					1. Company ABC created a "First Round" question paper by selection 10 questions from aptitude, 10 from Analytical and 10 from Logical Categories each.
					Company ABC then schedules exams every time they have walk in  interviews.
					</p>
					<p>
					2. College XYZ have questions organized in categories "additions", "Multiplication" and "Division". Question paper "Maths" created using 25 questions from each of these categories and exam is scheduled every year using same question paper.
					</p>
					<p>
					Note: You can choose categories while creating Question papers. Actual questions are selected randomly at the time of actual exam. Hence each question paper is unique in terms of question and order of questions.	
					</p>
				</div>
			</div>
			<div id="main">
				<h3>Create Question Paper</h3>
				<hr />
				<div id="q_bank4">
					<html:form action="QuestionPaper" enctype="multipart/form-data">
						<div style="width: 100%; float: left;">
						 <div id="QuestionPaper">
								<p>
									<label>Name of Question Paper:</label>
									<html:text property="testname" styleId="testname" value="${dtoObj.testName}"/> 
									<small>Required</small>
									</p>
									<p>
									<label>Duration:</label>
									<html:select property="duration" value="${dtoObj.duration}">
											<html:option value="15">15 Minutes </html:option>
											<html:option value="30">30 Minutes</html:option>
											<html:option value="45">45 Minutes</html:option>
											<html:option value="60">60 Minutes</html:option>
											<html:option value="90">90 Minutes</html:option>
											<html:option value="120">120 Minutes</html:option>
											<html:option value="150">150 Minutes</html:option>
											<html:option value="180">180 Minutes</html:option>
											<html:option value="210">210 Minutes</html:option>
											<html:option value="240">240 Minutes</html:option>
										</html:select>  
									<small>Required</small>
								</p>
								<p>
									<label>No Of Questions:</label>
									<html:text property="noofquestions" styleId="numberquestiongiven"
											onkeypress="return numbersonly(event)" value="${dtoObj.noOfQuestions}" onblur="calculateMark();"/> 
									<small>Required</small>
									</p>
								<p>
								<label>Marks per question:</label>
									<html:text property="perquestionmarks"
											onblur="calculateMark();" 
											styleId="markperquestion"
											onkeypress="return numbersonly(event)" value="${dtoObj.perQuestionMarks}"/>
										<logic:present name="topicObj">
											<html:hidden property="opr" value="edit" />
										</logic:present>
										<logic:notPresent name="topicObj">
											<html:hidden property="opr" value="add" />
										</logic:notPresent> 
									<small>Required</small>
									</p>
								<p>
									<label>Total Marks:</label>
									<html:hidden property="totalmarks" styleId="totalmarks" value="${dtoObj.totalMarks}"/>
										<span id="totalmrk">${dtoObj.totalMarks}</span>
								</p>
								<p>
									<label>Passing Marks:</label>
									<html:text property="passingmarks" 
											styleId="passingmarks" onkeypress="return numbersonly(event)" value="${dtoObj.passingMarks}"/> 
									<small>Required</small>
									</p>
								<p>
								<label>Marks per wrong answer:</label>
									<html:text property="negativemarks" styleId="negativemarks"
											onkeypress="return numbersonly(event)" value="${dtoObj.negativeMarks}"/> 
										<small class="more_info">(0 for no negative marking)</small>
								</p>
								
								<p>
								<label></label>
								<html:button property="Add Topic" styleId="btnaddtopic"
								onclick="showDialog();" styleClass="btn_green">Manage Questions by Category</html:button>
								<html:button property="Select Questions" styleId="btnaddquestions"
								onclick="showQuestionDialog();" styleClass="btn_green">Choose Individual Questions</html:button>
								<br><label></label><small class="more_info">(Choose anyone option while creating the Question Paper)</small>
								
								</p>
							</div>
							<input type="hidden" id ="totalquestioncnt" value="<bean:write name="totalQuestionCount"/>"/>
								<!-- left end -->
							
							
						</div>						
						<div id="selectedtopic" style="float:left; width: 100%; margin-bottom: 20px;">
						<logic:present name="dtoObj">
							<logic:present name="topicObj">
							<bean:size id="topicListSize" name="topicObj"/>
							<%boolean displayDelete = false; %>
								<h6 style="margin:40px 0 0 0;">Questions Added to Question Paper</h6>
								<center><table border='1' width='400' class="display">
									<tr><th>Category</th><th>Sub Category</th><th>Complexity</th><th>Questions</th><th>Option</th></tr>
								<logic:iterate id="topics" name="topicObj">
									<tr>
										<td><bean:write name="topics" property="subjectName" filter="true"/></td>
										<td><bean:write name="topics" property="topicname" filter="true"/></td>
										<td><bean:write name="topics" property="levelName" filter="true"/></td>
										<td align='center'><bean:write name="topics" property="questioncount" filter="true"/></td>
										<logic:equal name="dtoObj"  property="testType" value="0">
									    	<td><a href='#' onclick='deleteTopic(<bean:write name="topics" property="subjectid"/>,${dtoObj.testType})'><img title="Delete" src="<%=request.getContextPath()%>/images/delete.png"> </a></td>
										</logic:equal>
										<logic:equal name="dtoObj"  property="testType" value="1">
											<%
											if (!displayDelete) {
											%>
											<td style="padding: 5px 10px 10px 40px;" rowspan="<bean:write name="topicListSize"/>"><a href='#' onclick='deleteqid(${dtoObj.testType})'><img title="Delete"src="<%=request.getContextPath()%>/images/delete.png"></a></td>
											<%displayDelete = true; 
								         }%>
										</logic:equal>
									</tr>
								</logic:iterate>
								</table></center>
							</logic:present>
						</logic:present>
						</div>
						<div style="margin: 10px auto;">
							<h6>Additional Comments to be shown before Exam Starts:</h6>
							<html:textarea property="comments" styleId="comments" cols="80" rows="10" style="width: 90%;" value="${dtoObj.comments}"></html:textarea>
						</div>
						<div style="margin: 10px auto;">
							<h6>Upload Exam Information document or Provide video URL</h6>
							<html:file property="examInfoFile"></html:file>  &nbsp;&nbsp; OR &nbsp;&nbsp; 
							<html:text property="videoURL" placeholder="Provide Video URL" size="40" value="${dtoObj.videoURL}"/> <small>(You can provide the video links of Youtube or Vimeo or such alike.)</small>
							<br><logic:present name="dtoObj">
								<logic:notEmpty name="dtoObj" property="examInfoFile">
									<div id="showdoc">
									<a href="<%=request.getContextPath()%>/uploads/examinfo/${dtoObj.examInfoFile}" target="_new">View Document</a>&nbsp;&nbsp;
									<a href="javaScript:deletedocument('${dtoObj.testId}','${dtoObj.examInfoFile}');"><img src="<%=request.getContextPath()%>/images/delete.png" title="Delete"></a>
									</div>
								</logic:notEmpty>
							</logic:present>
						</div>
						<div>
							<html:hidden property="edittestid" value="${dtoObj.testId}"/>
							<html:hidden property="selectedQuestions" styleId="selectedQuestions"/>	
							<html:hidden property="testType" styleId ="testType" value="${dtoObj.testType}"/>
							<html:submit styleId="btnsave" onclick="doSubmit();return false;" styleClass="btn_green">Save Question Paper</html:submit>
								
						</div>
						<div id="dialog"></div>
					</html:form>
				</div>
			</div>
		</div>
		</div>
<script type="text/javascript">
	new nicEditor().panelInstance('textarea1');
</script>
<logic:present name="topicObj">
	<script>
		document.getElementById("btnaddtopic").disabled = true;	jQuery('#btnaddtopic').css('opacity','0.6');jQuery('#btnaddtopic').css('cursor','default');
		document.getElementById("btnaddquestions").disabled = true; jQuery('#btnaddquestions').css('opacity','0.6');jQuery('#btnaddtopic').css('cursor','default');
	</script>
</logic:present>
<logic:present name="dtoObj">
<logic:notEmpty name="dtoObj" property="selectedQuestions">
	<script>document.getElementById("btnaddquestions").disabled = true; jQuery('#btnaddquestions').css('opacity','0.6'); jQuery('#btnaddquestions').css('cursor','default');</script>
</logic:notEmpty>
</logic:present>
<script type="text/javascript">
	$(document).ready(function() {		
		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	} );
</script>	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
