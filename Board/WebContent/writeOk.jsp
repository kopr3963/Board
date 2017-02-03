<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Connection conn = null;
	Statement stmt = null;
	boolean parameterNullCheck = false;
	 try {
		String url = "jdbc:mysql://125.181.79.156:3306/notice";
		String db_id = "root";
		String db_pw = "root";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, db_id, db_pw);
		stmt = conn.createStatement();
		String query = "INSERT INTO NOTICE.BOARD (id, username,title,memo,time) VALUES('"+id+"','" + name + "','" + title
				+ "','" + content + "',sysdate());";
		stmt = conn.prepareStatement(query);
		out.print(query);
		stmt.executeUpdate(query);
		
		out.print("<script> alert('작성 완료.'); location.href='list.jsp'</script>");
	} catch (SQLException e) {
		e.printStackTrace();
		stmt.close();
		conn.close();
	}
	 
	 
%>