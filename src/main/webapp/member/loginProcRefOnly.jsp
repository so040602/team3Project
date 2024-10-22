<%@page import="com.team3.model.bean.Member"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>    

<%
	Map<String, String> memberList = new HashMap<String, String>();
	memberList.put("admin", "1234") ; // 관리자 계정
	memberList.put("hong", "1234") ; // 일반 사용자 계정
%>

<%
	// post 전송 방식 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8"); 

	// 사용자의 로그인 계정 정보
	String memid = request.getParameter("memid");
	String mempwd = request.getParameter("mempwd");
	
	boolean isLogin = false ; // false이면 로그인 실패라고 가정
	
	boolean isIdExist = memberList.containsKey(memid) ; // mem_id 존재 여부
	
	if(isIdExist){ // 해당 아이디가 존재하는 경우
		String dbPsw = memberList.get(memid) ;
		if(mempwd.equals(dbPsw)){
			isLogin = true ; // 로그인 가능 
		} else { // 비번 불일치
			
		}
	}else{ // 존재하지 않는 경우
		
	}
		
	String message = "" ;
	if(isLogin){
		Member mem = new Member();
		mem.setMemid(memid);
		mem.setMempwd(mempwd) ;
		mem.setMemname("홍길동") ;
		
		// loginfo : 세션 영역에 저장한 로그인 정보를 담고 있는 속성(attribute)
		session.setAttribute("loginfo", mem);
		
		message = "로그인 성공(" + memid + ")" ;
		
		// sendRedirect : 리다이렉션 방식으로 페이지를 전환합니다.
		response.sendRedirect("./../product/prdList.jsp");
		
	} else {
		message = "로그인 실패" ; 
		// alertMessage : 세션 영역에 저장한 경고성 Alert 창을 띄우기 위한 속성(attribute)
		session.setAttribute("alertMessage", "아이디/비번 정보를 잘못 입력하셨습니다.");
		response.sendRedirect("memLoginForm.jsp");
	}
	
	out.print(message);
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