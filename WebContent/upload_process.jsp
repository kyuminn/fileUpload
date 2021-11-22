<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String savePath = "/upload"; // 저장할 경로 , 최상위는 Webcontent 라 생각하기 (서비스 할 때 경로)
	int uploadFileSizeLimit = 5 * 1024 *1024 ; //1 byte 단위 => 5메가바이트
	String encType= "UTF-8";
	
	ServletContext context = this.getServletContext();
	String uploadFilePath=context.getRealPath(savePath); // 서버에서 봤을때 실제 경로가 무엇인지? c:dev/... (RealPath)
	System.out.println("서버상 실제 경로:"+ uploadFilePath); // 콘솔에 출력
	
	try {
		MultipartRequest multi = new MultipartRequest(request,uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
		
		String fileName = multi.getFilesystemName("uploadFile"); // input tag의 name값 넣기
		if (fileName== null){
			System.out.println("파일 업로드 실패");
		}else {
			out.println("작성자:"+ multi.getParameter("writer")+"<br>");
			out.println("제목:"+ multi.getParameter("title")+"<br>");
			out.println("파일 이름:"+fileName+"<br>");
		}
	}catch(Exception e){
		System.out.println("예외!");
		e.printStackTrace();
	}
	
	%>
	<a href="download.jsp">다운로드</a>
</body>
</html>