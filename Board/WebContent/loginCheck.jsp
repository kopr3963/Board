<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


request.setCharacterEncoding("UTF-8");

out.write("인코딩 방식 : "+request.getCharacterEncoding()+"</br>");
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	out.write("아이디 : "+id +"</br>"+"비밀번호 : "+pass);
%>

</body>

<script>
alert('준비중.');
</script>
</html>