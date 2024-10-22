<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : ${param.id}<br/>
	이름 : ${param.name}<br/>
	나이 : ${param.age}<br/>
	3년뒤 나이 : ${param.age+3}<br/>
	나머지 : ${param.age mod 5}<br/>
	동등 비교 : ${param.age eq 23}<br/>
	취미 : 
		${paramValues.hobby[0]}
		${paramValues.hobby[1]}
		${paramValues.hobby[2]}
	<br/>
</body>
</html>