<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 이 파일은 모든 문서에서 공통적으로 사용할 내용을 명시한 공용 파일입니다. -->
<%@ page import="java.util.*"%>

<%-- jstl을 위한 태그 라이브러리 지시어 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
/* Reset CSS */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    line-height: 1.5;
    color: #333;
}

/* Header Styles */
.header {
    background-color: #ffffff;
    border-bottom: 1px solid #e5e5e5;
    padding: 12px 0;
}

.header-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    text-decoration: none;
}

.logo:hover {
    color: #333;
    text-decoration: none;
}

.user-menu {
    display: flex;
    gap: 20px;
    align-items: center;
}

.user-menu a {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #666;
    text-decoration: none;
    font-size: 14px;
}

.user-menu a:hover {
    color: #333;
    text-decoration: none;
}

/* 오른쪽 상단 아이콘 스타일 */
.menu-icon {
    color: #666;
    font-size: 20px;
    margin-left: 4px;
}

/* 로그인/회원가입 버튼 스타일 */
.auth-button {
    padding: 6px 12px;
    border-radius: 4px;
    font-size: 14px;
    text-decoration: none;
}

.login-button {
    color: #666;
}

.signup-button {
    color: #666;
}

/* Container Styles */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .header-content {
        padding: 0 15px;
    }
    
    .user-menu {
        gap: 15px;
    }
}

@media (max-width: 480px) {
    .logo {
        font-size: 20px;
    }
    
    .user-menu a span {
        display: none;
    }
    
    .user-menu {
        gap: 10px;
    }
}
</style>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Bootstrap CSS & JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

</head>
<body>
    <header class="header">
        <div class="header-content">
            <a href="<%=getEnvs%>home" class="logo" style="display: flex; align-items: center;">
            <img src="<%=appName%>/resources/images/logo.png" alt="댕글댕글 로고" style="max-height: 40px; margin-right: 8px;">
            <span style="font-size: 24px; font-weight: bold; color: #333;">댕글댕글 도서관</span>
        </a>
            <nav class="user-menu">
                <c:choose>
                    <c:when test="${whologin == 0}">
                        <a href="<%=getEnvs%>memLogin" class="login-button">
                            <i class="fa-solid fa-right-to-bracket menu-icon"></i>
                            <span>로그인</span>
                        </a>
                        <a href="<%=getEnvs%>userAuthStart" class="signup-button">
                            <i class="fa-solid fa-user menu-icon"></i>
                            <span>회원가입</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="<%=getEnvs%>memMyPage">
                            <i class="fa-solid fa-user menu-icon"></i>
                            <span>마이페이지</span>
                        </a>
                        <a href="<%=getEnvs%>bookmark">
                            <i class="fa-solid fa-bookmark menu-icon"></i>
                            <span>북마크</span>
                        </a>
                        <a href="<%=getEnvs%>memLogout">
                            <i class="fa-solid fa-right-from-bracket menu-icon"></i>
                            <span>로그아웃</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </nav>
        </div>
    </header>
</body>
</html>