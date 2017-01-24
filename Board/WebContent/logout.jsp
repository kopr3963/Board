<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath()+"/";	//루트경로
	session.invalidate();
	response.sendRedirect(path+"index.jsp");
%>