<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>개별 변수 바인딩</h3>
		아이디 : ${requestScope.id}<br/>
		이름 : ${requestScope.name}<br/>
		나이 : ${requestScope.age}<br/>
		3년뒤 나이 : ${requestScope.age + 3}<br/>	
		체크 항목 : ${requestScope.hobby}<br/>
	<hr/>
	<h3>bean 객체 바인딩</h3>
		아이디 : ${requestScope.bean.id}<br/>
		이름 : ${requestScope.bean.name}<br/>
		나이 : ${requestScope.bean.age}<br/>
		3년뒤 나이 : ${requestScope.bean.age + 3}<br/>	
		체크 항목 : ${requestScope.bean.hobby}<br/>
	<hr/>
	<h3>세션 영역 바인딩</h3>
		회사 : ${sessionScope.company}<br/>
		주소 : ${sessionScope.address}<br/>		
	<hr/>	
	<h3>애플리케이션 영역 바인딩</h3>
		인사말 : ${applicationScope.hello}<br/>		
	<hr/>
</body>
</html>



