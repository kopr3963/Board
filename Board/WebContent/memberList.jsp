<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록 게시판</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");

		String query = " select * from member ";
		String url = "jdbc:mysql://125.181.79.156:3306/notice";
		String db_id = "develop";
		String db_pw = " develop";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		out.print("<h1> 회원 리스트 </h1>");
		try {
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				out.print(rs.getString("member_id") + " <br/>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conn.close();
		}
	%>
</body>
</html>