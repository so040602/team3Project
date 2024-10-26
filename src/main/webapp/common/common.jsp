<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이 파일은 모든 문서에서 공통적으로 사용할 내용을 명시한 공용 파일입니다. -->
<%@ page import="java.util.*"%>

<%-- jstl을 위한 태그 라이브러리 지시어 선언 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--%@ taglib prefix="c" uri="http://jakarta.apache.org/jsp/jstl/core" %-->
<!--%@ taglib prefix="fmt" uri="http://jakarta.apache.org/jsp/jstl/fmt" %-->
<!--%@ taglib prefix="fn" uri="http://jakarta.apache.org/jsp/jstl/functions" %-->

<%-- whologin 변수는 현재 로그인 상태를 알려 주는 변수입니다. --%>
<%-- 미로그인(0), 일반 사용자(1), 관리자(2) --%>
<c:set var="whologin" value="0" /> 
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.memid == 'admin'}">
		<c:set var="whologin" value="2" /> 
	</c:if>
	<c:if test="${sessionScope.loginfo.memid != 'admin'}">
		<c:set var="whologin" value="1" /> 
	</c:if>	
</c:if>

<%
	// 나의 프로젝트(애플리케이션 이름) 이름이며, 컨텍스트 이름이라고 합니다.
	String appName = request.getContextPath() ;
	
	// FrontController.java 파일의 url Pattern과 동일해야 합니다.
	// 서블릿 매핑을 위한 문자열 이름입니다.
	String mappingName = "/coolapp" ;
	
	// form 태그에서 변수 값 전달
	String postForm = appName + mappingName ; 
	
	// get url에서 변수 값 전달
	String getEnvs = appName + mappingName + "?opsmode=" ;
	
	// out.println(getEnvs);
%>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 부트 스트랩은 제이 쿼리를 기반으로 하므로, 제이 쿼리 선언이 먼저 나와야 합니다. -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	
</script>

<!-- for BootStrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- for jQueryUI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<style type="text/css">
	/* Alert Box 여백 주기 */
	.alert-dismissible{margin:10px;}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
				${applicationScope.settings.application_name}
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<c:if test="${whologin eq 0}">
							<a class="nav-link">미로그인</a>
						</c:if>					
						<c:if test="${whologin ne 0}">
							<a class="nav-link">${sessionScope.loginfo.memname} 님</a>
						</c:if>
					</li>
					
					<!-- member section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin eq 0}">
								<li><a class="dropdown-item" href="<%=getEnvs%>memInsert">회원 가입</a></li>
								<li><a class="dropdown-item" href="<%=getEnvs%>memLogin">로그인</a></li>								
							</c:if>
							
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="<%=getEnvs%>memUpdate&memid=${sessionScope.loginfo.memid}">정보 수정</a></li>
								<li><a class="dropdown-item" href="<%=getEnvs%>memLogout">로그 아웃</a></li>
								<li><a class="dropdown-item" href="<%=getEnvs%>memDetail&memid=${sessionScope.loginfo.memid}">상세 보기</a></li>
								<li><a class="dropdown-item" href="#">탈퇴 하기</a></li>
							</c:if>	
												
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=getEnvs%>memList">회원 목록</a></li>							
							</c:if>						

							
						</ul>
					</li>	
					
					<!-- board section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">게시물</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="<%=getEnvs%>brdInsert">게시물 등록</a></li>
							</c:if>
							<li><a class="dropdown-item" href="<%=getEnvs%>brdList">목록 보기</a></li>	
						</ul>
					</li>	
					
					<!-- product section -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
						
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=getEnvs%>prdInsert">상품 등록</a></li>
							</c:if>
							
							<li><a class="dropdown-item" href="<%=getEnvs%>prdList">목록 보기</a></li>	
						</ul>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">도서</a>
						<ul class="dropdown-menu">												
							<li><a class="dropdown-item" href="<%=getEnvs%>bookList">도서 목록</a></li>	
							<li><a class="dropdown-item" href="<%=getEnvs%>bookMain">도서 메인페이지</a></li>						
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=getEnvs%>bookEndowment">기증 하기</a></li>
							</c:if>	
						</ul>
					</li>						
					
				</ul>
			</div>
		</div>
	</nav>
	<c:if test="${not empty sessionScope.alertMessage}">	
		<%-- 사용자에게 주의/경고/오류 등을 알려 주기 위한 Alert Box --%>
		<div class="alert alert-danger alert-dismissible">
	  		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	  		<strong>경고 메시지</strong>
	  		&nbsp;&nbsp;
	  		${sessionScope.alertMessage}
		</div>
		
		<%-- 사용자에게 보여 주었던 Alert Box를 세션에서 제거하도록 합니다. --%>
		<c:remove var="alertMessage" scope="session"/>	
	</c:if>	 









