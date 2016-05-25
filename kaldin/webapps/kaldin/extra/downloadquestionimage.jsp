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
	String folderPath =  getServletContext().getRealPath("/") + "uploads" + "/"; 
	QueryHelper qh = new QueryHelper();
	QueryHelper qh2 = new QueryHelper();
	
	String query = "select questionid, question from exm_question where upper(question) like '%<IMG%' limit 2000";
	String updateQuestionSQL = "update exm_question set question = ? where questionid = ?";	
	
	String questionText = "";
	String questionId = "";
	try {
		ResultSet rs = qh.runQueryStreamResults(query);

		while (rs.next()) {
			questionId = rs.getString("questionid");
			questionText = rs.getString("question");
			if (questionText.contains("/uploads/")) {
				out.println("<br>Already Image Downloaded for " + questionId);
			} else {
				try {

					Document doc = Jsoup.parse(questionText);

					// Get all elements with img tag ,
					Elements img = doc.getElementsByTag("img");
					String src = null;
					String newSrc = null;
					for (Element el : img) {

						// for each element get the srs url
						src = el.absUrl("src");

						//out.println("<br>Image Found!");
						//out.println("<br>src attribute is : " + src);

						int indexname = src.lastIndexOf("/");

						if (indexname == src.length()) {
							src = src.substring(1, indexname);
						}

						indexname = src.lastIndexOf("/");
						String name = System.currentTimeMillis() + src.substring(indexname + 1, src.length());

						out.println(name);

						// Open a URL Stream
						URL url = new URL(src);
						InputStream in = url.openStream();
						
						OutputStream outStream = new BufferedOutputStream(new FileOutputStream( folderPath + name));

						for (int b; (b = in.read()) != -1;) {
							outStream.write(b);
						}
						outStream.close();
						in.close();

						newSrc = request.getContextPath() + "/uploads/" + name;
						el.attr("src", newSrc);
					}
					//out.println("<br>" + doc.body().html());
					
					qh2.addParam(doc.body().html());
					qh2.addParam(questionId);
					qh2.runQuery(updateQuestionSQL);
					qh2.clearParams();
					
				} catch (IOException ex) {
					out.println("There was an error");

				}
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		qh.releaseConnection();
		qh2.releaseConnection();
	}
%>
