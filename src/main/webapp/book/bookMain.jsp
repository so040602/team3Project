<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.team3.model.dao.ReviewDao"%>
<%@ page import="com.team3.model.bean.Review"%>
<%@ page import="java.util.List"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

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
String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";
ReviewDao reviewDao = new ReviewDao();
List<Review> reviews = reviewDao.list(); // 전체 리뷰 목록 가져오기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>댕글댕글</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
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
    width: 100%;
}

.nav ul {
   display: flex;
    list-style: none;
    justify-content: space-between; /* changed from left to space-between */
    max-width: 1200px;
    margin: 0 auto; /* center the navigation */
    padding: 0 30px;
}

.nav a {
   text-decoration: none;
    color: #333;
    font-weight: 500;
    display: flex;
    align-items: center;
    justify-content: center; /* 아이콘과 텍스트 중앙 정렬 */
    gap: 8px;
    padding: 8px 0;
    transition: color 0.2s;
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.nav i {
   font-size: 18px;
   width: 24px;
   text-align: center;
}

.nav li {
   position: relative;
    flex: 1; /* 각 항목이 동일한 공간을 차지하도록 설정 */
    text-align: center;
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
    width: 100%;
    margin-bottom: 40px;
}
.swiper {
    width: 100%;
    height: 400px;
}
.swiper-slide svg {
    width: 100%;
    height: 100%;
}
.swiper-button-next, .swiper-button-prev {
    color: #0066cc;
}
.swiper-pagination-bullet-active {
    background: #0066cc;
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
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.book-card:hover {
   transform: translateY(-5px);
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
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

.book-link {
   color: inherit;
   text-decoration: none;
   transition: color 0.2s;
}

.book-link:hover {
   color: #0066c0; /* 마우스 오버시 색상 변경 */
}

.articles-section {
   padding: 20px;
   margin-bottom: 30px;
}

.section-header {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-bottom: 20px;
}

.section-header h2 {
   font-size: 1.5rem;
   color: #333;
}

.section-header a {
   color: #666;
   text-decoration: none;
}

.articles-container {
   display: flex;
   overflow-x: hidden;
   scroll-behavior: smooth;
   gap: 20px;
   padding: 10px 0;
}

.article-card {
   min-width: 280px;
   background: white;
   border-radius: 8px;
   box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
   transition: transform 0.3s ease;
}

.article-card:hover {
   transform: translateY(-5px);
}

.article-content {
   padding: 15px;
}

.article-tag {
   display: inline-block;
   padding: 4px 8px;
   background-color: #f0f0f0;
   color: #666;
   border-radius: 4px;
   font-size: 0.8rem;
   margin-bottom: 10px;
}

.article-title {
   font-size: 1rem;
   margin: 10px 0;
   line-height: 1.4;
   height: 2.8em;
   overflow: hidden;
   display: -webkit-box;
   -webkit-line-clamp: 2;
   -webkit-box-orient: vertical;
}

.article-title a {
   color: #333;
   text-decoration: none;
}

.article-title a:hover {
   color: #03C75A;
}

.article-source {
   font-size: 0.85rem;
   color: #888;
   display: flex;
   justify-content: space-between;
   align-items: center;
}

.scroll-arrow {
   position: absolute;
   top: 50%;
   transform: translateY(-50%);
   width: 40px;
   height: 40px;
   background: rgba(255, 255, 255, 0.9);
   border-radius: 50%;
   display: flex;
   align-items: center;
   justify-content: center;
   cursor: pointer;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
   z-index: 1;
}

.scroll-left {
   left: -20px;
}

.scroll-right {
   right: -20px;
}

/* 반응형 스타일 */
@media ( max-width : 768px) {
   .container {
      padding: 0 10px;
   }
   .nav ul {
        padding: 0 15px;
        justify-content: flex-start; /* 모바일에서는 왼쪽 정렬 */
        overflow-x: auto;
    }
    
    .nav li {
        flex: 0 0 auto; /* 모바일에서는 자동 크기로 변경 */
        padding: 0 15px;
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
   .main-banner {
        padding: 40px 20px;
        min-height: auto;
    }

    .banner-content {
        flex-direction: column;
        text-align: center;
    }

    .banner-title {
        font-size: 2.5em;
    }

    .banner-subtitle {
        font-size: 1.1em;
    }

    .banner-illustration {
        display: none;
    }
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
            <a href="<%=getEnvs%>home" class="logo" style="display: flex; align-items: center;">
            <img src="<%=appName%>/resources/images/logo.png" alt="댕글댕글 로고" style="max-height: 40px; margin-right: 8px;">
            <span style="font-size: 24px; font-weight: bold; color: #333;">댕글댕글</span>
        </a>

            <div class="user-menu">
               <c:choose>
                  <c:when test="${whologin == 0}">
                     <a href="<%=getEnvs%>memLogin"> <i
                        class="fas fa-right-to-bracket"></i> 로그인
                     </a>
                     <a href="<%=getEnvs%>userAuthStart"> <i
                        class="fas fa-user-plus"></i> 회원가입
                     </a>
                  </c:when>
                  <c:otherwise>
                     <a href="<%=getEnvs%>memMyPage"> <i class="fas fa-user"></i>
                        마이페이지
                     </a>

                     <a href="<%=getEnvs%>bookmark"> <i class="fas fa-bookmark"></i>
                        북마크
                     </a>
                     <a href="<%=getEnvs%>memLogout"> <i class="fas fa-sign-out-alt"></i>
                        <span>로그아웃</span>
                     </a>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
         <div class="search-bar">
            <form action="<%=getEnvs%>searchBook" method="POST" id="searchForm">
               <input type="text" class="search-input" name="keyword"
                  placeholder="제목, 작가로 검색해 보세요" autocomplete="off">
            </form>
         </div>

         <script>
document.addEventListener('DOMContentLoaded', function() {
    const searchForm = document.getElementById('searchForm');
    const searchInput = searchForm.querySelector('.search-input');
    
    // URL 파라미터에서 message 확인
    const urlParams = new URLSearchParams(window.location.search);
    const message = urlParams.get('message');
    if (message) {
        alert(decodeURIComponent(message));
    }
    
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            const keyword = searchInput.value.trim();
            if (keyword !== '') {
                searchForm.submit();
            } else {
                alert('검색어를 입력해주세요.');
            }
        }
    });
});
</script>
      </header>

      <nav class="nav">
         <ul>
            <li><a href="<%=getEnvs%>noticeList"> <i
                  class="fas fa-bullhorn"></i> 공지사항
            </a></li>
            <li><a href="<%=getEnvs%>bookList"> <i class="fas fa-book"></i>
                  전체 도서
            </a></li>
            <li><a href="<%=getEnvs%>bookRaiting"> <i
                  class="fas fa-crown"></i> 베스트 도서
            </a></li>
            <li><a href="<%=getEnvs%>bookRecent"> <i
                  class="fas fa-book-open"></i> 신간 도서
            </a></li>
            <li><a href="<%=getEnvs%>reviewList"> <i
                  class="fas fa-pencil-alt"></i> 도서 리뷰
            </a></li>
            <li><a href="<%=getEnvs%>aibbsList"> <i
                  class="fas fa-flask"></i> AI Lab
            </a></li>
         </ul>
      </nav>
      
      
      <div class="main-banner">
    <div class="swiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
    <!-- 첫 번째 배너 -->
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 400">
        <rect width="1200" height="450" fill="#1e3a8a"/>
        <!-- 배경 원 위치 조정 -->
        <circle cx="900" cy="200" r="180" fill="#2563eb" opacity="0.3"/>
        <circle cx="850" cy="150" r="120" fill="#3b82f6" opacity="0.2"/>
        
        <!-- 텍스트 영역 -->
        <text x="150" y="180" font-family="Arial" font-size="56" fill="white" font-weight="bold">
            이달의 추천도서
        </text>
        <text x="150" y="240" font-family="Arial" font-size="36" fill="#93c5fd">
            당신의 새로운 시작을 함께할
        </text>
        <text x="150" y="290" font-family="Arial" font-size="36" fill="#93c5fd">
            특별한 이야기
        </text>
        
        <!-- 책 이미지 그룹을 오른쪽으로 이동 -->
        <g transform="translate(750,80)">
            <rect x="0" y="0" width="250" height="280" fill="#bfdbfe" rx="5"/>
            <rect x="25" y="40" width="200" height="25" fill="white" opacity="0.6"/>
            <rect x="25" y="90" width="150" height="25" fill="white" opacity="0.4"/>
        </g>
    </svg>
</div>
<div class="swiper-slide">
    <!-- 두 번째 배너 - 회원가입 이벤트 -->
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 400">
        <rect width="1200" height="450" fill="#f0f9ff"/>
        <path d="M900,0 L1200,0 L1200,400 L700,400" fill="#0ea5e9" opacity="0.9"/>
        <circle cx="950" cy="200" r="120" fill="#38bdf8" opacity="0.3"/>
        
        <!-- 텍스트 영역 -->
        <text x="150" y="180" font-family="Arial" font-size="56" fill="#0369a1" font-weight="bold">
            신규 회원가입 이벤트
        </text>
        <text x="150" y="240" font-family="Arial" font-size="36" fill="#0284c7">
            가입 즉시 대출 연체 면제권
        </text>
        <text x="150" y="290" font-family="Arial" font-size="32" fill="#0ea5e9">
            특별 혜택 무료로 드려요!
        </text>
        
        <!-- 회원카드와 책 이미지 표현 -->
        <g transform="translate(750,80)">
            <!-- 회원 카드 -->
            <rect x="0" y="20" width="250" height="150" fill="#0ea5e9" rx="10"/>
            <rect x="20" y="50" width="80" height="80" fill="white" opacity="0.6" rx="40"/>
            <rect x="120" y="60" width="100" height="10" fill="white" opacity="0.8"/>
            <rect x="120" y="80" width="80" height="10" fill="white" opacity="0.6"/>
            
            <!-- 책 스택 -->
            <rect x="30" y="140" width="200" height="140" fill="#0284c7" rx="5"/>
            <rect x="50" y="160" width="160" height="20" fill="white" opacity="0.6"/>
            <rect x="50" y="190" width="120" height="20" fill="white" opacity="0.4"/>
        </g>
    </svg>
</div>
<div class="swiper-slide">
    <!-- 세 번째 배너 -->
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 400">
        <rect width="1200" height="450" fill="#f3f4f6"/>
        <rect x="600" y="0" width="600" height="400" fill="#4b5563" opacity="0.1"/>
        
        <!-- 텍스트 영역 -->
        <text x="150" y="180" font-family="Arial" font-size="56" fill="#111827" font-weight="bold">
            신간 도서 특별전
        </text>
        <text x="150" y="240" font-family="Arial" font-size="36" fill="#4b5563">
            이번 주 신규 입고된
        </text>
        <text x="150" y="290" font-family="Arial" font-size="36" fill="#4b5563">
            베스트 신간을 만나보세요
        </text>
        
        <!-- 책 스택 이미지 그룹을 오른쪽으로 이동 -->
        <g transform="translate(750,80)">
            <rect x="0" y="0" width="200" height="280" fill="#374151" rx="5"/>
            <rect x="15" y="40" width="170" height="25" fill="white" opacity="0.6"/>
            <rect x="50" y="20" width="200" height="280" fill="#6b7280" rx="5"/>
            <rect x="65" y="60" width="170" height="25" fill="white" opacity="0.5"/>
            <rect x="100" y="40" width="200" height="280" fill="#9ca3af" rx="5"/>
            <rect x="115" y="80" width="170" height="25" fill="white" opacity="0.4"/>
        </g>
    </svg>
</div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
</div>

<!-- Swiper JS - body 끝나기 전에 위치 -->
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script>
    const swiper = new Swiper('.swiper', {
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        loop: true,
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
</script>

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
                     <h3 class="book-title">
                        <a href="<%=getEnvs%>bookDetail&book_idx=${book.book_idx}"
                           class="book-link"> ${book.book_name} </a>
                     </h3>

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
                     <h3 class="book-title">
                        <a href="<%=getEnvs%>bookDetail&book_idx=${book.book_idx}"
                           class="book-link"> ${book.book_name} </a>
                     </h3>

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
            <h2>&nbsp;&nbsp;도서 리뷰</h2>
            <a href="<%=getEnvs%>reviewList">더보기 ></a>
         </div>

         <div style="position: relative;">
            <div class="articles-container">
               <%
               // 최대 5개까지만 표시
               int count = 0;
               for (Review review : reviews) {
                  if (count >= 5)
                     break;
               %>
               <div class="article-card">
                  <div class="article-content">
                     <span class="article-tag"> <%=review.getBook_name()%> <!-- 도서명을 태그로 표시 -->
                     </span>
                     <h3 class="article-title">
                        <a
                           href="<%=getEnvs%>reviewDetail&reviewidx=<%=review.getReviewidx()%>">
                           <%=review.getReview_title()%>
                        </a>
                     </h3>
                     <div class="article-source">
                        <span><%=review.getMemid()%> 님의 서평</span> <span>조회 <%=review.getReview_cnt()%></span>
                     </div>
                  </div>
               </div>
               <%
               count++;
               }
               if (reviews.isEmpty()) {
               %>
               <div class="article-card">
                  <div class="article-content">
                     <h3 class="article-title">등록된 리뷰가 없습니다.</h3>
                  </div>
               </div>
               <%
               }
               %>
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
