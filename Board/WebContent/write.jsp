<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성 페이지</title>
</head>
<body>
<%!
	public  void test(){
	System.out.println("testing");
}
%>
	<%
		request.setCharacterEncoding("UTF-8");
		boolean session_flag = false;
		String user_id = null;
		String user_name = null;
		
		session.getAttribute("id");
		
		if (session.getAttribute("id") != null) {
			session_flag = true;
			user_id = session.getAttribute("id").toString();
			user_name = session.getAttribute("name").toString();
		}else{
			out.print("<script> alert('로그아웃 상태입니다.');");
			out.print("location.href='index.jsp'");
			out.print("</script>");
		}
	%>
	
	<div id="content">
	
	<!-- http://rlackdghl.iptime.org:8080/GitDemo/fileupload_ok.jsp -->
		<form action="http://localhost:8080/Board/writeOk.jsp" method="post"  enctype="multipart/form-data">
			아이디 : <input type="text" value="<%=user_id %>" name="id"><br/>
			닉네임 : <input type="text" value="<%=user_name%>" name="name"><br/><br/>
			제목 : <input type="text"  name="title" autofocus="autofocus"><br/><br/>
			내용 :  <textarea rows="4" cols="50" name="content"  autofocus ></textarea>
			<br/>
			<br/>
			파일 : <input type="file" name="file1">

		<input type="submit" value="글 작성"  >
		<input type="button" value="취소" onclick="cancel();">
		</form>
	</div>
	<br/>
	<div id="fileupload_ok.jsp">
		<form action="fileupload_ok.jsp" method="post" enctype="multipart/form-data">
			파일 : <input type="file" name="file1">
			
			<input type="submit" value="전송">
		</form>	
	</div>
</body>
<script>
function cancel(){
	window.location.href="list.jsp";
}
</script>
</html>