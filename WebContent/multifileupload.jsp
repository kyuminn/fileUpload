<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러개의 파일 업로드</title>
</head>
<body>
	<form action="multiuploadProc.jsp" enctype="multipart/form-data" method="post">
		1. 파일 지정 : <input type="file" name="uploadFile01"> <br>
		2. 파일 지정 : <input type="file" name="uploadFile02"> <br>
		3. 파일 지정 : <input type="file" name="uploadFile03"> <br>
		<input type="submit" value="전송">
	</form>
</body>
</html>