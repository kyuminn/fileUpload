<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%> <!--  File class 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("UTF-8");
	String path = "/multiUpload";  // 프로젝트 상의 경로
	ServletContext context = this.getServletContext();
	String fileUploadPath = context.getRealPath(path); // 서버의 경로 (톰캣에 의해 퍼블리싱 된 경로)
	
	File uploadDir = null;
	try{
		uploadDir = new File(fileUploadPath);
		String[] fileNames = uploadDir.list(); // 파일명을 String[] 배열로 받아옴
		pageContext.setAttribute("fileNames", fileNames); // el tag 쓰려면 설정해줘야함 
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	${pageContext.request.contextPath} <%-- /uploadtest --%>
	
	<c:forEach var="fileName" items="${fileNames}">
		<a href="${pageContext.request.contextPath}/multiUpload/${fileName}" download>${fileName}</a> <br>
		<a href="<c:url value='/multiUpload/${fileName}'/>" download>${fileName }</a><br>
		<!--  c :url 태그는 자동으로 contextPath 를 붙여준다!! -->
	</c:forEach>
	
</body>
</html>