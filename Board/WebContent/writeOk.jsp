<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

boolean isMultipart = ServletFileUpload.isMultipartContent(request);

	HashMap<String, String> map = new HashMap<String, String>();

	File temporaryDir = new File("/Users/Mac");
	String realDir = config.getServletContext().getRealPath("/upload/");
	
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setSizeThreshold(1*1024*1024);
	factory.setRepository(temporaryDir);
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(10*1024*1024);
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator iter = items.iterator();
	
	String query_test = "INSERT INTO NOTICE.BOARD (id, username,title,memo,time,original_file_name) VALUES"+
	")";
	
	List<String> array = new ArrayList();
	
	while (iter.hasNext()){
		FileItem fileItem = (FileItem)iter.next();
		if ( fileItem.isFormField()){
			String title = fileItem.getFieldName();
			//out.println(title + " = "+ fileItem.getString("utf-8")+"<br/>");
			
			map.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
			
			//array.add(fileItem.getString("utf-8"));
		}
		
		else {
			if( fileItem.getSize()>0){ //파일이 있으면
				String fieldName = fileItem.getFieldName();
				String fileName = fileItem.getName();
				String contentType = fileItem.getContentType();
				boolean isInMemory = fileItem.isInMemory();
				long sizeInBytes = fileItem.getSize();
				out.print("여기당 !!@@@");
				
				try{
					File uploadedFile = new File(realDir, fileName);
					fileItem.write(uploadedFile);
					fileItem.delete();
				}catch(IOException ex){
					ex.printStackTrace();
					
				}
			}
		}
	}
	
	
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = map.get("id");
	String name = map.get("name");
	String title = map.get("title");
	String content = map.get("content");
	
	
	Connection conn = null;
	Statement stmt = null;
	boolean parameterNullCheck = false;
	
	try {
		String url = "jdbc:mysql://125.181.79.156:3306/notice";
		String db_id = "develop";
		String db_pw = " develop";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, db_id, db_pw);
		stmt = conn.createStatement();
		String query = "INSERT INTO NOTICE.BOARD (id, username,title,memo,time,original_file_name) VALUES('" + id + "','" + name
				+ "','" + title + "','" + content + "',sysdate());";

		out.print(query);

		//stmt = conn.prepareStatement(query);
		//stmt.executeUpdate(query);

		//out.print("<script> alert('작성 완료.'); location.href='list.jsp'</script>");
	} catch (SQLException e) {
		e.printStackTrace();
		stmt.close();
		conn.close();
	}
%>

</body>
</html>





