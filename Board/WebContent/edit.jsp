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
	%>


	<div>
		<form action="editOk.jsp" method="get">
			<input type="text" name="num" value="<%=num %>" hidden="hidden">
			아이디 : <input type="text" value="<%=session_id%>" readonly="readonly"><br />
			이름 : <input type="text" value="<%=session.getAttribute("name")%>"
				readonly="readonly"><br /> 제목 : <input type="text"
				name="title"><br />
			<br /> 내용 :
			<textarea rows="4" cols="50" name="content"></textarea>
			<br /> <input type="submit" value="글 수정"> <input
				type="button" value="취소"
				onclick="javascript:location.href='view.jsp?num=<%=num%>'">
		</form>
	</div>


</body>
</html>
















