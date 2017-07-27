<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<!--  test -->
<body>

	<%
		response.setCharacterEncoding("UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		out.print(isMultipart);

		File temporaryDir = new File("/Users/Mac");
		out.print("<br/>");
		String realDir = config.getServletContext().getRealPath("/upload/");

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1 * 1024 * 1024); //1메가가 넘지 않으면 메모리에서 바로 사용
		factory.setRepository(temporaryDir);

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(10 * 1024 * 1024);
		
		List<FileItem> items = upload.parseRequest(request);
		Iterator iter = items.iterator(); //Iterator 사용
		 
		while (iter.hasNext()) {
			FileItem fileItem = (FileItem) iter.next(); //파일을 가져온다

			out.print(fileItem.isFormField());

			if (fileItem.isFormField()) { //업로드도니 파일이 text형태인지 다른 형태인지 체크
												// text형태면 if문에 걸림
				out.println("폼 파라미터: " + fileItem.getFieldName() + 
						"=" + fileItem.getString("utf-8") + "<br>");
			} else { //파일이면 이부분의 루틴을 탄다
				if (fileItem.getSize() > 0) { //파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
					String fieldName = fileItem.getFieldName();
					String fileName = fileItem.getName();
					String contentType = fileItem.getContentType();
					boolean isInMemory = fileItem.isInMemory();
					long sizeInBytes = fileItem.getSize();
					out.println("파일 [fieldName] : " + fieldName + "<br/>");
					out.println("파일 [fileName] : " + fileName + "<br/>");
					out.println("파일 [contentType] : " + contentType + "<br/>");
					out.println("파일 [isInMemory] : " + isInMemory + "<br/>");
					out.println("파일 [sizeInBytes] : " + sizeInBytes + "<br/>");

					try {
						File uploadedFile = new File(realDir, fileName); //실제 디렉토리에 fileName으로 카피 된다.
						fileItem.write(uploadedFile);
						fileItem.delete(); //카피 완료후 temp폴더의 temp파일을 제거
					} catch (IOException ex) {
						ex.printStackTrace();
					}
				}
			}
		}
	%>
</body>
</html>