<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URL"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>

<%
	QueryHelper qh = new QueryHelper();
	QueryHelper qh2 = new QueryHelper();

	String query = "select * from exm_answers "
			+ "where upper(optionA) like '%<IMG%' or upper(optionB) like '%<IMG%' or  "
			+ "upper(optionC) like '%<IMG%' or upper(optionD) like '%<IMG%' or  "
			+ "upper(optionE) like '%<IMG%' or upper(optionF) like '%<IMG%' or  "
			+ "upper(optionG) like '%<IMG%'  limit 1000";
	String updateAnswerSQL = "update exm_answers set optionA = ?, optionB = ?, optionC = ?, optionD = ?, optionE = ?, optionF = ?, optionG = ? where answerid = ?";

	String optionA = "";
	String optionB = "";
	String optionC = "";
	String optionD = "";
	String optionE = "";
	String optionF = "";
	String optionG = "";
	String answerId = "";
	try {
		ResultSet rs = qh.runQueryStreamResults(query);

		while (rs.next()) {
			answerId = rs.getString("answerid");
			optionA = rs.getString("optionA");
			optionB = rs.getString("optionB");
			optionC = rs.getString("optionC");
			optionD = rs.getString("optionD");
			optionE = rs.getString("optionE");
			optionF = rs.getString("optionF");
			optionG = rs.getString("optionG");

			if (optionA.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionA of " + answerId);
			} else {
				optionA = getUpdatedOption(optionA, request);
			}
			if (optionB.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionB of " + answerId);
			} else {
				optionB = getUpdatedOption(optionB, request);
			}
			if (optionC.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionC of " + answerId);
			} else {
				optionC = getUpdatedOption(optionC, request);
			}
			if (optionD.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionD of " + answerId);
			} else {
				optionD = getUpdatedOption(optionD, request);
			}
			if (optionE.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionE of " + answerId);
			} else {
				optionE = getUpdatedOption(optionE, request);
			}
			if (optionF.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionF of " + answerId);
			} else {
				optionF = getUpdatedOption(optionF, request);
			}
			if (optionG.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for optionG of " + answerId);
			} else {
				optionG = getUpdatedOption(optionG, request);
			}
			qh2.addParam(optionA);
			qh2.addParam(optionB);
			qh2.addParam(optionC);
			qh2.addParam(optionD);
			qh2.addParam(optionE);
			qh2.addParam(optionF);
			qh2.addParam(optionG);
			qh2.addParam(answerId);
			qh2.runQuery(updateAnswerSQL);
			qh2.clearParams();
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		qh.releaseConnection();
		qh2.releaseConnection();
	}
%>
<%! 
public String getUpdatedOption(String option,HttpServletRequest request) {
	String folderPath = getServletContext().getRealPath("/") + "uploads" + "/";
		Document doc = Jsoup.parse(option);
		try {
			// Get all elements with img tag
			Elements img = doc.getElementsByTag("img");
			String src = null;
			String newSrc = null;
			for (Element el : img) {

				// for each element get the srs url
				src = el.absUrl("src");
				int indexname = src.lastIndexOf("/");
				if (indexname == src.length()) {
					src = src.substring(1, indexname);
				}
				indexname = src.lastIndexOf("/");
				String name = System.currentTimeMillis() + src.substring(indexname + 1, src.length());

				// Open a URL Stream
				URL url = new URL(src);
				InputStream in = url.openStream();
				OutputStream outStream = new BufferedOutputStream(new FileOutputStream(folderPath + name));
				for (int b; (b = in.read()) != -1;) {
					outStream.write(b);
				}
				outStream.close();
				in.close();

				newSrc = request.getContextPath() + "/uploads/" + name;
				el.attr("src", newSrc);
			}
		} catch (IOException ex) {
			System.out.println("There was an error");
		} catch (Exception e){
			System.out.println("There was an error " + e.getMessage());
		}
	return doc.body().html();
}
%>