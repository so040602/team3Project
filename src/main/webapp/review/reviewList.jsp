<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.team3.model.bean.Review" %>
<%@ page import="java.util.List" %>

<%@ include file="./../common/common2.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 목록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    :root {
        --primary-color: #03C75A;
        --hover-color: #02b350;
        --error-color: #ff3b3b;
        --border-color: #e1e1e1;
        --bg-color: #f8f9fa;
        --text-color: #333;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 1000px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--border-color);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header h1 {
        font-size: 1.8rem;
        color: var(--text-color);
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        gap: 0.5rem;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: white;
    }

    .btn-primary:hover {
        background-color: var(--hover-color);
    }

    .btn-secondary {
        background-color: var(--bg-color);
        color: var(--text-color);
    }

    .btn-secondary:hover {
        background-color: #e9ecef;
    }

    .review-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
        background: white;
        border-radius: 8px;
        overflow: hidden;
    }

    .review-table th,
    .review-table td {
        padding: 1rem;
        text-align: left;
        border-bottom: 1px solid var(--border-color);
    }

    .review-table th {
        background-color: var(--bg-color);
        font-weight: 600;
        color: var(--text-color);
    }

    .review-table tr:hover {
        background-color: #f8f9fa;
    }

    .review-title {
        color: var(--text-color);
        text-decoration: none;
        font-weight: 500;
    }

    .review-title:hover {
        color: var(--primary-color);
    }

    .views-count {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: #666;
    }

    .no-reviews {
        text-align: center;
        padding: 3rem;
        color: #666;
    }

    .action-link {
        color: var(--primary-color);
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.25rem;
    }

    .action-link:hover {
        color: var(--hover-color);
    }
    
    .top-header {
        background: #fff;
        border-bottom: 1px solid #e5e5e5;
        padding: 1rem 0;
        margin-bottom: 2rem;
    }

    .nav-wrapper {
        max-width: 1000px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 1rem;
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
    }

    .nav-right {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .nav-link {
        color: #666;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 0.25rem;
        font-size: 14px;
    }

    .nav-link i {
        font-size: 16px;
    }

    .nav-link:hover {
        color: #333;
    }



    @media (max-width: 768px) {
        .container {
            margin: 1rem;
            padding: 1rem;
        }

        .header {
            flex-direction: column;
            gap: 1rem;
        }

        .header h1 {
            font-size: 1.5rem;
        }

        .review-table th,
        .review-table td {
            padding: 0.75rem;
        }

        .mobile-hide {
            display: none;
        }

        .btn {
            padding: 0.5rem 1rem;
        }
    }
</style>
</head>
<body>
<header class="top-header">
    <div class="nav-wrapper">
        <a href="<%=getEnvs%>home" class="logo">댕글댕글</a>
        <div class="nav-right">
            <c:choose>
                <c:when test="${whologin == 0}">
                    <a href="<%=getEnvs%>memLogin" class="nav-link">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>로그인</span>
                    </a>
                    <a href="<%=getEnvs%>userAuthStart" class="nav-link">
                        <i class="fa-solid fa-user"></i>
                        <span>회원가입</span>
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="<%=getEnvs%>memMyPage" class="nav-link">
                        <i class="fa-solid fa-user"></i>
                        <span>마이페이지</span>
                    </a>
                    <a href="<%=getEnvs%>bookmark" class="nav-link">
                        <i class="fa-solid fa-bookmark"></i>
                        <span>북마크</span>
                    </a>
                    <a href="<%=getEnvs%>memLogout" class="nav-link">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span>로그아웃</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>




    <div class="container">
        <div class="header">
            <h1>
                <i class="fas fa-book-reader"></i>
                리뷰 목록
            </h1>
            <a href="<%=getEnvs%>reviewInsert" class="btn btn-primary">
                <i class="fas fa-pen"></i>
                리뷰 등록
            </a>
        </div>

        <% 
        List<Review> reviews = (List<Review>) request.getAttribute("reviews");
        if (reviews != null && !reviews.isEmpty()) { 
        %>
            <div class="table-responsive">
                <table class="review-table">
                    <thead>
                        <tr>
                            <th style="width: 45%">제목</th>
                            <th style="width: 15%" class="mobile-hide">도서명</th>
                            <th style="width: 15%" class="mobile-hide">작성자</th>
                            <th style="width: 10%">조회수</th>
                            <th style="width: 15%">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Review review : reviews) { %>
                            <tr>
                                <td>
                                    <a href="<%=getEnvs%>reviewDetail&reviewidx=<%=review.getReviewidx()%>" 
                                       class="review-title">
                                        <%= review.getReview_title() %>
                                    </a>
                                </td>
                                <td class="mobile-hide"><%= review.getBook_name() %></td>
                                <td class="mobile-hide"><%= review.getMemid() %></td>
                                <td>
                                    <span class="views-count">
                                        <i class="far fa-eye"></i>
                                        <%= review.getReview_cnt() %>
                                    </span>
                                </td>
                                <td><%= review.getReview_regdate() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="no-reviews">
                <i class="fas fa-info-circle"></i>
                <p>등록된 리뷰가 없습니다.</p>
            </div>
        <% } %>
    </div>
</body>
</html>