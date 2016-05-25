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
    StopTheClock()
    StartTheTimer()
}

function StopTheClock()
{
    if(timerRunning)
        clearTimeout(timerID)
    timerRunning = false
}

function StartTheTimer()
{
    if (totalsecs==0)
    {
        StopTheClock()
        alert("You have to submit!")
        var frm=document.forms["TestQuestionForm"];
		frm.operation.value="finish";
		frm.submit();
    }
    else
    {
        self.status = totalsecs
        totalsecs = totalsecs - 1
       	mins=parseInt(totalsecs/60);
       	secs=totalsecs%60;
      
		document.getElementById("timerId").innerHTML="Time(mins) <b>"+mins+" : "+secs+"</b>";
        timerRunning = true
        timerID = self.setTimeout("StartTheTimer()", delay)
    }
}
function dosubmit(questionid)
{
	var frm=document.forms[0];
	frm.questid.value=questionid;
	frm.currenttime.value=totalsecs;
	frm.submit();
	
}
function doResume()
{
	var frm=document.forms[1];
	frm.operation.value="resumetest";
	frm.currentime.value=totalsecs;
	frm.submit();
	
}