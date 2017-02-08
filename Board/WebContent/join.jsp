<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<h1>회원가입 페이지</h1>
	<div> 이 사이트에 회원가입 하실 때에는 기존 사용중이신 비밀번호를 적지 마세요. 암호화가 안되어있는 페이지입니다.</div>
	<form action="joinCheck.jsp" method="get">
		<div style="border: solid black 1px; width: 500px; padding: 10px;">
			이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
				name="name"> <br />
			<br /> 아이디 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
				name="id"> <br />
			<br /> 비밀번호 : &nbsp;<input type="password" name="password"><br />
			<br />
			<div style="text-align: center;">
				<input type="submit" style="width: 40%;" value="확인"
					onclick="javascript:location.href='joinCheck.jsp';"> <input
					type="button" style="width: 40%;" value="취소"
					onclick="javascript:location.href='index.jsp';">
			</div>
		</div>
	</form>
</body>
</html>