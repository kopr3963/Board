<%@page import="javax.websocket.SendResult"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String query = "DELETE FROM board WHERE num = '" + request.getParameter("num")+"' and id = '"+request.getParameter("id")+"';";
	out.print(query);
	String url = "jdbc:mysql://125.181.79.156:3306/notice";
	String db_id = "develop";
	String db_pw = " develop";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	try { 
		conn = DriverManager.getConnection(url, db_id, db_pw);
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
	}catch(SQLException e ){
		e.printStackTrace();
		
	}finally{
		stmt.close();
		conn.close();
	}
	response.sendRedirect("list.jsp");
%>
