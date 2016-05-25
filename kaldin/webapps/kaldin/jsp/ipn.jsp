<%@ page import="com.kaldin.plans.dao.PlansDAO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="java.io.*"%>

<%
	// read post from PayPal system and add 'cmd'
Enumeration en = request.getParameterNames();
String str = "cmd=_notify-validate";
while(en.hasMoreElements()){
	String paramName = (String)en.nextElement();
	String paramValue = request.getParameter(paramName);
	str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue);
}

// post back to PayPal system to validate
// NOTE: change http: to https: in the following URL to verify using SSL (for increased security).
// using HTTPS requires either Java 1.4 or greater, or Java Secure Socket Extension (JSSE)
// and configured for older versions.
boolean USE_SANDBOX = true;
URL u; 		
if(USE_SANDBOX)		
	u = new URL("https://www.sandbox.paypal.com/cgi-bin/webscr");
else
	u = new URL("https://www.paypal.com/cgi-bin/webscr");	
URLConnection uc = u.openConnection();
uc.setDoOutput(true);
uc.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
PrintWriter pw = new PrintWriter(uc.getOutputStream());
pw.println(str);
pw.close();

BufferedReader in = new BufferedReader(
new InputStreamReader(uc.getInputStream()));
String res = in.readLine();
in.close();

// assign posted variables to local variables
String itemName = request.getParameter("item_name");
String itemNumber = request.getParameter("item_number");
String paymentStatus = request.getParameter("payment_status");
String paymentAmount = request.getParameter("mc_gross");
String paymentCurrency = request.getParameter("mc_currency");
String txnId = request.getParameter("txn_id");
String receiverEmail = request.getParameter("receiver_email");
String payerEmail = request.getParameter("payer_email");
String packageName = request.getParameter("option_selection1");
String clientemail = request.getParameter("option_selection2");
String paymentDate = request.getParameter("payment_date");
String paymentFee = request.getParameter("payment_fee");
String companyid = request.getParameter("option_selection3");
//check notification validation
if(res.equals("VERIFIED")) {
	// check that paymentStatus=Completed
	// check that txnId has not been previously processed
	// check that receiverEmail is your Primary PayPal email
	// check that paymentAmount/paymentCurrency are correct
	// process payment
	
	// Need to update the database
	System.out.println("txnId " + txnId);
	System.out.println("payerEmail " + payerEmail);
	System.out.println("itemName " + itemName);
	System.out.println("package " + packageName);
	System.out.println("clientemail " + clientemail);

	int cid = 0;
	double payAmt = 0;
	double payFee = 0;
	try{
		cid = Integer.parseInt(companyid);
		payAmt = Double.parseDouble(paymentAmount);
		payFee = Double.parseDouble(paymentFee);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	PlansDAO plansDAO = new PlansDAO();
	
	boolean result = plansDAO.insertTransactionDetails(cid, clientemail, itemName, itemNumber, txnId, paymentStatus, 
			payAmt, payFee, paymentCurrency, paymentDate, payerEmail, receiverEmail, packageName);

} else if(res.equals("INVALID")) {
	// log for investigation
	System.out.println("INVALID REQUEST");
} else {
	// error
}
%>