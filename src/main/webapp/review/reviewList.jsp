<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
    <style>
        .review-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .review-table th, .review-table td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .review-table th {
            background-color: #f5f5f5;
        }
        .btn-write {
            float: right;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>도서 리뷰 목록</h2>
        
        <div class="btn-write">
            <a href="<%=getEnvs%>reviewInsert" class="btn btn-primary">리뷰 작성</a>
        </div>
        
        <table class="review-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>책 제목</th>
                    <th>작성자</th>
                    <th>조회수</th>
                    <th>작성일자</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="review" items="${requestScope.reviews}">
                    <tr>
                        <td>${review.reviewidx}</td>
                        <td>
                            <a href="<%=getEnvs%>reviewDetail&reviewIdx=${review.reviewidx}">
                                ${review.review_title}
                            </a>
                        </td>
                        <td>${review.book_name}</td>
                        <td>${review.memid}</td>
                        <td>${review.review_cnt}</td>
                        <td>
                            <fmt:formatDate value="${review.review_regdate}" pattern="yyyy-MM-dd HH:mm"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
