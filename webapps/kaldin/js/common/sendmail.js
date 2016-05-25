	function doSubmit()
	{
		
		frm = document.forms["SendMailForm"];
		var chks = document.getElementsByName('userId');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++){
			if (chks[i].checked){
				hasChecked = true;
				break;
			}
		}
		if (hasChecked == false){
			alert("Please select at least one Candidate for the exam.");
			return false;
		}
		frm.operation.value="send";		
		frm.submit();
	}
	 function dopage(page,op){			
	     document.forms["SendMailForm"].operation.value ="LIST";
         document.forms["SendMailForm"].startPage.value = page;
         document.forms["SendMailForm"].submit();
     }
	