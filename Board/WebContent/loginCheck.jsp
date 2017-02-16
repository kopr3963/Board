<%@page import="javax.websocket.Session"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%


	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath()+"/";	//루트경로
	//out.write("인코딩 방식 : "+request.getCharacterEncoding()+"</br>");
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	
	String result_id ;	//DB get id
	String result_pass = null; //DB get password
	String result_name = null;
	
	//out.write("아이디 : "+id +"</br>"+"비밀번호 : "+pass);
	
	Connection conn = null;
	
	try{
		String db_url = "jdbc:mysql://125.181.79.156:3306/notice";
		String db_id = "develop";
		String db_pw = " develop";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(db_url,db_id,db_pw);
		Statement stmt = conn.createStatement();
		
		String query ="SELECT * FROM NOTICE.MEMBER WHERE MEMBER_ID = '"+id+"'AND MEMBER_PASS ='"+pass+"'";
			
		ResultSet rs = stmt.executeQuery(query);
		
		
		if ( rs.next()){
				result_id = rs.getString("member_id").toString();
				result_pass = rs.getString("member_pass").toString();
				result_name = rs.getString("member_name").toString();
				
			
			
				session.setAttribute("id", result_id);
				session.setAttribute("pass", result_pass);
				session.setAttribute("name", result_name);
				
				response.sendRedirect(path+"index.jsp");
				
				
			
		}else {
			out.print("<script>alert('로그인 실패');location.href='index.jsp';</script>");
			
		}
		
		
		rs.close();
		stmt.close();
		conn.close();
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
	}
%>

</body>

<script>

</script>
</html>