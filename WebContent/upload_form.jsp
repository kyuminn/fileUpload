<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- enctype을 설정하지 않으면 file 이름 텍스트만 전송된다. 꼭 인캡슐래이션 타입을 지정해야 파일 자체를 서버에 전송할 수 있다 -->
	<form action="upload_process.jsp" method="post" enctype="multipart/form-data">
		<p>작성자 : <input type="text" name="writer"></p>
		<p>제목 : <input type="text" name="title"></p>
		<p>파일 : <input type="file" name="uploadFile"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>