<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	// 세션 영역에 바인딩된 모든 데이터를 휘발(무효화)시키고, 로그인 페이지로 이동합니다.
	session.invalidate();
	response.sendRedirect("memLoginForm.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>