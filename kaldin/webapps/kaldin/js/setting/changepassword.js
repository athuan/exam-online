function doSubmit()
{       
	   	var frm=document.forms[0];
	   	var pass1=frm.elements[1].value;
		var pass2=frm.elements[2].value;		
		if(pass1!=pass2){
			alert("password must be same.");
			frm.elements[1].value = '';
			frm.elements[2].value = '';
			return false;
		}else{
		frm.submit();
	}
}