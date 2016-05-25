<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Preview - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/timer.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/customInput.jquery.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.7.2.custom.min.js?dt=19aug2013"></script>
<script>
history.go(1);
var secs
var totalsecs
var mins
var timerID = null
var timerRunning = false
var delay = 1000
function InitializeTimer()
{
    count=10;
    totalsecs ="${TestTime}";
    StopTheClock();
    StartTheTimer();
}
function StopTheClock()
{
    if(timerRunning)
        clearTimeout(timerID);
    timerRunning = false;
}
function StartTheTimer()
{
    if (totalsecs==0 || totalsecs < 0)
    {
        StopTheClock();
        alert("You have to submit!");
        var frm=document.forms["TestQuestionForm"];
		frm.operation.value="finish";
		frm.submit();
    }
    else
    {
        self.status = totalsecs;
        totalsecs = totalsecs - 1;
       	mins=parseInt(totalsecs/60,10);
       	secs=totalsecs%60;
       	
       	if(secs < 10 )
			secs = "0" + secs;
		if(mins < 10 )
			mins = "0" + mins;
      
		document.getElementById("timerId").innerHTML=""+mins+" : "+secs+"";
        timerRunning = true
        timerID = self.setTimeout("StartTheTimer()", delay)
    }
}

function dosubmit(questionid)
{
	var frm=document.forms[1];
	frm.questid.value=questionid;
	frm.operation.value="previewone"	
	frm.currentime.value=totalsecs;
	frm.submit();
}
function doResume()
{
	var frm=document.forms[1];
	frm.operation.value="resumetest";
	frm.currentime.value=totalsecs;
	frm.submit();	
}

function FinishSubmit()
{
	var frm=document.forms[1];
	frm.operation.value="finish";
	frm.position.value="preview";
	if(confirm('Do you want to end test?','Confirmation')){
		frm.submit();
	}
}
function dopage(page,op){
	document.forms[1].operation.value ="preview";
    document.forms[1].startPage.value = page;
    document.forms[1].submit();
}
</script>
<style>
.ui-progressbar .ui-progressbar-value {
	background-image: url(images/pbar-ani.gif);
}

.ui-progressbar {
	height: 2em;
	text-align: left;
	overflow: hidden;
}

.ui-progressbar .ui-progressbar-value {
	margin: 0;
	height: 100%;
}
</style>
</head>

<body onload="InitializeTimer();">
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li>Total Questions <span> <logic:present
								name="TotalCount">
								<bean:write name="TotalCount" filter="true" />
							</logic:present>
					</span>
					</li>
					<li>Attempted Questions <span> <logic:present
								name="AttemptedCount">
								<bean:write name="AttemptedCount" filter="true" />
							</logic:present>
					</span>
					</li>
					<li>Remaining Questions <span> <logic:present
								name="RemainingCount">
								<bean:write name="RemainingCount" filter="true" />
							</logic:present>
					</span>
					</li>
				</ul>
				<p class="timer" id="timerId"></p>
				<div id="progressbar"></div>
				<p class="align"><br><br>
				</p>
			</div>
			<div id="main">
				<h3>
					<logic:present name="TestName">
						<bean:write name="TestName" filter="true" />
					</logic:present>
				</h3>
				<hr />
				<div id="view_test">
					<div id="mainquestdiv">
						<table>
						<logic:present name="QuestAnsList">
							<logic:iterate id="quest" name="QuestAnsList">
								<tr>
									<td valign="top">
										<div class="q" >
											<bean:write name="quest" property="index" /> ) <bean:write name="quest" property="question" filter="false" />
										</div>
									</td>
									<td>
										<html:form action="previewall">
											<html:hidden property="questid" />
											<html:hidden property="currenttime"></html:hidden>
											<div style="float: left;">
												<html:link href="#"
													onclick="dosubmit(${quest.questionid});return false;"
													styleId="widget" styleClass="btn_orange_sml"> Preview </html:link>
											</div>
										</html:form>
									</td>
									<td>
										<logic:notEmpty name="quest" property="givenAnswer">
											<logic:equal name="quest" property="givenAnswer"
												value=",,,,,,,">
												<span class="notgiven">Not Given</span>
											</logic:equal>
											<logic:notEqual name="quest" property="givenAnswer"
												value=",,,,,,,">
												<span class="given">Given</span>
											</logic:notEqual>
										</logic:notEmpty>
										<logic:empty name="quest" property="givenAnswer">
											<span class="notgiven">Not Given</span>
										</logic:empty>
									</td>
								</tr>
								<html:form action="TestQuestionAction">
									<html:hidden property="questid"></html:hidden>
									<html:hidden property="operation"></html:hidden>
									<html:hidden property="currentime"></html:hidden>
									<html:hidden property="startPage"></html:hidden>
									<html:hidden property="position"></html:hidden>
								</html:form>
							</logic:iterate>
						</logic:present>
						</table>
					</div>
					<!--Main Div ENDS HERE-->
				</div>
				<div class="paging">
					<%@ include file="/jsp/common/paging.jsp"%>
				</div>
				<p class="align">
					<button class="btn_green" onclick="doResume();return false;">Resume Exam</button>
				</p>
			</div>
		</div>
	</div>
<script>
$(function() {
	var aq = '<bean:write name="AttemptedCount" />';
	var tq = '<bean:write name="TotalCount" />';
	var progress = (aq/tq)*100;
	$("#progressbar").progressbar({
		value: progress
	});
});
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
