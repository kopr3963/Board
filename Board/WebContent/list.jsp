<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 리스트 페이</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		boolean session_flag = false;
		String user_id = null;
		String user_name = null;

		String path = request.getContextPath() + "/"; //루트경로
		if (session.getAttribute("id") != null) {
			session_flag = true;
			user_id = session.getAttribute("id").toString();
			user_name = session.getAttribute("name").toString();
		} else {
			out.print("로그인 해주세요");
	%>

	<input type="button" value="로그인하러 가기"
		onclick="javascript:location.href='index.jsp';">

	<%
		}

		if (session_flag == true) {
			out.print("로그인 아이디 : " + user_id + "<br/>");
			out.print("사용자 이름 : " + user_name);
		}
	%>
	<br>
	<a href=#>글쓰기</a>
	<br />
	<div id="list">

		<table border="1" style="width: 100%">
			<tr style="background-color: gray">
				<th style="width: 10%">게시판번호</th>
				<th style="width: 10%">유저이름</th>
				<th style="width: 60%">제목</th>
				<th>게시시간</th>
				<th>조회수</th>
			</tr>
			<%
				String url = "jdbc:mysql://125.181.79.156:3306/notice";
				String db_id = "root";
				String db_pw = "root";
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				try {
					conn = DriverManager.getConnection(url, db_id, db_pw);
					pstmt = conn.prepareStatement("select * from board order by time desc limit 20 offset 0");
					ResultSet rs = pstmt.executeQuery();
					SimpleDateFormat sdf = new SimpleDateFormat("MM/dd");
					SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
					Date today = new Date();
					while (rs.next()) {
						String rdate = "";
						Date date = rs.getTimestamp("TIME");
						int month = date.getMonth() + 1;
						int day = date.getDay();
						if (today.getMonth() + 1 == month && today.getDay() == day) {
							rdate = sdf2.format(date);
						} else {
							rdate = sdf.format(date);
						}
			%>
			<tr>
				<td><%=rs.getInt("NUM")%></td>
				<td><%=rs.getString("USERNAME")%></td>
				<td><a href=#><%=rs.getString("TITLE")%></a></td>
				<td><%=rdate%></td>
				<td><%=rs.getInt("HIT")%></td>
			</tr>
		<%
					}
				} catch(SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
		%>
	
		</table>
	</div>
	<br />
	<input type="button" value="메인페이지 이동"
		onclick="javascript:location.href='index.jsp'">

</body>
</html>