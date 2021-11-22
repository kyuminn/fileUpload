<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/upload/cos-26Dec2008.zip">파일 1</a> <br>
<a href="${pageContext.request.contextPath}/upload/text.txt" download>파일 2</a> <!--  텍스트 파일 올렸다 가정하고, 텍스트 파일의 경우 바로 출력하는데 download 옵션을 적어주면 다운로드된다 -->
<hr>
<%
	String savePath = "/upload"; // 저장할 경로 , 최상위는 Webcontent 라 생각하기 (서비스 할 때 경로)	
	ServletContext context = this.getServletContext();
	String uploadFilePath=context.getRealPath(savePath); // 서버에서 봤을때 실제 경로가 무엇인지? c:dev/... (RealPath)
	System.out.println("서버상 실제 경로:"+ uploadFilePath); // 콘솔에 출력, 톰캣은 서비스할때 이 프로젝트를 다른 경로에 복사해서 저장해둠. 그 경로를 말함. 서버상의 경로!
	File uploadDir = null ;

	try {
		uploadDir = new File(uploadFilePath);
		String[] fileNames = uploadDir.list();
		pageContext.setAttribute("fileNames", fileNames);
	}catch(Exception e){
		e.printStackTrace();
}
%>
<c:forEach var="fileName" items="${fileNames}">
	<a href="${pageContext.request.contextPath}/upload/${fileName}" download>${fileName}</a><br>
</c:forEach>
</body>
</html>