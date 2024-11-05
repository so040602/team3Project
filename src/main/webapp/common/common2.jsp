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