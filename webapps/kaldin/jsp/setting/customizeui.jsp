<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Customize UI - Kaldin Online Exam to Evaluate Knowledge</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js?dt=22jan2014"></script>
<style>
.skin-color li { height: 60px;width: 120px;float: left;text-align: center; }
</style>
</head>
<body>
	<%
		request.setAttribute("menu", "Setting");
	%>

	<div id="wrapper">
	<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
		<%@ include file="/jsp/common/header.jsp"%>
	<%}else{ %>
		<%@ include file="/jsp/common/adminHeader.jsp"%>
	<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/emailtemplate.do">Email Templates</a></li>
					<li><a href="<%=request.getContextPath()%>/settings.do">Show Result</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User Profile Required</a></li>
					<li><a href="<%=request.getContextPath()%>/customizeui.do" class="active">Customize UI</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Upload your logo, choose your theme</p></div>
			</div>
			<div id="main">
				<h3>Customize UI</h3>
				<hr />
				<div style="height: 100px;">
					<div style="float:left;width:35%;padding-top: 20px;"><a href="javascript:showLogoupload();">Click here to change the Logo</a>
					<p>&nbsp;</p><p>The recommended logo size is of 175x50</p>
					</div>
					<div style="height: 80px;background-repeat: no-repeat;float: left; width: 65%; " id="mylogo"><img src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></div>
				</div>
				<hr />
				<div class="message info"><p>Mouse over on theme name to preview it</p>
                    	<p>Click on theme name to save as your default theme</p>
                </div>
				<div style="padding-top: 25px;height: 85px;">
					<div style="float: left;width: 35%;">Choose your theme style</div>
					<div style="float: left;width: 65%;"><ul class="skin-color">
	                        <li><a href="0"><div style="background-color: #fff; width: 110px; height: 60px; color: #000; 
	                        text-align: center; font-size: 1.2em; padding: 0px; margin: 0px; border: 1px solid #000;"><br>Default</div></a></li>
	                        <li><a href="1"><div style="background-color: #e3eef6; width: 110px; height: 60px; color: #3e85b5; 
	                        text-align: center; font-size: 1.2em; padding: 0px; margin: 0px; border: 1px solid #9fd0f1;"><br>Blue</div></a></li>
	                        <li><a href="3"><div style="background-color: #F8D6DA; width: 110px; height: 60px; color: red; 
	                        text-align: center; font-size: 1.2em; padding: 0px; margin: 0px; border: 1px solid red;"><br>Red</div></a></li>
	                        <li><a href="4"><div style="background-color: #DBF2B0; width: 110px; height: 60px; color: green; 
	                        text-align: center; font-size: 1.2em; padding: 0px; margin: 0px; border: 1px solid green;"><br>Green</div></a></li>
	                        <li><a href="5"><div style="background-color: #ECD7D7; width: 110px; height: 60px; color: brown; 
	                        text-align: center; font-size: 1.2em; padding: 0px; margin: 0px; border: 1px solid brown;"><br>Brown</div></a></li>
                    	</ul>
                    </div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div id="dialog" title="Upload your logo" style="display: none;">
				<p>The recommended logo size is of 175x50</p>
				<p>Please use PNG/JPG/GIF/BMP files only</p>
					<div class="progress" style="display: none;">
				        <div class="bar"></div>
				        <div class="percent">0%</div>
				    </div><p>&nbsp;</p>
				<form action="<%=request.getContextPath()%>/companylogo.do" id="imageform" method="post" enctype="multipart/form-data">
				<b>Upload your logo</b><input type="file" id="logoimg" name="logoimg"/>
				</form>
			</div>
	
		</div>
</div>
<script type="text/javascript" >
function showLogoupload(){
	$("#dialog").dialog({modal: true});
}
function setLogoImage(imagename){
	var urlString = "url('uploads/logos/" + imagename + "')";
	document.getElementById("mylogo").innerHTML = "";
	document.getElementById("clogo").src = "<%=request.getContextPath()%>/uploads/logos/"+imagename;
	document.getElementById("mylogo").style.backgroundImage = urlString;
}
function showBackground(responseText, statusText, xhr, $form){
	if(responseText == "Error"){
		alert("Problem while uploading your logo or invalid image format selected");
	}else{
		setLogoImage(responseText);
	}
	document.getElementById("logoimg").value = "";
	$(".progress").hide();
	$("#dialog").dialog('close');
}
$(document).ready(function() { 
	$('#logoimg').change(function() {
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
		$("#imageform").ajaxForm( {
			beforeSubmit: function() {
				var sFileName = logoimg.value;
	            if (sFileName.length > 0) {
	                var blnValid = false;
	                for (var j = 0; j < _validFileExtensions.length; j++) {
	                    var sCurExtension = _validFileExtensions[j];
	                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
	                        blnValid = true;
	                        break;
	                    }
	                }
	                if (!blnValid) {
	                    alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
	                    backgroundimg.value = "";
	                    return false;
	                }
	            }
	            return true;
			},
			uploadProgress: function(event, position, total, percentComplete) {
				$(".progress").show();
				var percentVal = percentComplete + '%';
		        bar.width(percentVal)
		        percent.html(percentVal);
			},
			success: showBackground
		}).submit();
	});
	
	// change skin color
	$('.skin-color a').click(function(){ 
		var tid = $(this).attr('href');
		$.post("companytheme.do?check", {
			tid : tid,
			opr : "req"
		}, function(data) {
			if (data == null) {
				alert("Theme change failed.");
			} else {			
				if(data == 'success'){
					if($('#themestyle').length > 0) {
						if(tid!='0') {
							$('#themestyle').attr('href','css/style.'+tid+'.css');	
						} else {
							$('#themestyle').remove();
						}
					} else {
						if(tid!='0') {
							$('head').append('<link id="themestyle" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.'+tid+'.css" type="text/css" />');
						}
					}				
				}
			}
		}); 
		return false;
	});
	$('.skin-color a').hover(function(){
		var s = $(this).attr('href');
		if($('#themestyle').length > 0) {
			if(s!='0') {
				$('#themestyle').attr('href','css/style.'+s+'.css');	
			} else {
				$('#themestyle').remove();
			}
		} else {
			if(s!='0') {
				$('head').append('<link id="themestyle" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.'+s+'.css" type="text/css" />');
			}
		}
		return false;
	});
});
function isValidDomain(courl){
	var letters = /^[0-9a-zA-Z]+$/;  
	if(courl.match(letters)){  
		return true;  
	}else {  
		return false;  
	} 
}
function config() {
	var courl = (document.getElementById("courl").value).trim();
	if(courl == ""){
		alert("Please enter the domain name");
		document.getElementById("courl").focus();
	 	return;
	} if(!isValidDomain(courl)){
		alert("Please enter valid domain name with alphabets or numbers only");
		document.getElementById("courl").focus();
		return;
	}else{
		$.post("customizeui.do?check", {
			courl : courl,
			opr : "req"
		}, function(data) {
				if(data == 'success'){
					alert("Domain name successfully configured.");
					$('#config').css('display','none');
					$('#domainURL').css('display','none');
					//document.getElementById("courl").readOnly=true;
					$('#domainName').html(courl+'.kaldin.com');
				}else{
					alert(data);
				}
		});
	}
}
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>