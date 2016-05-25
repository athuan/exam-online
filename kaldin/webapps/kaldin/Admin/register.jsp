<%@page import="com.kaldin.company.register.hibernate.CompanyHibernate"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.admin.register.page.title"/></title>
<meta name="description" content="Comprehensive examination software for conducting any type of exam including online exam, 
pre-screening for colleges, universities and companies" />
<meta name="keywords" content="open source examination software, pre-screening tests, test software, practice exams, Examinations, Evaluations, Exam Reports, Online free exams, Online exam software free, 
Software for online exam Online education and assessment software, Online Tests, About online examination, Free online examination, Exam test online, Online testing exam,
 Open source examination tool" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">

blank = function() {   
	var frm=document.forms[0];
	var fname=frm.firstName.value;
   	//var lname=frm.elements[1].value;
   	var cname=frm.companyName.value;	
    var uname=frm.userName.value;	
    //var pwd=frm.elements[4].value;	
    var cno=frm.contactNumber.value;
    //var add=frm.elements[6].value;		
    if(fname=="" || cname==""  || cno=="" || uname=="") {
      	alert('<bean:message key="jsp.admin.register.page.error1"/>');
      	return false;		
    } else {
    	if(ValidatePhone()){
   			frm.submit();
    	}
    }
}

function textvalid()
{
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  var allValid = true;
	  for (i = 0;  i < cname.length;  i++)
	  {
	  ch =cname.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
		frm.companyName.value="";
	  frm.companyName.focus();
	  return (false);
	  }
	  var illegalChars = /^[0-9]/;
	  if (illegalChars.test(cname))
	  {
		  alert('<bean:message key="jsp.admin.register.page.error3"/>');
		  frm.companyName.value="";
		  frm.companyName.focus();
	  }
 }

  function numericCtn()
   {
	  var frm=document.forms[0];
	  var cno=frm.contactNumber.value;
	  
	      var intCharCode;
      for (var i = 0; i < cno.length; i++)
           {
    	   intCharCode = cno.charCodeAt(i);  
    	   
          if (!((intCharCode >= 48 && intCharCode <= 57))) 
          {    
        	  alert('<bean:message key="jsp.admin.register.page.error4"/>');
        	  frm.contactNumber.value="";
              frm.contactNumber.focus(); 
         	  return false; 
        		
          }
          
       }
      if(cno.length != 10)
      {
    	  alert('<bean:message key="jsp.admin.register.page.error5"/>');
    	  frm.contactNumber.value="";
          frm.contactNumber.focus(); 
     	  return false; 
      } 
 }

  function textCname()
  {
	  var frm=document.forms[0];
	  var cname=frm.companyName.value;
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789";
	  var allValid = true;
	  for (i = 0;  i < cname.length;  i++)
	  {
	  ch =cname.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
		//frm.companyName.value="";
	  frm.companyName.focus();
	  return (false);
	  }
	  var illegalChars = /^[0-9]/;
	  if (illegalChars.test(cname))
	  {
		  alert('<bean:message key="jsp.admin.register.page.error3"/>');
		  frm.companyName.value="";
		  frm.companyName.focus();
	  }
   }
  function textLname()
  {
       
	  var frm=document.forms[0];
	  var lname=frm.elements[1].value;
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  var allValid = true;
	  for (i = 0;  i < lname.length;  i++)
	  {
	  ch =lname.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
		frm.elements[1].value="";
	  frm.elements[1].focus();
	  return (false);
	  }
	  var illegalChars = /^[0-9]/;
	  if (illegalChars.test(lname))
	  {
		  alert('<bean:message key="jsp.admin.register.page.error3"/>');
		  frm.elements[1].value="";
		  frm.elements[1].focus();
	  }
  }

  function textFname()
  {
	  var frm=document.forms[0];
	  var fname=frm.elements[0].value;
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  var allValid = true;
	  for (i = 0;  i < fname.length;  i++)
	  {
	  ch =fname.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
		frm.firstName.value="";
	  frm.firstName.focus();
	  return (false);
	  }
	  var illegalChars = /^[0-9]/;
	  if (illegalChars.test(fname))
	  {
		  alert('<bean:message key="jsp.admin.register.page.error3"/>');
		  frm.firstName.value="";
		  frm.firstName.focus();
	  }
  }

  function textAdd()
  {
       
	  var frm=document.forms[0];
	  var add=frm.elements[6].value;
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  var allValid = true;
	  for (i = 0;  i < add.length;  i++)
	  {
	  ch =add.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
		frm.elements[6].value="";
	  frm.elements[6].focus();
	  return (false);
	  }
     }
  function textPwd()
  {
       
	  var frm=document.forms[0];
	  var pwd=frm.elements[4].value;
	  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	  var allValid = true;
	  for (i = 0;  i < pwd.length;  i++)
	  {
	  ch =pwd.charAt(i);
	  for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
	  break;
	  if (j == checkOK.length)
	  {
	  allValid = false;
	  break;
	  }
	  }
	  if (!allValid)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error2"/>');
	  frm.elements[4].focus();
	  return (false);
	  }
	  if (pwd.length < 5)
	  {
	  alert('<bean:message key="jsp.admin.register.page.error6"/>');
		frm.elements[4].value="";
       	frm.elements[4].focus();
	  return (false);
	  }
	
     }
  function textUname()
  {  
	  var frm=document.forms[0];
	  var email=frm.userName.value;
	  var atpos=email.indexOf("@");
	  var dotpos=email.lastIndexOf(".");
	  if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
		{
		  alert('<bean:message key="jsp.admin.register.page.error7"/>');
		  //frm.userName.value="";
          frm.userName.focus(); 
		  return false;
		 }
  }
  function setTimeZo()
  {
	  var jstz=function(){var b=function(a){a=-a.getTimezoneOffset();return a!==null?a:0},d=function(){return b(new Date(2010,0,1,0,0,0,0))},e=function(){return b(new Date(2010,5,1,0,0,0,0))},c=function(){var a=d(),b=e(),f=d()-e();if(f<0)return a+",1";else if(f>0)return b+",1,s";return a+",0"};return{determine_timezone:function(){var a=c();return new jstz.TimeZone(jstz.olson.timezones[a])},date_is_dst:function(a){var c=a.getMonth()>5?e():d(),a=b(a);return c-a!==0}}}();
	  jstz.TimeZone=function(){var b=null,d=null,e=null,c=function(a){e=a[0];b=a[1];d=a[2];if(typeof jstz.olson.ambiguity_list[b]!=="undefined")for(var a=jstz.olson.ambiguity_list[b],c=a.length,f=0,g=a[0];f<c;f+=1)if(g=a[f],jstz.date_is_dst(jstz.olson.dst_start_dates[g])){b=g;break}};c.prototype={constructor:jstz.TimeZone,name:function(){return b},dst:function(){return d},offset:function(){return e}};return c}();jstz.olson={};
	  jstz.olson.timezones=function(){return{"-720,0":["-12:00","Etc/GMT+12",!1],"-660,0":["-11:00","Pacific/Pago_Pago",!1],"-600,1":["-11:00","America/Adak",!0],"-660,1,s":["-11:00","Pacific/Apia",!0],"-600,0":["-10:00","Pacific/Honolulu",!1],"-570,0":["-09:30","Pacific/Marquesas",!1],"-540,0":["-09:00","Pacific/Gambier",!1],"-540,1":["-09:00","America/Anchorage",!0],"-480,1":["-08:00","America/Los_Angeles",!0],"-480,0":["-08:00","Pacific/Pitcairn",!1],"-420,0":["-07:00","America/Phoenix",!1],"-420,1":["-07:00",
	  "America/Denver",!0],"-360,0":["-06:00","America/Guatemala",!1],"-360,1":["-06:00","America/Chicago",!0],"-360,1,s":["-06:00","Pacific/Easter",!0],"-300,0":["-05:00","America/Bogota",!1],"-300,1":["-05:00","America/New_York",!0],"-270,0":["-04:30","America/Caracas",!1],"-240,1":["-04:00","America/Halifax",!0],"-240,0":["-04:00","America/Santo_Domingo",!1],"-240,1,s":["-04:00","America/Asuncion",!0],"-210,1":["-03:30","America/St_Johns",!0],"-180,1":["-03:00","America/Godthab",!0],"-180,0":["-03:00",
	  "America/Argentina/Buenos_Aires",!1],"-180,1,s":["-03:00","America/Montevideo",!0],"-120,0":["-02:00","America/Noronha",!1],"-120,1":["-02:00","Etc/GMT+2",!0],"-60,1":["-01:00","Atlantic/Azores",!0],"-60,0":["-01:00","Atlantic/Cape_Verde",!1],"0,0":["00:00","Etc/UTC",!1],"0,1":["00:00","Europe/London",!0],"60,1":["+01:00","Europe/Berlin",!0],"60,0":["+01:00","Africa/Lagos",!1],"60,1,s":["+01:00","Africa/Windhoek",!0],"120,1":["+02:00","Asia/Beirut",!0],"120,0":["+02:00","Africa/Johannesburg",!1],
	  "180,1":["+03:00","Europe/Moscow",!0],"180,0":["+03:00","Asia/Baghdad",!1],"210,1":["+03:30","Asia/Tehran",!0],"240,0":["+04:00","Asia/Dubai",!1],"240,1":["+04:00","Asia/Yerevan",!0],"270,0":["+04:30","Asia/Kabul",!1],"300,1":["+05:00","Asia/Yekaterinburg",!0],"300,0":["+05:00","Asia/Karachi",!1],"330,0":["+05:30","Asia/Kolkata",!1],"345,0":["+05:45","Asia/Kathmandu",!1],"360,0":["+06:00","Asia/Dhaka",!1],"360,1":["+06:00","Asia/Omsk",!0],"390,0":["+06:30","Asia/Rangoon",!1],"420,1":["+07:00","Asia/Krasnoyarsk",
	  !0],"420,0":["+07:00","Asia/Jakarta",!1],"480,0":["+08:00","Asia/Shanghai",!1],"480,1":["+08:00","Asia/Irkutsk",!0],"525,0":["+08:45","Australia/Eucla",!0],"525,1,s":["+08:45","Australia/Eucla",!0],"540,1":["+09:00","Asia/Yakutsk",!0],"540,0":["+09:00","Asia/Tokyo",!1],"570,0":["+09:30","Australia/Darwin",!1],"570,1,s":["+09:30","Australia/Adelaide",!0],"600,0":["+10:00","Australia/Brisbane",!1],"600,1":["+10:00","Asia/Vladivostok",!0],"600,1,s":["+10:00","Australia/Sydney",!0],"630,1,s":["+10:30",
	  "Australia/Lord_Howe",!0],"660,1":["+11:00","Asia/Kamchatka",!0],"660,0":["+11:00","Pacific/Noumea",!1],"690,0":["+11:30","Pacific/Norfolk",!1],"720,1,s":["+12:00","Pacific/Auckland",!0],"720,0":["+12:00","Pacific/Tarawa",!1],"765,1,s":["+12:45","Pacific/Chatham",!0],"780,0":["+13:00","Pacific/Tongatapu",!1],"840,0":["+14:00","Pacific/Kiritimati",!1]}}();
	  jstz.olson.dst_start_dates=function(){return{"America/Denver":new Date(2011,2,13,3,0,0,0),"America/Mazatlan":new Date(2011,3,3,3,0,0,0),"America/Chicago":new Date(2011,2,13,3,0,0,0),"America/Mexico_City":new Date(2011,3,3,3,0,0,0),"Atlantic/Stanley":new Date(2011,8,4,7,0,0,0),"America/Asuncion":new Date(2011,9,2,3,0,0,0),"America/Santiago":new Date(2011,9,9,3,0,0,0),"America/Campo_Grande":new Date(2011,9,16,5,0,0,0),"America/Montevideo":new Date(2011,9,2,3,0,0,0),"America/Sao_Paulo":new Date(2011,
	  9,16,5,0,0,0),"America/Los_Angeles":new Date(2011,2,13,8,0,0,0),"America/Santa_Isabel":new Date(2011,3,5,8,0,0,0),"America/Havana":new Date(2011,2,13,2,0,0,0),"America/New_York":new Date(2011,2,13,7,0,0,0),"Asia/Gaza":new Date(2011,2,26,23,0,0,0),"Asia/Beirut":new Date(2011,2,27,1,0,0,0),"Europe/Minsk":new Date(2011,2,27,2,0,0,0),"Europe/Helsinki":new Date(2011,2,27,4,0,0,0),"Europe/Istanbul":new Date(2011,2,28,5,0,0,0),"Asia/Damascus":new Date(2011,3,1,2,0,0,0),"Asia/Jerusalem":new Date(2011,3,1,
	  6,0,0,0),"Africa/Cairo":new Date(2010,3,30,4,0,0,0),"Asia/Yerevan":new Date(2011,2,27,4,0,0,0),"Asia/Baku":new Date(2011,2,27,8,0,0,0),"Pacific/Auckland":new Date(2011,8,26,7,0,0,0),"Pacific/Fiji":new Date(2010,11,29,23,0,0,0),"America/Halifax":new Date(2011,2,13,6,0,0,0),"America/Goose_Bay":new Date(2011,2,13,2,1,0,0),"America/Miquelon":new Date(2011,2,13,5,0,0,0),"America/Godthab":new Date(2011,2,27,1,0,0,0)}}();
	  jstz.olson.ambiguity_list={"America/Denver":["America/Denver","America/Mazatlan"],"America/Chicago":["America/Chicago","America/Mexico_City"],"America/Asuncion":["Atlantic/Stanley","America/Asuncion","America/Santiago","America/Campo_Grande"],"America/Montevideo":["America/Montevideo","America/Sao_Paulo"],"Asia/Beirut":"Asia/Gaza,Asia/Beirut,Europe/Minsk,Europe/Helsinki,Europe/Istanbul,Asia/Damascus,Asia/Jerusalem,Africa/Cairo".split(","),"Asia/Yerevan":["Asia/Yerevan","Asia/Baku"],"Pacific/Auckland":["Pacific/Auckland",
	  "Pacific/Fiji"],"America/Los_Angeles":["America/Los_Angeles","America/Santa_Isabel"],"America/New_York":["America/Havana","America/New_York"],"America/Halifax":["America/Goose_Bay","America/Halifax"],"America/Godthab":["America/Miquelon","America/Godthab"]};
	  var timezone = jstz.determine_timezone();    
	  var frm=document.forms[0];
	  frm.timeZone.value=timezone.name();
  }


</script>


  <script language = "Javascript">
  var digits = "0123456789";  
  var phoneNumberDelimiters = "()- ";
  // characters which are allowed in international phone numbers
  // (a leading + is OK)
  var validWorldPhoneChars = phoneNumberDelimiters + "+";  
  var minDigitsInIPhoneNumber = 10;
  function isInteger(s)
  {   var i;
      for (i = 0; i < s.length; i++)
      {   
          // Check that current character is number.
          var c = s.charAt(i);
          if (((c < "0") || (c > "9"))) return false;
      }
      // All characters are numbers.
      return true;
  }
  function trim(s)
  {   var i;
      var returnString = "";      
      for (i = 0; i < s.length; i++)
      {             
          var c = s.charAt(i);
          if (c != " ") returnString += c;
      }
      return returnString;
  }
  function stripCharsInBag(s, bag)
  {   var i;
      var returnString = "";      
      for (i = 0; i < s.length; i++)
      {             
          var c = s.charAt(i);
          if (bag.indexOf(c) == -1) returnString += c;
      }
      return returnString;
  }

  function checkInternationalPhone(strPhone){
  var bracket=3
  strPhone=trim(strPhone);
  if(strPhone.indexOf("+")>1) return false
  if(strPhone.indexOf("-")!=-1)bracket=bracket+1
  if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket)return false
  var brchr=strPhone.indexOf("(")
  if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false
  if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false
  s=stripCharsInBag(strPhone,validWorldPhoneChars);
  return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
  }

  function ValidatePhone(){	
	var frm=document.forms[0];
  	var Phone=frm.contactNumber;
  	
  	if ((Phone.value==null)||(Phone.value=="")){
  		alert('<bean:message key="jsp.admin.register.page.error8"/>');
  		Phone.focus();
  		return false;
  	}
  	if (checkInternationalPhone(Phone.value)==false){
  		alert('<bean:message key="jsp.admin.register.page.error9"/>');
  		Phone.value="";
  		Phone.focus();
  		return false;
  	}  	 
  	return true;
   }
  </script>
<style>
select
{
 width:	300px;
 height: 30px;
 list-style:inside;
 float: left;
}
table td  {
    border-right: 1px solid #D6C69E;
    border-top: 1px solid #D6C69E;
    color: #5E4F36;
    padding: 10px;
}
.admin_login_box {
    background: none repeat scroll 0 0 #FDF5E6;
    border: 10px solid #D6C69E;
    display: inline-block;
    padding: 10px;
}
</style>
</head>
<body>
<%
session.setAttribute("User",null);
session.setAttribute("Admin","SignUp");
%>
 
<!--     HEADER -->
<!--  -->
 <%@ include file="/jsp/common/header.jsp"%>
<!--     header end here -->
    <div id="content">
    <div id="regilogin">
    <div id="signin_menu">
    <html:form action="/register">
     	<html:hidden property="lastName" value=""></html:hidden>
     	<html:hidden property="password" value=""></html:hidden>
     	<html:hidden property="address" value=""></html:hidden>
     	<html:hidden property="timeZone" value=""></html:hidden>
     	<html:hidden property="country" value=""></html:hidden>
     	<html:hidden property="state" value=""></html:hidden>
    
    <h4><bean:message key="jsp.admin.register.page.signup"/></h4>
   	<logic:present name="message"> <p class="message invalid"><bean:write name="message" filter="true"/></p></logic:present>
     <p>
     <label><bean:message key="jsp.admin.register.page.name"/></label>
     <html:text property="firstName" onchange="return textFname();"/> 
     </p>

     <!--<tr><td><label>Last Name:   </label></td><td><html:text property="lastName" onchange="return textLname();"/>   <span class="mandatory" style="text-align:left">*</span></td></tr>
     -->
     
     <p>
     <label><bean:message key="jsp.admin.register.page.company"/></label>
     <html:text property="companyName" onchange="return textCname();"/> 
     </p>
     
     <p><label><bean:message key="jsp.admin.register.page.email"/></label>
     <html:text property="userName" onchange="return textUname();"/>  
     </p>
     
     <!--<tr><td><label>Password :    </label></td><td><html:password property="password" onchange="return textPwd();"/>     <span class="mandatory" style="text-align:left">*</span></td></tr>
     -->
     
     <p><label><bean:message key="jsp.admin.register.page.phone"/></label>
	 <html:text property="contactNumber" maxlength="20"/> 
     </p>
   
  
     <!--<tr><td><label>Address :     </label></td><td> <html:text property="address" onchange="return textAdd();"/>     <span class="mandatory" style="text-align:left">*</span></td></tr>
     --><%-- <tr><td><label>Time Zone:</label></td><td>&nbsp;&nbsp;<html:select property="timeZone">
																<html:option value="0">SELECT</html:option>
																<%	String[] sr=TimeZone.getAvailableIDs();				  
																    List<String>list = Arrays.asList(sr);
																    Set<String> set = new HashSet<String>(list);
																    String[] result = new String[set.size()];
																    set.toArray(result);
																	for(int i=0;i<result.length;i++)
																		{  %>
																			<html:option value="<%=result[i]%>" ><%=result[i]%></html:option> 
																	  <%}%>
															</html:select></td></tr>--%><script type="text/javascript">setTimeZo();</script>
	 <!--<tr>
     <td>
         <label>Country :</label>
     </td>
     <td>
     	 <html:select property="country">
     	 	<html:option value="Select"> Select</html:option>
     	 	<html:option value="India">India</html:option>
     	 	<html:option value="United State">United State</html:option>
     	 	<html:option value="South Africa"> South Africa</html:option>
     	 	<html:option value="Canada"> Canada</html:option>
     	 </html:select>	
     </td>     
     </tr>
     <tr>
     <td>
         <label>State :</label>
     </td>
     <td>
     	 <html:select property="state">
     	 	<html:option value="0">Select State</html:option>
					<html:option value="Andaman and Nicobar">Andaman and Nicobar</html:option>
					<html:option value="Andhra Pradesh">Andhra Pradesh</html:option>
					<html:option value="Arunachal Pradesh">Arunachal Pradesh</html:option>
					<html:option value="Assam">Assam</html:option>
					<html:option value="Bihar">Bihar</html:option>
					<html:option value="Chandigarh">Chandigarh</html:option>
					<html:option value="Chhattisgarh">Chhattisgarh</html:option>
					<html:option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</html:option>
					<html:option value="Daman and Diu">Daman and Diu</html:option>
					<html:option value="Delhi ">Delhi </html:option>					
					<html:option value="Goa">Goa</html:option>
					<html:option value="Gujarat">Gujarat</html:option>
					<html:option value="Haryana">Haryana</html:option>
					<html:option value="Himachal Pradesh">Himachal Pradesh</html:option>
					<html:option value="Jammu and Kashmir">Jammu and Kashmir</html:option>
					<html:option value="Jharkhand">Jharkhand</html:option>
					<html:option value="Karnataka">Karnataka</html:option>
					<html:option value="Kerala">Kerala</html:option>
					<html:option value="Lakshadeep">Lakshadeep</html:option>
					<html:option value="Madya Pradesh">Madya Pradesh</html:option>
					<html:option value="Maharashtra">Maharashtra</html:option>
					<html:option value="Manipur">Manipur</html:option>
					<html:option value="Meghalaya">Meghalaya</html:option>
					<html:option value="Mizoram">Mizoram</html:option>
					<html:option value="Nagaland">Nagaland</html:option>
					<html:option value="Orissa">Orissa</html:option>
					<html:option value="Pondicherry">Pondicherry</html:option>
					<html:option value="Punjab">Punjab</html:option>
					<html:option value="Rajasthan">Rajasthan</html:option>
					<html:option value="Sikkim">Sikkim</html:option>
					<html:option value="Tamil Nadu">Tamil Nadu</html:option>
					<html:option value="Tripura">Tripura</html:option>
					<html:option value="Uttaranchal">Uttaranchal</html:option>
					<html:option value="Uttar Pradesh">Uttar Pradesh</html:option>
					<html:option value="West Bengal">West Bengal</html:option>	
     	 </html:select>		
     </td>     
     </tr>
     -->
     
     <p><label></label><button class="btn_green" type="button" onclick="return blank();"><bean:message key="jsp.admin.register.page.registerbtn"/></button></p>
     </html:form>
     </div>  
     
             
     <!--<input type="reset" class="btn_green"  value="Reset"></input>
     --><!--<a href="<%=request.getContextPath()%>/admin.do"><button class="btn_green" ><span>Back</span></button></a>-->
     
     
  	  </div>
      <div id="footer"> <%@ include file="/jsp/common/footer.jsp"%></div>
      </div>
<%@ include file="/jsp/common/feedback.jsp"%>

<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>