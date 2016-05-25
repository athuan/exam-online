<%@page import="java.util.TimeZone"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Buy More Question Papers - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/user/createuser.js?dt=19aug2013'></script>
<script type='text/javascript'
	src='<%=request.getContextPath()%>/js/creditcard.js?dt=19aug2013'></script>
<script type="text/javascript">

function setState(stateId){
	var frm = document.forms[0]; 
	var countryId = frm.country.value;
	$.post("showstate.do", {
		companyId : countryId,
		stateId  : stateId
	}, function(data) {
		if (data == null) {
			message(container, "You haven't added your details");
		} else {
			//
			document.getElementById("state").innerHTML =data;
		}
	});
}

var cardNoEditFlag = false;
var useDefaultAddress = false;
function newWin(){
  window.open('<%=request.getContextPath()%>
	/UserGuide/configuration/addNewPaymentMethod.html',
						'',
						'width=800,height=580,scrollbars=yes,resizable=yes, menubar=no, toolbar=no, status=no, left=0, top=0');
	}

	String.prototype.trim = function() {
		return this.replace(/(^\s*)|(\s*$)/g, "");
	}

	function formSubmit(frm) {
		form = frm;
		var cnt = form.creditcardname.length;
		var flag = false;
		for ( var i = 0; i < cnt; i++) {
			if (form.creditcardname[i].checked)
				flag = true;
		}
		if (!flag) {
			alert('Select a credit card');
			return false;
		}
		if (form.firstname.value == null || form.firstname.value == ""
				|| isSpace(form.firstname.value)) {
			alert('Please type in your First name as it appears on your credit card');
			form.firstname.focus();
			return false;
		}
		if (form.lastname.value == null || form.lastname.value == ""
				|| isSpace(form.lastname.value)) {
			alert('Please type in your Last name as it appears on your credit card');
			form.lastname.focus();
			return false;
		}
		if (form.creditCardNo.value == null || form.creditCardNo.value == ""
				|| isSpace(form.creditCardNo.value)) {
			alert('Please type in your credit card number');
			form.creditCardNo.focus();
			return false;
		} else if (form.creditCardNo.value != null
				&& form.creditCardNo.value != "") {
			form.creditCardNo.value = form.creditCardNo.value.trim();
		}

		if (isNaN(form.creditCardNo.value)) {
			alert('Invalid card number');
			form.creditCardNo.focus();
			return false;
		} else {
			myCardNo = form.creditCardNo.value;
			var myCardType = '';
			for ( var i = 0; i < form.creditcardname.length; i++) {
				if (form.creditcardname[i].checked)
					myCardType = form.creditcardname[i].value;
			}
			if (!checkCreditCard(myCardNo, myCardType)) {
				alert(ccErrors[ccErrorNo]);
				return false;
			}
		}

		if (form.cw2.value == null || form.cw2.value == ""
				|| isSpace(form.cw2.value)) {
			alert('Please type in your valid CVV2 number');
			form.cw2.focus();
			return false;
		}

		if (isNaN(form.cw2.value) || form.cw2.value.length < 3) {
			alert('Invalid CVV2 number');
			form.cw2.focus();
			return false;
		}

		if (form.expMonth.value == null || form.expMonth.value == ""
				|| isSpace(form.expMonth.value)) {
			alert('Please select the expiration month');
			form.expMonth.focus();
			return false;
		}

		if (form.expYear.value == null || form.expYear.value == ""
				|| isSpace(form.expYear.value)) {
			alert('Please select the expiration year');
			form.expYear.focus();
			return false;
		}

		if (form.nickname.value == null || form.nickname.value == ""
				|| isSpace(form.nickname.value)) {
			alert('Please type in Nick name for your credit card');
			form.nickname.focus();
			return false;
		}

		return true;
	}

	function cvv2codeHelp() {
		window
				.open("/include/cvv2.htm", "Kaldin-What is CVV",
						"menubar=0,toolbar=0,resizable=1,scrollbars=1,width=600px,height=530px");
	}

	function doSubmit(operationType) {
		frm = document.forms[0];
		alert(frm.operation.value);
		if (formSubmit(frm)) {
			frm.operation.value = operationType;

			frm.submit();
			return true;
		} else {
			return false;
		}
	}

	function submitExpressCheckout(operationType) {
		frm = document.forms[0];
		frm.operation.value = operationType;
		frm.submit();
		return true;
	}

	function isSpace(field) {
		//vlidation for space 
		var sCheck = true;
		var fieldLen = field.length;
		for ( var i = 1; i <= fieldLen; i++) {
			if (field.charAt(0) == " ") {
				field = field.substring(1);
			} else {
				sCheck = false;
			}
		}
		return sCheck;
	}

	function validateCard() {
		form = document.forms[0];
		myCardNo = form.creditCardNo.value;
		var myCardType = '';
		for ( var i = 0; i < form.creditcardname.length; i++) {
			if (form.creditcardname[i].checked)
				myCardType = form.creditcardname[i].value;
		}
		if (!checkCreditCard(myCardNo, myCardType)) {
			if (cardNoEditFlag) {
				alert(ccErrors[ccErrorNo]);
				form.creditCardNo.focus();
				cardNoEditFlag = false;
			}
		}
	}

	function checked() {
		document.getElementById("visa").checked = true;
	}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/PaymentAction.do"
						class="active">More Question Papers</a></li>
					<!-- <li><a href="<%=request.getContextPath()%>/callxlsimport.do">Import Candidate Data</a></li> -->
					<li><a href="<%=request.getContextPath()%>/callqueimport.do">Import
							Question Data</a></li>
					<li><a href="<%=request.getContextPath()%>/Technology.do">Technology</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User
							Profile Required</a></li>
					<li><a
						href="<%=request.getContextPath()%>/calladminchangepass.do">Change
							Password</a></li>
					<li><a
						href="<%=request.getContextPath()%>/callAdminProfile.do">My
							Profile</a></li>
				</ul>
			</div>
			<div id="main">
				<html:form action="/PaymentAction">
					<html:hidden property="operation" value="cardpayment"></html:hidden>
					<p>
						<logic:present name="message">
							<center>
								<h2>
									<b><bean:write name="message" filter="true" /></b>
								</h2>
							</center>
						</logic:present>
					</p>

					<h3>
						<b>Buy Question Paper</b>
					</h3>
					<table>
						<tr>
							<td width="30%"><h2>
									<b>Express Checkout</b>
								</h2></td>
							<td><img src="images/paypal_express.gif"
								style="cursor: pointer;"
								onclick="return submitExpressCheckout('expresscheckout');" /></td>
						</tr>
					</table>
					<table border="0" width="100%">
						<tbody>
							<tr>
								<td><h2>
										<b>Card Payment</b>
									</h2></td>
							</tr>
							<tr height="40">
								<td></td>
								<td>
									<table cellspacing="5" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td align="center"><img border="0"
													src="images/visa.gif"></td>
												<td align="center"><img border="0"
													src="images/master.gif"></td>
												<td align="center"><img border="0"
													src="images/amex.gif"></td>
												<td align="center"><img border="0"
													src="images/discover.jpg"></td>
											</tr>
											<tr>
												<td align="center"><html:radio styleId="visa"
														style="border: 0px none;" value="Visa"
														property="creditcardname"></html:radio></td>
												<td align="center"><html:radio
														style="border: 0px none;" value="MasterCard"
														property="creditcardname"></html:radio></td>
												<td align="center"><html:radio
														style="border: 0px none;" value="AmEx"
														property="creditcardname"></html:radio></td>
												<td align="center"><html:radio
														style="border: 0px none;" value="Discover"
														property="creditcardname"></html:radio></td>

											</tr>
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<td width="30%" class="table_title">First Name:</td>
								<td><html:text style="width: 150px; height: 20px;" value=""
										maxlength="25" property="firstname" />&nbsp;<font color="red"><sup>*</sup></font></td>
							</tr>
							<tr>
								<td class="table_title">Last Name:</td>
								<td><html:text style="width: 150px; height: 20px;" value=""
										maxlength="25" property="lastname" />&nbsp;<font color="red"><sup>*</sup></font></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="table_title">Credit Card Number:</td>
								<td><html:text style="width: 133px; height: 20px;" value=""
										maxlength="20" property="creditCardNo" />&nbsp;<font
									color="red"><sup>*</sup></font></td>
							</tr>
							<tr>
								<td class="table_title">CVV2 Code:</td>
								<td><html:text style="width: 30px; height: 20px;" value=""
										maxlength="5" property="cw2" />&nbsp;<font color="red"><sup>*</sup></font>
									&nbsp;&nbsp;<a onclick="javascript:cvv2codeHelp();" href="#">( Info. )</a></td>
							</tr>
							<tr>
								<td class="table_title">Expiration:</td>
								<td><html:select property="expMonth" style="width:25%;">
										<html:option value="1">January</html:option>
										<html:option value="2">February</html:option>
										<html:option value="3">March</html:option>
										<html:option value="4">April</html:option>
										<html:option value="5">May</html:option>
										<html:option value="6">June</html:option>
										<html:option value="7">July</html:option>
										<html:option value="8">August</html:option>
										<html:option value="9">September</html:option>
										<html:option value="10">October</html:option>
										<html:option value="11">November</html:option>
										<html:option value="12">December</html:option>
									</html:select> <html:select property="expYear" style="width:25%;">
										<html:option value="2012">2012</html:option>
										<html:option value="2013">2013</html:option>
										<html:option value="2014">2014</html:option>
										<html:option value="2015">2015</html:option>
										<html:option value="2016">2016</html:option>
										<html:option value="2017">2017</html:option>
										<html:option value="2018">2018</html:option>
										<html:option value="2019">2019</html:option>
										<html:option value="2020">2020</html:option>
										<html:option value="2021">2021</html:option>
										<html:option value="2022">2022</html:option>
										<html:option value="2022">2023</html:option>
										<html:option value="2022">2024</html:option>
										<html:option value="2022">2025</html:option>
										<html:option value="2022">2026</html:option>
										<html:option value="2022">2027</html:option>
										<html:option value="2022">2028</html:option>
										<html:option value="2022">2029</html:option>
										<html:option value="2022">2030</html:option>
									</html:select>&nbsp;<font color="red"><sup>*</sup></font></td>
							</tr>
							<!-- Changes for Yahoo UI -->
							<tr>
								<td class="table_title">Card Nick Name:</td>
								<td><html:text style="width: 133px; height: 20px;" value=""
										maxlength="20" property="nickname" />&nbsp;<font color="red"><sup>*</sup></font></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="table_title">Total Amount</td>
								<td>$<html:text property="paymentAmount" value="25"
										style="background-color:transparent;border:medium none;cursor:default;-moz-box-shadow:none;"></html:text></td>
							</tr>
							<tr>
								<td nowrap="nowrap" class="table_title"></td>
								<td><span><button class="btn_green"
											onclick="doSubmit('cardpayment');return false;">
											<span>Make Payment</span>
										</button></span></td>
							</tr>
						</tbody>
					</table>
				</html:form>
			</div>
		</div>
		<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>