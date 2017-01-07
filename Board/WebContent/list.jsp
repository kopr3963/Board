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
request.setCharacterEncoding("UTF-8");
boolean session_flag = false;
String user_id = null;
String user_name = null;

String path = request.getContextPath()+"/";	//루트경로
if (session.getAttribute("id") !=null ){
	session_flag = true;
	user_id = session.getAttribute("id").toString();
	user_name = session.getAttribute("name").toString();
}else {
	out.print("로그인 해주세요");
	%>

<input type="button" value="로그인하러 가기" onclick="javascript:location.href='index.jsp';">	
	<%
}

if (session_flag==true){
	out.print("로그인 아이디 : "+user_id+"<br/>");
	out.print("사용자 이름 : "+user_name );
}

%>

<div id = "list">



</div>
<br/><br/><br/><br/><br/><br/><br/><br/>

<input type="button" value="메인페이지 이동" onclick="javascript:location.href='index.jsp'">

</body>
</html>