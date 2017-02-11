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
		request.getParameter("num");
		String param_id = request.getParameter("id");
		String session_id = session.getAttribute("id").toString();
	
		if ( param_id.equals(session_id)){
			System.out.print("참");
		}else{
			out.println("");
		}
		
	%>
	
	
	
</body>
</html>