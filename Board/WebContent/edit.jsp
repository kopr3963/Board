<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String param_id = request.getParameter("id");
		String session_id = session.getAttribute("id").toString();
		int num = Integer.parseInt(request.getParameter("num"));
		if (param_id.equals(session_id)) {
			System.out.print("참");
		} else {
			out.println("");
		}

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String query2 = "select * from notice.board where num = " + num;

		try {
			String url = "jdbc:mysql://125.181.79.156:3306/notice";
			String db_id = "tester";
			String db_pw = "tester";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, db_id, db_pw);
			stmt = conn.createStatement();

			rs = stmt.executeQuery(query2);
			String title = null;
			String content = null;

			if (rs.next()) {
				title = rs.getString("title");
				content = rs.getString("memo");
			}
		
	%>


	<div>
		<form action="editOk.jsp" method="get">
			<input type="text" name="num" value="<%=num%>" hidden="hidden">
			아이디 : <input type="text" value="<%=session_id%>" readonly="readonly"><br />
			이름 : <input type="text" value="<%=session.getAttribute("name")%>"
				readonly="readonly"><br /> 제목 : <input type="text"
				name="title" value="<%=title%>"><br /> <br /> 내용 :
			<textarea rows="4" cols="50" name="content"><%=content%></textarea>
			<br /> <input type="submit" value="글 수정"> <input
				type="button" value="취소"
				onclick="javascript:location.href='view.jsp?num=<%=num%>'">
		</form>
	</div>

<%
} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
			conn.close();
		}
		%>
</body>
</html>
















