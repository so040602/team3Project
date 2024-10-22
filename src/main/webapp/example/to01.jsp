<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글 깨짐 방지를 위하여 문자열 인코딩하기
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id") ;
	String name = request.getParameter("name") ;
	int age =  Integer.parseInt(request.getParameter("age")) ;
	
	String[] hobbies = request.getParameterValues("hobby");
	String hobby = "" ;
	
	int hobbyCount = 0; // 선택된 체크 개수
	
	if(hobbies == null){
		hobby = "제발 체크 좀 해주세요.";
	}else{
		hobbyCount = hobbies.length ;
		
		for(int i=0;i<hobbies.length;i++){
			hobby += hobbies[i] + "," ;
		}
		hobby = hobby.substring(0, hobby.length() - 1);
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	아이디 : <%=id %><br/>
	이름 : <%=name %><br/>
	나이 : <%=age %><br/>
	3년뒤 나이 : <%=age+3%><br/>
	선택된 체크 개수 : <%=hobbyCount%><br/>
	체크 항목 : <%=hobby%><br/>
</body>
</html>



