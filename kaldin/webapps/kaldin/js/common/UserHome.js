	history.go(1);
	function printWin() {
		frm = document.forms[0];
        var URL = "/detailresult";
        window.open(URL, "Reports", "scrollbars=yes,resizable=yes,width=900,height=650");
    }
	function setiframe(resultid){
		
		var str="<iframe height='300' width='100%' src='' name='report' id='testyiframe'></iframe>";		
		 document.getElementById("iframe").innerHTML=str;
		 
		 document.getElementById("testiframe").src="detailresult.do?resultid="+resultid;
	}
		 