
function setiframe(resultid){
	var result = window.open("detailresult.do?resultid="+resultid, "Detail Result", "width=1000px, height=600px");
	result.focus();
}
  
function dopage(page,op){
	     document.forms['ReportForm'].operation.value ="user";
         document.forms['ReportForm'].startPage.value = page;  
		 document.forms['ReportForm'].submit();
}


