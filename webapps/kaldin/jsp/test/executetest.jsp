<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><logic:present name="TestName"><bean:write name="TestName" filter="true"/></logic:present> - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/customInput.jquery.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.7.2.custom.min.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/feedback/feedback.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/feedback/jquery.browser.min.js?dt=19aug2013"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js?dt=22jan2014"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn-complete.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn._MediaElementProto.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.HTMLYouTubeVideoElement.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.code.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.HTMLSoundCloudAudioElement.js"></script>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn-ie8.min.js"></script> --%>

<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--> 
<script type="text/javascript">
	history.go(1);
	var secs;
	var totalsecs;
	var mins;
	var timerID = null;
	var timerRunning = false;
	var delay = 1000;

	function InitializeTimer() {
		count = 10;
		totalsecs = "${TestTime}";
		StopTheClock();
		StartTheTimer();
	}

	function StopTheClock() {
		if (timerRunning)
			clearTimeout(timerID);
		timerRunning = false;
	}

	function StartTheTimer() {
		if (totalsecs == 0 || totalsecs < 0) {
			StopTheClock();
			alert("Time Over for the Exam. After clicking on OK button, Exam will be submitted. Thank you.")
			window.onbeforeunload = null;	
			var frm = document.forms["TestQuestionForm"];
			frm.operation.value = "finish";
			frm.submit();
		} else {
			self.status = totalsecs;
			totalsecs = totalsecs - 1;
			mins = parseInt(totalsecs / 60,10);
			secs = totalsecs % 60;
			
			if(secs < 10 )
				secs = "0" + secs;
			if(mins < 10 )
				mins = "0" + mins;

			document.getElementById("timerId").innerHTML = "" + mins + " : " + secs + "";
			timerRunning = true
			timerID = self.setTimeout("StartTheTimer()", delay);
		}
	}
	function gotoquestion(qid,indid) {
		window.onbeforeunload = null;
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "gotoquestion";
		frm.nextQuestid.value=qid;
		frm.index.value = indid;
		frm.currentime.value = totalsecs;
		frm.submit();
	}
	function NextSubmit() {
		window.onbeforeunload = null;		
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "next";
		frm.currentime.value = totalsecs;
		frm.submit();
	}
	function PrevSubmit() {
		window.onbeforeunload = null;		
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "prev";
		frm.currentime.value = totalsecs;
		frm.submit();
	}
	function FinishSubmit() {
		window.onbeforeunload = null;		
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "finish";
		if (confirm('This will end the Exam and you will not be able to recheck your questions.	\nDo you still want to end Exam?', 'Confirmation')) {
			frm.submit();
		}
	}
	function PreviewSubmit() {
		window.onbeforeunload = null;		
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "preview";
		frm.currentime.value = totalsecs;
		frm.submit();
	}
	function SaveSubmit() {
		window.onbeforeunload = null;		
		var frm = document.forms["TestQuestionForm"];
		frm.operation.value = "previwsave";
		frm.currentime.value = totalsecs;
		frm.submit();
	}
</script>
	<style>
	.ui-progressbar .ui-progressbar-value { background-image: url(images/pbar-ani.gif); }
	.ui-progressbar { height:2em; text-align: left; overflow: hidden; }
	.ui-progressbar .ui-progressbar-value {margin: 0; height:100%; }
	</style>
</head>
<body onload="InitializeTimer();">
<%response.addHeader("X-FRAME-OPTIONS","SAMEORIGIN");%>
	<div id="wrapper">
		<%String publicexam = (String) request.getSession().getAttribute("publicexam") == null ? "0" : "1"; 
		if(publicexam.equals("1")){
		%>
			<div id="header">
		    <logic:notPresent name="logo">
		    <h1><a href="<%=request.getContextPath()%>/userhome.do"><img src="<%=request.getContextPath()%>/uploads/logos/logo-blue.png" alt="kaldin" /></a></h1>
		    </logic:notPresent>
		    <logic:present name="logo">
		    <h1><a href="<%=request.getContextPath()%>/userhome.do"><img id="clogo" src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></a></h1>
		    </logic:present>
				<ul id="nav">
					<li><logic:present name="LogedUser">
						</logic:present> 
						<logic:notPresent name="LogedUser">
							<jsp:forward page="/jsp/common/index.jsp"></jsp:forward>
						</logic:notPresent>
					</li>
					<li><a title="Logout"></a></li>
				</ul>
		</div>
		<% } else { %>
			<%@ include file="/jsp/common/headerall.jsp"%>
		<% } %>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
						<li>Total Questions <span> <logic:present name="TotalCount">
									<bean:write name="TotalCount" filter="true" />
								</logic:present>
						</span>
						</li>
						<li>Attempted Questions <span> <logic:present name="AttemptedCount">
									<bean:write name="AttemptedCount" filter="true" />
								</logic:present></span>
						</li>
						<li>Remaining Questions <span> <logic:present name="RemainingCount">
									<bean:write name="RemainingCount" filter="true"/>
								</logic:present>
						</span>
						</li>
					</ul>
					
					
				<p class="timer" id="timerId"></p>
				<div id="progressbar"></div>
				
				<div class="message note" id="qs" style="min-height: 200px;padding:5px;"><p>Question Status</p>
					<ul id="qslist" class="ui-menu ui-widget">
						<li class="status4">For Review <logic:present name="qsa">(<bean:write name="qsm"/>)</logic:present></li>
						<li class="status1">Skipped <logic:present name="qsa">(<bean:write name="qss"/>)</logic:present></li>
						<li class="status2">Attempted <logic:present name="qsa">(<bean:write name="qsa"/>)</logic:present></li>
						<li class="status3">Current</li>
						<li class="status5">All</li>
					</ul>
				</div>
				</div>
			<div id="main">
					<h3>
						<logic:present name="TestName">
							<bean:write name="TestName" filter="true" />
						</logic:present>
					</h3>
					<hr />
				<div id="test_start" style="margin: 0 0 -10px;">
					<logic:present name="Question">
						<html:form action="TestQuestionAction" styleId="tqf">
							<html:hidden property="position"></html:hidden>
							<div id="mainquestdiv">
								<div class="q">
								<table>
								<tr>
								<logic:present name="index">
									<td valign="top" style="border:0;important!" width="20px;"><SPAN><bean:write name="index"/>)</SPAN></td>
								</logic:present>
								<td valign="top" style="border:0;important!"><bean:write name="Question" property="question" filter='false' /></td>
								</tr>
								</table>
								</div>
								<logic:equal name="Question" property="questionType" value="1">
									<div id="audiourl" style="color:#fff;height:100px; width:600px;margin-top:50px;" align="left">
										<audio id="my-audio" controls autoplay="autoplay" preload="auto">
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/mpeg;codecs="mp3"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/ogg;codecs="vorbis"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/wav;codecs="wav"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/mp4;codecs="m4a"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/ogg;codecs="ogg"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/ogg;codecs="oga"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/webm;codecs="webma"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/wave;codecs="wav"'>
											<source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/x-wav;codecs="wav"'>
										    <source src="<bean:write name="Question" property="questionURL" filter='false'/>" type='audio/x-pn-wav;codecs="wav"'>
										</audio>
									</div>
								</logic:equal>
								<logic:equal name="Question" property="questionType" value="2">
									<div id="videourl" style="color:#fff;height:350px; width:600px;">
										<div id="video" style="height:350px; width:600px;"></div>
										<div id="footnotediv"></div>
									</div>
								</logic:equal>
								<logic:notPresent name="Subjective">
								<ul class="ans">
									<li>
										<logic:notPresent name="MultiSelect">
		 								<p class="custom-radio">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													A)
													</td>
													<td valign="top" style="border:0;important!"> 
													<html:hidden property="multiselect" value="0" />
													<html:radio property="answer" value="A" styleId="optionA"></html:radio>
													<label for="optionA" class="" style="text-align: left;"></label><bean:write name='Question' property='optionA' filter="false"/>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:notPresent>
										<logic:present name="MultiSelect">
											<p class="custom-checkbox">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													A)
													</td>
													<td valign="top" style="border:0;important!">
													<html:hidden property="multiselect" value="1" />
													<html:multibox property="multiAnswer" value="A" styleId="mltchA" />
													<label for="mltchA" class="" style="text-align: left;"></label><bean:write name='Question' property='optionA' filter="false"/>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:present></li>

									<li>
										<logic:notPresent name="MultiSelect">
											<p class="custom-radio">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													B)
													</td>
													<td valign="top" style="border:0;important!">
													<html:hidden property="multiselect" value="0" />
													<html:radio property="answer" value="B" styleId="optionB"></html:radio>
													<label for="optionB" class="" style="text-align: left;"></label><bean:write name='Question' property='optionB' filter="false"/>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:notPresent>
										<logic:present name="MultiSelect">
											<p class="custom-checkbox">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													B)
													</td>
													<td valign="top" style="border:0;important!">
													<html:hidden property="multiselect" value="1" />
													<html:multibox property="multiAnswer" value="B" styleId="mltchB" />
													<label for="mltchB" class="" style="text-align: left;"></label><bean:write name='Question' property='optionB' filter="false"/>
													</td>
												</tr>
											</table>
											</p>
										</logic:present>
									<logic:notEmpty name="Question" property="optionC">


									<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">
														C) 
														</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="0" />
														<html:radio property="answer" value="C" styleId="optionC"></html:radio>
														<label for="optionC" class="" style="text-align: left;"></label><bean:write name='Question' property='optionC' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">
														C) 
														</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="1" />
														<html:multibox property="multiAnswer" value="C" styleId="mltchC" />
														<label for="mltchC" class="" style="text-align: left;"></label><bean:write name='Question' property='optionC' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
									</li>

									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionC">

									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionD">

										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">D)</td>
														<td valign="top" style="border:0;important!"> 
														<html:hidden property="multiselect" value="0" />
														<html:radio property="answer" value="D" styleId="optionD"></html:radio>
														<label for="optionD" class="" style="text-align: left;"></label><bean:write name='Question' property='optionD' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">D)</td>
														<td valign="top" style="border:0;important!">  
														<html:hidden property="multiselect" value="1" />
														<html:multibox property="multiAnswer" value="D" styleId="mltchD" />
														<label for="mltchD" class="" style="text-align: left;"></label><bean:write name='Question' property='optionD' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:present></li>

									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionD">


									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionE">

									<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">E)</td>
														<td valign="top" style="border:0;important!">  
														<html:hidden property="multiselect" value="0" />
														<html:radio property="answer" value="E" styleId="optionE"></html:radio>
														<label for="optionE" class="" style="text-align: left;"></label><bean:write name='Question' property='optionE' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">E)</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="1" />
														<html:multibox property="multiAnswer" value="E" styleId="mltchE" />
														<label for="mltchE" class="" style="text-align: left;"></label><bean:write name='Question' property='optionE' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
									</li>
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionE">



									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionF">

										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">F)</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="0" />
														<html:radio property="answer" value="F" styleId="optionF"></html:radio>
														<label for="optionF" class="" style="text-align: left;"></label><bean:write name='Question' property='optionF' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent> 
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">F)</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="1" />
														<html:multibox property="multiAnswer" value="F" styleId="mltchF" />
														<label for="mltchF" class="" style="text-align: left;"></label><bean:write name='Question' property='optionF' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
										</li>
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionF">
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionG">

										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">G)</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="0" />
														<html:radio property="answer" value="G" styleId="optionG"></html:radio>
														<label for="optionG" class="" style="text-align: left;"></label><bean:write name='Question' property='optionG' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent> <logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">G)</td>
														<td valign="top" style="border:0;important!">
														<html:hidden property="multiselect" value="1" />
														<html:multibox property="multiAnswer" value="G"	styleId="mltchG" />
														<label for="mltchG" class="" style="text-align: left;"></label><bean:write name='Question' property='optionG' filter="false"/>
														</td>
													</tr>
												</table>
												</p>
											</logic:present></li>
									</logic:notEmpty>									
								</ul>
								</logic:notPresent>
									
								<logic:present name="Subjective">
									<table>
										<tr>
											<td width="20px;" valign="top" style="border:0;important!">Answer</td>
											<td valign="top" style="border:0;important!">
											<html:hidden property="multiselect" value="0" />
											<html:textarea property="answer" cols="60" rows="3"></html:textarea>											
											</td>
										</tr>
									</table>
								</logic:present>
								
								<logic:notEmpty name="Question" property="optionG"></logic:notEmpty>
								
								<table>
									<tr>
										<td width="20px;" valign="top" style="border:0;important!"></td>
										<td valign="top" style="border:0;important!">
										<html:checkbox property="checklater" styleId="checklater"></html:checkbox>
											<label for="checklater" class="" style="text-align: left;"></label>
											<span  style="display: block; padding-top: 6px;">Mark to Review Later</span>
										</td>
									</tr>
								</table>
												
								<logic:notEmpty name="Question" property="questionHint">
									<div class="message info" style="float:left; width: 98%;">
						         	Hint:<br/><bean:write name="Question" property="questionHint" filter="false" /></div>
						        </logic:notEmpty>

								<html:hidden property="operation" />
								<html:hidden property="currentime" />
								<html:hidden property="questid" value="${Question.questionid}" />
								<html:hidden property="nextQuestid" />
								<html:hidden property="index" />
							</div>
						</html:form>
						<script>
							history.go(1);
							<logic:present name="ReviwAns">
							if ("${ReviwAns}" == "A") {
								document.getElementById("optionA").checked = true;
							} else if ("${ReviwAns}" == "B") {
								document.getElementById("optionB").checked = true;
							} else if ("${ReviwAns}" == "C") {
								document.getElementById("optionC").checked = true;
							} else if ("${ReviwAns}" == "D") {
								document.getElementById("optionD").checked = true;
							} else if ("${ReviwAns}" == "E") {
								document.getElementById("optionE").checked = true;
							} else if ("${ReviwAns}" == "F") {
								document.getElementById("optionF").checked = true;
							} else if ("${ReviwAns}" == "G") {
								document.getElementById("optionG").checked = true;
							}
							</logic:present>
							var answer = "";

							<logic:present name="ReviwMultipleAns">
							<logic:iterate id="RwAns" name="ReviwMultipleAns">
							var selectedchoice = "${RwAns}";
							answer += "," + selectedchoice

							</logic:iterate>
							ans = answer.split(",");
							if (ans[1] == "A") {
								document.getElementById("mltchA").checked = true;
							}
							if (ans[2] == "B") {
								document.getElementById("mltchB").checked = true;
							}

							if (ans[3] == "C") {
								document.getElementById("mltchC").checked = true;
							}
							if (ans[4] == "D") {
								document.getElementById("mltchD").checked = true;
							}
							if (ans[5] == "E") {
								document.getElementById("mltchE").checked = true;
							}
							if (ans[6] == "F") {
								document.getElementById("mltchF").checked = true;
							}
							if (ans[7] == "G") {
								document.getElementById("mltchG").checked = true;
							}
							</logic:present>
							<logic:present name="checklater">
								document.getElementById("checklater").checked = true;
							</logic:present>
						</script>
					</logic:present>
					
				</div>
				<!--TEST START ENDS HERE-->
				
				<div class="test_btns">
					<div style="width:70%;margin-left: 25px;padding-right: 30px;" id="qsbtnlist">
						<ul>	
						<logic:iterate name="qstatusList" id="qstatusList">
							<li><a href="#" onclick="gotoquestion(<bean:write name="qstatusList" property="questionid"/>,<bean:write name="qstatusList" property="index"/>);" class="status<bean:write name="qstatusList" property="status"/>"><bean:write name="qstatusList" property="index"/></a></li>
						</logic:iterate>
						</ul>
					</div>
					<div style="width: 100%; vertical-align: top; float: right; text-align: right; margin: 45px;">
<%-- 						<logic:present name="Back"> --%>
<!-- 							<a href="#" onclick="SaveSubmit()" class="btn_green">Save</a> -->
<%-- 						</logic:present> --%>
						<logic:present name="prevstatus">
							<logic:equal value="prev" name="prevstatus">
								<button onclick="PrevSubmit();" class="btn_blue">Previous</button>
							</logic:equal>
						</logic:present>
						
						<logic:present name="nextstatus">
							<logic:equal value="finish" name="nextstatus">
								<button onclick="FinishSubmit()" class="btn_red" type="button"> Finish</button>
<!-- 								<a href="#" onclick="SaveSubmit()" class="btn_green">Save</a> -->
							</logic:equal>
							<logic:equal value="next" name="nextstatus">
								<button onclick="NextSubmit();" class="btn_green"> Next</button>
							</logic:equal>
						</logic:present>
						<button class="btn_orange" style="margin-left: 20px;" onclick="PreviewSubmit()">View Attempted Questions</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
 // Run the script on DOM ready:
 $(function(){
 	$('input').customInput();
 	Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
 	$('ul#qslist li').click(function () {
        var filterVal = $(this).attr('class');
        $('#qsbtnlist li a').show();
        $('#qsbtnlist li a').each(function () {
        	currentClass = $(this).attr('class'); 
            if (currentClass == filterVal) {
            	$(this).show();
            } else if(filterVal == 'status5'){
            	$('#qsbtnlist li a').show();
            	return false;
            }else {
            	$(this).hide();
            }
        });
        return false;
    });
 });
 </script>
<script>
$(function() {
	var aq = '<bean:write name="AttemptedCount" />';
	var tq = '<bean:write name="TotalCount" />';
	var progress = (aq/tq)*100;
	$("#progressbar").progressbar({
		value: progress
	});
});
window.onbeforeunload = confirmExit;
function confirmExit(){
    var frm = document.forms["TestQuestionForm"];
	frm.operation.value = "close";
	frm.currentime.value = totalsecs;
	$("#tqf").ajaxForm( { }).submit();
  	return "You have attempted to leave the Exam. Are you sure you want to end the exam before finishing?";
}

</script>

<logic:equal name="Question" property="questionType" value="2">
<script type="text/javascript">
var videoSrc = "${Question.questionURL}";
jQuery(document).ready(function(){
	var wrapper = '';
	//wrapper = Popcorn.smart('#video',videoSrc);
	if(videoSrc.indexOf("youtube.com") > -1 || videoSrc.indexOf("youtu.be") > -1){
	   wrapper = Popcorn.HTMLYouTubeVideoElement('#video');
	   wrapper.src = videoSrc;
	}else{
	   wrapper = Popcorn.smart('#video',videoSrc);
	}
   var pop = Popcorn( wrapper );
   pop.autoplay(true);
});
</script>
</logic:equal>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>