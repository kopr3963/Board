<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String memo = request.getParameter("content");
	Connection conn = null;
	Statement stmt = null;
	int num = Integer.parseInt(request.getParameter("num"));

	String query = "update notice.board set title = '" + title + "', memo = '" + memo + "' where num = "
			+ num + ";";
			//out.print(query);
	try {
		String url = "jdbc:mysql://125.181.79.156:3306/notice";
		String db_id = "develop";
		String db_pw = " develop";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, db_id, db_pw);
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
		response.sendRedirect("view.jsp?num="+num);
		
	} catch (SQLException e) {
		e.printStackTrace();

	} finally {
		stmt.close();
		conn.close();
	}
%>