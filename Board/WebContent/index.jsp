<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<h1>메인 페이지</h1>


	<div>
		<form method="post" action="loginCheck.jsp">
			아이디 : <input type="text" name="id">
			비밀번호 : <input type="password" name="password">
			<input type="submit" value="로그인"> 
			<br/>
		</form>
	</div>
	
	
	<div>
		<input type="button"  value="회원가입" onclick="javascript:location.href='join.jsp';" >
	</div>
</body>
</html>
