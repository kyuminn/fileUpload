<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러개의 파일 업로드</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String savePath = "/multiUpload";
	ServletContext context = this.getServletContext();
	String uploadFilePath = context.getRealPath(savePath); // 서버상에 파일이 실제로 업로드되는 경로 
	int uploadFileSizeLimit = 5 * 1024 * 1024 * 1024;
	String encType= "UTF-8";
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()){
			String file = (String)files.nextElement();
			String fileName = multi.getFilesystemName(file);
			String originalFileName= multi.getOriginalFileName(file);
			
			out.println("업로드된 파일명:"+fileName+"<br>");
			out.println("원본 파일명:"+originalFileName+"<br>");
			out.println("<hr>");
		}
	}catch(Exception e){
		System.out.println("예외 발생!");
		e.printStackTrace();
	}
	%>
	
	<a href="multiDownload.jsp">다운로드</a>
</body>
</html>