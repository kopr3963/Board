<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		String name = request.getParameter("name");

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			String url = "jdbc:mysql://125.181.79.156:3306/notice";
			String db_id = "root";
			String db_pw = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);

			String query = "SELECT * FROM NOTICE.MEMBER WHERE MEMBER_ID ='" + id + "'";
			Statement stmt = conn.createStatement();
			ResultSet rs = null;

			rs = stmt.executeQuery(query);

			
			if (rs.next()) {
				//아이디가 있으면 
				out.print("<script>javascript:alert('아이디 있음.'); location.href='join.jsp';</script>");
			}else{
				out.print(id+","+pass+","+name);
				
				String insertQuery="INSERT INTO NOTICE.MEMBER VALUES (?,?,?)";
				
				pstmt = conn.prepareStatement(insertQuery);
				pstmt.setString(1, id);
				pstmt.setString(2,pass);
				pstmt.setString(3,name);
				pstmt.executeUpdate();
				
				out.print("<script>alert('회원가입 완료.'); location.href='index.jsp';</script>");
			}
			

			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	%>
</body>
</html>