<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
</head>

<style>
  html,body{height:100%}
  body{margin:0}
  #wrap{min-height:100%}
  #content{padding-bottom:1.9em}
  
.header img {
	width: 100%;
	height: 200px;
}

.footer{margin-top:-1.9em;height:1.9em}

.footer {
	border: 1px solid black;
}

body {
	margin: 10px;
}
.container #footer {
// 하단바를 하단에 고정
position: absolute;
bottom: 0;
width: 100%;
height: 50px;
background-color: silver;
}

</style>
<body>


	<div class="header">
		<img src="imeges/header.png">
	</div>

	<%
		request.setCharacterEncoding("UTF-8");
		String user_name = null;
		String user_id = null;
		String user_pass = null;
		String path = request.getContextPath() + "/"; //루트경로

		if (session.getAttribute("name") != null) {
			user_name = session.getAttribute("name").toString();
		}

		if (session.getAttribute("id") != null) {
			user_id = session.getAttribute("id").toString();
	%>
	
	<div id="wrap">
	<div id="session_Check"
		style="border: 1px gray solid; margin-top: 20px; margin-left: 10px; padding 10px; float: left">

		<div style="padding: 10px;">
			로그인 정보<br /> 아이디 :
			<%=user_id%><br /> 이름 :
			<%=user_name%><br /><br/>
			<form action="logout.jsp">
				<input type="submit" value="로그아웃" style="width:100%;">
			</form>
		</div>
	</div>
	<%
		} else {
	%>
	<div class="login_div" style="margin-top: 20px; float: left">
		<form method="post" action="loginCheck.jsp">
			<div class="login_tab"
				style="border: 1px gray solid; float: left; padding: 10px">
				아이디 : <input type="text" name="id" style="float: right"> <br />
				비밀번호 : <input type="password" name="password" style="float: right">
				<br /> <br /> <input type="submit" value="로그인"
					style="width: 100%;"><br/>
					<input type="button" value="회원가입" style="width:100%;"
			onclick="javascript:location.href='join.jsp';">
			</div>
		</form>
	</div>
	<%
		}
	%>
	<div style="clear: both;"></div>
	<div class="content" style="width: 100%; margin-top: 20px;">
		<div class="leftContent"
			style="border: 1px solid gray; width: 20%; float: left;">
			<ul>
				<li><a href="list.jsp">게시판</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</div>
		<div
			style="border: 1px solid gray; width: 70%; float: right; padding: 5px;">
		</div>
	</div>
	</div>
	<div style="clear: both;"></div>
	<div class="footer">Footer.</div>
</body>
</html>
