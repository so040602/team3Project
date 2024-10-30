<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>모두의 도서관</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* 헤더 스타일 */
        .header {
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
            transition: color 0.2s;
        }

        .logo:hover {
            color: #0066c0;
        }

        .user-menu {
            display: flex;
            gap: 20px;
        }

        .user-menu a {
            text-decoration: none;
            color: #333;
            font-size: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: color 0.2s;
        }

        .user-menu a:hover {
            color: #0066c0;
        }

        /* 검색바 스타일 */
        .search-bar {
            width: 100%;
            max-width: 600px;
            margin: 20px auto;
            padding: 10px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 12px 20px;
            border: 2px solid #0066c0;
            border-radius: 20px;
            font-size: 16px;
            transition: border-color 0.2s;
        }

        .search-input:focus {
            outline: none;
            border-color: #004080;;
        }

        /* 네비게이션 스타일 */
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
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 0;
            transition: color 0.2s;
        }

        .nav i {
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        .nav li {
            position: relative;
        }

        .nav li::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background-color: #0066c0;
            transition: width 0.3s ease;
        }

        .nav li:hover::after {
            width: 100%;
        }

        .nav a:hover {
            color: #0066c0;
        }

        /* 배너 스타일 */
        .main-banner {
            background: #fff5d7;
            padding: 40px 20px;
            margin-bottom: 40px;
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

        /* 도서 섹션 스타일 */
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
            position: relative;
        }
        .section-header::after {
            content: '';
            display: block;
            width: 100%;
            height: 1px; /* 라인의 두께 */
            background-color: #ccc; /* 라인의 색상 */
            margin-top: 10px; /* 제목과 라인 사이의 간격 */
            position: absolute; /* 추가된 부분 */
            bottom: -10px; /* 라인의 위치 조정 */
            left: 0; /* 왼쪽 정렬 */
        }
        

        .section-header a {
            color: #666;
            text-decoration: none;
            transition: color 0.2s;
        }

        .section-header a:hover {
            color: #0066c0;
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
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
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
            color: #333;
        }

        .book-person {
            color: #666;
            font-size: 14px;
        }

        .book-subinfo {
            color: #888;
            margin-top: 5px;
            font-size: 13px;
        }

        /* 서평 섹션 스타일 */
        .articles-section {
            max-width: 1200px;
            margin: 54px auto;
            padding: 20px;
            position: relative;
        }

        .articles-container {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 10px 0;
            scrollbar-width: none;
            -ms-overflow-style: none;
        }

        .articles-container::-webkit-scrollbar {
            display: none;
        }

        .article-card {
            min-width: 280px;
            max-width: 280px;
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .article-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .article-content {
            padding: 15px;
        }

        .article-tag {
            display: inline-block;
            font-size: 12px;
            color: #666;
            margin-bottom: 8px;
            background: #f8f9fa;
            padding: 4px 8px;
            border-radius: 4px;
        }

        .article-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 8px;
            line-height: 1.4;
            color: #333;
        }

        .article-source {
            font-size: 12px;
            color: #888;
            display: flex;
            align-items: center;
            justify-content: space-between;
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
            transition: all 0.3s ease;
        }

        .scroll-arrow:hover {
            background: #f8f9fa;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .scroll-left {
            left: 0;
        }

        .scroll-right {
            right: 0;
        }

        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .container {
                padding: 0 10px;
            }

            .nav ul {
                padding: 0 15px;
                gap: 15px;
                overflow-x: auto;
            }

            .book-grid {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                gap: 15px;
            }

            .book-image {
                height: 180px;
            }

            .articles-container {
                gap: 15px;
            }

            .article-card {
                min-width: 250px;
            }

            .banner-title {
                font-size: 2em;
            }

            .user-menu {
                gap: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
   <div class="container">
      <header class="header">
         <div
            style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
            <a href="#" class="logo">책숲</a>
            <div class="user-menu">
                <a href="#">
                    <i class="fas fa-right-to-bracket"></i> 로그인
                </a>
                <a href="#">
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
            <input type="text" class="search-input"
               placeholder="제목, 작가로 검색해 보세요">
         </div>
      </header>
        
      <nav class="nav">
         <ul>
            <li><a href="<%=getEnvs%>noticeList"> <i class="fas fa-bullhorn"></i> 공지사항
            </a></li>
            <li><a href="<%=getEnvs%>bookList"> <i class="fas fa-book"></i> 전체 도서
            </a></li>
            <li><a href="<%=getEnvs%>bookRaiting"> <i class="fas fa-crown"></i> 베스트 도서
            </a></li>
            <li><a href="<%=getEnvs%>bookRecent"> <i class="fas fa-book-open"></i> 신간 도서
            </a></li>
            <li><a href="#"> <i class="fas fa-pen-fancy"></i> 서평 & 추천
            </a></li>
            <li><a href="<%=getEnvs%>aibbsList"> <i class="fas fa-clipboard-list"></i> AI Lab
            </a></li>
         </ul>
      </nav>
      <div class="main-banner">
         <div class="banner-content">
            <h1 class="banner-title">
               첫 방문을 위한<br>GUIDE
            </h1>
            <p class="banner-subtitle">
               처음 방문하셨다면,<br>가이드를 따라오세요!
            </p>
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
                        <span>${book.publisher}</span> <span>|</span> <span>${book.date}</span>
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
                        <span>${book.publisher}</span> <span>|</span> <span>${book.date}</span>
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
                        <span>카타리나의집 님의 서평</span> <span>조회 8,206</span>
                     </div>
                  </div>
               </div>

               <div class="article-card">
                  <div class="article-content">
                     <span class="article-tag">베스트셀러</span>
                     <h3 class="article-title">연예인같은 정장 사바 미쓰하코, 편의점 주변의...</h3>
                     <div class="article-source">
                        <span>카타리나의집 님의 서평</span> <span>조회 7,890</span>
                     </div>
                  </div>
               </div>

               <div class="article-card">
                  <div class="article-content">
                     <span class="article-tag">신간리뷰</span>
                     <h3 class="article-title">유치원 프로젝트 책이었고 내용이 아이들 수준...</h3>
                     <div class="article-source">
                        <span>조이북스 님의 서평</span> <span>조회 6,543</span>
                     </div>
                  </div>
               </div>

               <div class="article-card">
                  <div class="article-content">
                     <span class="article-tag">추천도서</span>
                     <h3 class="article-title">영화도 재밌지만 시간 안에 내용을 담아야하니...</h3>
                     <div class="article-source">
                        <span>북커버 님의 서평</span> <span>조회 5,721</span>
                     </div>
                  </div>
               </div>

               <div class="article-card">
                  <div class="article-content">
                     <span class="article-tag">북리뷰</span>
                     <h3 class="article-title">좋주는 학철이 공상자 5)용돈...</h3>
                     <div class="article-source">
                        <span>독서의 즐거움 님의 서평</span> <span>조회 4,932</span>
                     </div>
                  </div>
               </div>
            </div>
            <div class="scroll-arrow scroll-left">❮</div>
            <div class="scroll-arrow scroll-right">❯</div>
         </div>
      </section>
   </div>
   <script>
        // 스크롤 화살표 기능
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.querySelector('.articles-container');
            const leftArrow = document.querySelector('.scroll-left');
            const rightArrow = document.querySelector('.scroll-right');

            leftArrow.addEventListener('click', () => {
                container.scrollBy({ left: -300, behavior: 'smooth' });
            });
            
            rightArrow.addEventListener('click', () => {
                container.scrollBy({ left: 300, behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
