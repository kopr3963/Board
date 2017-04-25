<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.org.db.DB_Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		DB_Connection connection = new DB_Connection();
		Connection con = connection.db_connection();

		Statement stmt = null;
		ResultSet rs = null;

		String query = "select * from member";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				out.print(rs.getString("member_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			rs.close();
			con.close();
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		out.print(root+"<Br/>");
		
		out.print(java.lang.System.getProperty("java.class.path"));
		
	%>

</body>
</html>