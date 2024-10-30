<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이 파일은 모든 문서에서 공통적으로 사용할 내용을 명시한 공용 파일입니다. -->
<%@ page import="java.util.*"%>

<%-- jstl을 위한 태그 라이브러리 지시어 선언 --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
String appName = request.getContextPath();

// FrontController.java 파일의 url Pattern과 동일해야 합니다.
// 서블릿 매핑을 위한 문자열 이름입니다.
String mappingName = "/coolapp";

// form 태그에서 변수 값 전달
String postForm = appName + mappingName;

// get url에서 변수 값 전달
String getEnvs = appName + mappingName + "?opsmode=";

// out.println(getEnvs);
%>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* Header Styles */
.header {
    background-color: #ffffff;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
    padding: 15px 0;
    position: sticky;
    top: 0;
    z-index: 1000;
    margin-bottom: 20px;
}

.header-content {
    max-width: 1400px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-family: 'Roboto', 'Arial', sans-serif;
    font-size: 28px;
    font-weight: 700;
    color: #333;
    text-decoration: none;
    transition: color 0.2s ease;
}

.logo:hover {
    color: #0066c0;
}

.user-menu {
    display: flex;
    gap: 25px;
    align-items: center;
}

.user-menu a {
    text-decoration: none;
    color: #555;
    font-size: 14px;
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 8px 0;
    transition: all 0.2s ease;
}

.user-menu a i {
    font-size: 16px;
    color: #666;
    transition: color 0.2s ease;
}

.user-menu a:hover {
    color: #0066c0;
}

.user-menu a:hover i {
    color: #0066c0;
}

/* Responsive Design */
@media (max-width: 768px) {
    .header-content {
        padding: 0 15px;
    }
    
    .logo {
        font-size: 24px;
    }
    
    .user-menu {
        gap: 15px;
    }
    
    .user-menu a span {
        display: none;
    }
    
    .user-menu a i {
        font-size: 18px;
    }
}

@media (max-width: 480px) {
    .user-menu {
        gap: 10px;
    }
}
</style>

<header class="header">
    <div class="header-content">
        <a href="<%=getEnvs%>home" class="logo">책숲</a>
        <nav class="user-menu">
            <c:choose>
                <c:when test="${whologin == 0}">
                    <a href="<%=getEnvs%>memLogin">
                        <i class="fas fa-right-to-bracket"></i>
                        <span>로그인</span>
                    </a>
                    <a href="<%=getEnvs%>userAuthStart">
                        <i class="fas fa-user-plus"></i>
                        <span>회원가입</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="<%=getEnvs%>mypage">
                        <i class="fas fa-user"></i>
                        <span>마이페이지</span>
                    </a>
                    <a href="<%=getEnvs%>bookmark">
                        <i class="fas fa-bookmark"></i>
                        <span>북마크</span>
                    </a>
                    <a href="<%=getEnvs%>logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>로그아웃</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</header>