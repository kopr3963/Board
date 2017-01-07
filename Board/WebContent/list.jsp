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
if (session.getAttribute("id") !=null ){
	String user_id = session.getAttribute("id").toString();
	out.print(user_id);
}else {
	out.print("세션 없음");
}

%>
</body>
</html>