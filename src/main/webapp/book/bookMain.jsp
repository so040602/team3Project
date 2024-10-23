<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
            height: 250px;
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
        
        .book-rating {
            color: #ffd700;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <div style="max-width: 1200px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center;">
                <a href="#" class="logo">모두의 도서관</a>
                <div style="display: flex; gap: 20px;">
                    <a href="#"><img src="notification.png" alt="로그인" width="24"></a>
                    <a href="#"><img src="cart.png" alt="회원가입" width="24"></a>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="제목, 작가,로 검색해 보세요">
            </div>
        </header>
        
        <nav class="nav">
            <ul>
                <li><a href="#">베스트 도서</a></li>
                <li><a href="#">신간 도서</a></li>
                <li><a href="#">추천 도서</a></li>
            </ul>
        </nav>
        
        <div class="main-banner">
            <div class="banner-content">
                <h1 class="banner-title">첫 방문 위한<br>GUIDE</h1>
                <p class="banner-subtitle">처음 방문하셨다면,<br>가이드를 따라오세요!</p>
            </div>
        </div>
        
        <section class="book-section">
            <div class="section-header">
                <h2>베스트 도서</h2>
                <a href="<%=getEnvs%>bookList">더보기 ></a>
            </div>
            
            <div class="book-grid">
                <c:forEach var="book" items="${bestSellers}">
                    <div class="book-card">
                        <img src="${book.img}" alt="${book.name}" class="book-image">
                        <div class="book-info">
                            <h3 class="book-title">${book.name}</h3>
                            <p class="book-price">${book.price}원</p>
                            <div class="book-rating">
                                <span>★</span>
                                <span>${book.rating}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <!-- 다른 도서 섹션도 추가 가능 -->
    </div>
</body>
</html>
