<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
<div class="container">
   <header class="header">
      <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
         <a href="#" class="logo">책숲</a>
         <div class="user-menu">
            <a href="<%=getEnvs%>memLogin">
               <i class="fas fa-right-to-bracket"></i> 로그인
            </a>
            <a href="<%=getEnvs%>userAuthStart">
               <i class="fas fa-user-plus"></i> 회원가입
            </a>
            <a href="#">
               <i class="fas fa-user"></i> 마이페이지
            </a>
            <a href="#">
               <i class="fas fa-bookmark"></i> 북마크
            </a>
         </div>
      </div>
      <div class="search-bar">
         <input type="text" class="search-input" placeholder="제목, 작가로 검색해 보세요">
      </div>
   </header>

   <nav class="nav">
      <ul>
         <li><a href="<%=getEnvs%>noticeList"> <i class="fas fa-bullhorn"></i> 공지사항 </a></li>
         <li><a href="<%=getEnvs%>bookList"> <i class="fas fa-book"></i> 전체 도서 </a></li>
         <li><a href="<%=getEnvs%>bookRaiting"> <i class="fas fa-crown"></i> 베스트 도서 </a></li>
         <li><a href="<%=getEnvs%>bookRecent"> <i class="fas fa-book-open"></i> 신간 도서 </a></li>
         <li><a href="<%=getEnvs%>reviewList"> <i class="fas fa-pencil-alt"></i> 서평 & 추천 </a></li>
         <li><a href="<%=getEnvs%>aibbsList"> <i class="fas fa-flask"></i> AI Lab </a></li>
      </ul>
   </nav>
</div>

<style>
    /* 기본 스타일 */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', sans-serif;
        color: #333;
        line-height: 1.6;
    }

    .header {
        padding: 20px;
        border-bottom: 1px solid #eee;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
    }

    .user-menu a {
        text-decoration: none;
        color: #333;
        font-size: 15px;
        margin-left: 20px;
    }

    .search-bar {
        margin-top: 10px;
    }

    .search-input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: 300px;
    }

    .nav {
        background: #fff;
        padding: 10px;
        border-bottom: 1px solid #eee;
    }

    .nav ul {
        display: flex;
        list-style: none;
        justify-content: left;
        gap: 30px;
        padding: 0 30px;
    }

    .nav a {
        text-decoration: none;
        color: #333;
        font-weight: 500;
        padding: 8px 0;
    }

    .nav a:hover {
        color: #0066c0;
    }
</style>
