var secs
var timerID = null
var timerRunning = false
var delay = 1000

function InitializeTimer()
{
   
    secs ="${TestTime}";
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
    if (secs==0)
    {
        StopTheClock()
        alert("You have to submit!")
    }
    else
    {
        self.status = secs
        secs = secs - 1
		document.getElementById("timerId").innerHTML="<b>Seconds Remaining :: " + secs+"</b>";
        timerRunning = true
        timerID = self.setTimeout("StartTheTimer()", delay)
    }
}
