<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
</head>

<body>
	<%request.setCharacterEncoding("UTF-8");%>
	
	<h1>메인 페이지</h1>
<h1>메인 페이지</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String user_name = null;
	String user_id = null;
	String user_pass = null;
	String path = request.getContextPath()+"/";	//루트경로
	
	
	
	
	 if (session.getAttribute("name") != null){
		user_name = session.getAttribute("name").toString();
	 }
	
	if (session.getAttribute("id") != null){
		user_id = session.getAttribute("id").toString();
	}else {
		out.print("세션 없음.");
		
		
		%>
	<div>
		<form method="post" action="loginCheck.jsp">
			아이디 : <input type="text" name="id">
			비밀번호 : <input type="password" name="password">
			<input type="submit" value="로그인">
			<br/>
		</form>
	</div>
	
	<%}%>
	
	<br/>
	<br/>
	
	
	<div>
		<input type="button"  value="회원가입" onclick="javascript:location.href='join.jsp';">
		<br/><br/>
	 	<form action="logout.jsp">
	 	<input type="submit" value="로그아웃" >
	 	</form> 
	</div>
	<br/><br/><br/><br/><br/><br/>
	
	<div id="session_Check">
	<span> 로그인 정보</span>
	
	<div style="border: solid black  1px; width: 500px; padding: 10px;">
		아이디 : <%=user_id %><br/><br/>
		이름 : <%=user_name %><br/>
	</div>
	</div>

	<div id="content">
		<input type="button" onclick="javascript:location.href='list.jsp';" value="게시판 페이지로 이동">
	</div>
</body>
</html>

commit1
