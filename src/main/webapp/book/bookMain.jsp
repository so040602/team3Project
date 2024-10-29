<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



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
    <meta charset="UTF-8">
    <title>모두의 도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
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
        
        .search-bar {
            width: 100%;
            max-width: 600px;
            margin: 20px auto;
            padding: 10px;
            position: relative;
        }
        
        .search-input {
            width: 100%;
            padding: 10px 20px;
            border: 2px solid #ddd;
            border-radius: 20px;
            font-size: 16px;
        }
        
        .nav {
            background: #fff;
            padding: 15px 0;
            border-bottom: 1px solid #eee;
        }
        
        .nav ul {
            display: flex;
            list-style: none;
            justify-content: center;
            gap: 30px;
        }
        
        .nav a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }
        
        .main-banner {
            background: #fff5d7;
            padding: 40px 20px;
            margin-bottom: 40px;
            text-align: left;
            position: relative;
            overflow: hidden;
        }
        
        .banner-content {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        
        .banner-title {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }
        
        .banner-subtitle {
            font-size: 1.2em;
            color: #666;
        }
        
        .book-section {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 30px;
            padding: 20px 0;
        }
        
        .book-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.2s;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .book-card:hover {
            transform: translateY(-5px);
        }
        
        .book-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        
        .book-info {
            padding: 15px;
        }
        
        .book-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 8px;
        }
        
        .book-price {
            color: #ff6b6b;
            font-weight: bold;
        }
        
        .book-subinfo {
            color: #ff0000;;
            margin-top: 5px;
        }
        
        
        //서평
        .articles-section {
            max-width: 1200px;
            margin: 54px auto;
            padding: 20px;
            overflow: hidden;
        }
        
        .articles-container {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 10px 0;
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none; /* IE and Edge */
        }
        
        .articles-container::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera */
        }
        
        .article-card {
            min-width: 280px;
            max-width: 280px;
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: transform 0.2s;
        }
        
        .article-card:hover {
            transform: translateY(-5px);
        }
        
        .article-content {
            padding: 15px;
        }
        
        .article-tag {
            display: inline-block;
            font-size: 12px;
            color: #666;
            margin-bottom: 8px;
        }
        
        .article-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 8px;
            line-height: 1.4;
        }
        
        .article-source {
            font-size: 12px;
            color: #888;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .scroll-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            z-index: 1;
        }
        
        .scroll-left {
            left: 0;
        }
        
        .scroll-right {
            right: 0;
        }
        
        
        
        
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
                <a href="<%=getEnvs%>bookMain" class="logo">모두의 도서관</a>
                <div style="display: flex; gap: 20px;">
                    <a href="#"><i class="fas fa-sign-in-alt" style="font-size: 15px;">로그인</i></a>
                    <a href="#"><i class="fas fa-sign-in-alt" style="font-size: 15px;">회원가입</i></a>
                    <a href="#"><i class="fas fa-sign-in-alt" style="font-size: 15px;">마이페이지</i></a>
                    <a href="#"><i class="fas fa-sign-in-alt" style="font-size: 15px;">북마크</i></a>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="제목, 작가로 검색해 보세요">
            </div>
        </header>
        
        <nav class="nav">
            <ul>
               <li><a href="#">공지사항</a></li>
                <li><a href="<%=getEnvs%>bookRaiting">베스트 도서</a></li>
                <li><a href="<%=getEnvs%>bookRecent">신간 도서</a></li>   
                <li><a href="#">서평 & 추천</a></li>
                <li><a href="#">대출 현황</a></li>
      
            </ul>
        </nav>
        
        <div class="main-banner">
            <div class="banner-content">
                <h1 class="banner-title">첫 방문을 위한<br>GUIDE</h1>
                <p class="banner-subtitle">처음 방문하셨다면,<br>가이드를 따라오세요!</p>
            </div>
        </div>
        
        <section class="book-section">
            <div class="section-header">
                <h2>베스트 도서</h2>
                <a href="<%=getEnvs%>bookRaiting">더보기 ></a>
            </div>
            
            <div class="book-grid">
                <c:forEach var="book" items="${bestSellers}">
                    <div class="book-card">
                        <img src="${book.img}" alt="${book.book_name}" class="book-image">
                        <div class="book-info">
                            <h3 class="book-title">${book.book_name}</h3>
                            <p class="book-person">${book.person_name}</p>
                            <div class="book-subinfo">                               
                                <span>${book.publisher}</span>                             
                                <span>|</span>
                               <span>${book.date}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        

        <section class="book-section">
            <div class="section-header">
                <h2>신간 도서</h2>
                <a href="<%=getEnvs%>bookRecent">더보기 ></a>
            </div>
            
            <div class="book-grid">
                <c:forEach var="book" items="${newBooks}">
                    <div class="book-card">
                        <img src="${book.img}" alt="${book.book_name}" class="book-image">
                        <div class="book-info">
                            <h3 class="book-title">${book.book_name}</h3>
                            <p class="book-person">${book.person_name}</p>
                            <div class="book-subinfo">                               
                                <span>${book.publisher}</span>                             
                                <span>|</span>
                               <span>${book.date}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        
        
        <section class="articles-section">
        <div class="section-header">
            <h2>&nbsp;&nbsp;서평&추천의 글</h2>
            <a href="#">더보기 ></a>
        </div>
        
        <div style="position: relative;">
            <div class="articles-container">
                <div class="article-card">
                    <div class="article-content">
                        <span class="article-tag">주목할만합니다</span>
                        <h3 class="article-title">60대가진 온티부부가 이는날 설비아파트에 임대...</h3>
                        <div class="article-source">
                            <span>카타리나의집 님의 서평</span>
                            <span>조회 8,206</span>
                        </div>
                    </div>
                </div>
                
                <div class="article-card">
                    <div class="article-content">
                        <span class="article-tag">베스트셀러</span>
                        <h3 class="article-title">연예인같은 정장 사바 미쓰하코, 편의점 주변의...</h3>
                        <div class="article-source">
                            <span>카타리나의집 님의 서평</span>
                            <span>조회 7,890</span>
                        </div>
                    </div>
                </div>
                
                <div class="article-card">
                    <div class="article-content">
                        <span class="article-tag">신간리뷰</span>
                        <h3 class="article-title">유치원 프로젝트 책이었고 내용이 아이들 수준...</h3>
                        <div class="article-source">
                            <span>조이북스 님의 서평</span>
                            <span>조회 6,543</span>
                        </div>
                    </div>
                </div>
                
                <div class="article-card">
                    <div class="article-content">
                        <span class="article-tag">추천도서</span>
                        <h3 class="article-title">영화도 재밌지만 시간 안에 내용을 담아야하니...</h3>
                        <div class="article-source">
                            <span>북커버 님의 서평</span>
                            <span>조회 5,721</span>
                        </div>
                    </div>
                </div>
                
                <div class="article-card">
                    <div class="article-content">
                        <span class="article-tag">북리뷰</span>
                        <h3 class="article-title">좋주는 학철이 공상자 5)용돈...</h3>
                        <div class="article-source">
                            <span>독서의 즐거움 님의 서평</span>
                            <span>조회 4,932</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="scroll-arrow scroll-left">❮</div>
            <div class="scroll-arrow scroll-right">❯</div>
        </div>
    </section>
        
    </div>
</body>
</html>
