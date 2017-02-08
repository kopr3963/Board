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
html, body {
	height: 100%
}

body {
	margin: 0
}

#wrap {
	min-height: 100%
}

#content {
	padding-bottom: 1.9em
}

.header img {
	width: 100%;
	height: 200px;
}

.footer {
	margin-top: -1.9em;
	height: 1.9em
}

.footer {
	border: 1px solid black;
}

body {
	margin: 10px;
}

.container #footer { // 하단바를 하단에 고정 position:absolute;
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
				<%=user_name%><br />
				<br />
				<form action="logout.jsp">
					<input type="submit" value="로그아웃" style="width: 100%;">
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
						style="width: 100%;"><br /> <input type="button"
						value="회원가입" style="width: 100%;"
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
					<li><a href="memberList.jsp">회원 목록</a></li>
				</ul>
			</div>
			<div
				style="border: 1px solid gray; width: 70%; float: right; padding: 5px;">
				이곳에 작성된 페이지들은 오로지 JSP페이지로만 작성 되었습니다. <br/><br/>
				GIT으로 버전 관리 되고 있습니다.<br/>
				
				이 사이트에 사용된 소스들은 모두 오픈소스입니다.	<br/><br/>
				
				아래 링크로 가시면 오픈 소스들을 보실 수 있습니다. <br/>
			    <a href='https://github.com/kopr3963/Board'>사이트 오픈소스 링크</a><br/><br/>
			    
				보시는 사이트들은 모두 온라인상으로 진행이 되고 있습니다.<br/>
				
				
				GTI 공동 작업자를 찾고 있습니다.  시간, 장소에 구애 받지 않고 1주일에 한번이라도 커밋하시면 됩니다~<br/><br/>
				공동작업자들 끼리 협업을 함으로써 git과 개발자들과의 커뮤니케이션을 위해 만드는 사이트 입니다.<br/>
				실력, 시간을 떠나서 개발자들과 꾸준히 소통하고 커밋을 하실 수 있는 분들은 아래 메일 주소로 보내주세요 ^^ <br/>
				
				 <a href="mailto:kopr3963@me.com">이메일 보내기. </a> 
				
				
			    
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
</body>
</html>
