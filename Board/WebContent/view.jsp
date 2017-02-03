<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세페이지</title>
</head>
<body>
	<!-- Description	Resource	Path	Location	Type -->
	<!-- Java compiler level does not match the version of the installed Java project facet.	Board		Unknown	Faceted Project Problem (Java Version Mismatch) -->

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rs = null;
		String getId = null;
		
		try {
			String url = "jdbc:mysql://125.181.79.156:3306/notice";
			String db_id = "root";
			String db_pw = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt = conn.createStatement();
			String query = "select * from notice.board where num = " + num
					+ "";
			rs = stmt.executeQuery(query);

			int hit = 0;
			if (rs.next()) {
				getId = rs.getString("id");
				hit = rs.getInt("hit");
				Date date = rs.getTimestamp("time");
				
				//out.print(hit_add_query);
	%>

	<div style="border: gray 1px solid; padding: 10px">
		글번호 :
		<%=rs.getString("num")%><br /> 작성자 :
		<%=rs.getString("username")%><br /> 게시 시간 :
		<%=date.getMonth() + 1%>월
		<%=date.getDate()%>일<br /> 제목 :
		<%=rs.getString("title")%>&nbsp 조회수 :
		<%=rs.getInt("hit")%><br />
		<br />
		<div style="border: gray solid 1px; height: 300px;">
			<%=rs.getString("memo")%></div>
	</div>
	<br/>
	<br/>
	<%
		}
		String hit_add_query = "UPDATE notice.board SET hit = "+ (hit + 1) +" WHERE num = " +rs.getInt("num")+";";
		//out.print(hit_add_query);
		stmt.executeUpdate(hit_add_query);
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conn.close();

		}
	%>
	
	<div >
		<input type="button" value="메인 페이지" onclick="javascript:location.href='index.jsp';">
		
		<%
		out.print(session.getAttribute("id"));
		
// 			if ( session.getAttribute("id") == rs.getString("id") ){
		%><% //}%>
		<input type="button" value="삭제하기" onclick="">
		
		<input type="button" value="목록으로" onclick="javascript:location.href='list.jsp';">
		
	</div>

</body>
</html>