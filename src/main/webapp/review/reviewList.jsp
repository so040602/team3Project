<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 목록</title>
</head>
<body>
    <h1>리뷰 목록</h1>
    <table>
        <tr>
            <th>번호</th>
            <th>도서명</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        <c:forEach var="review" items="${reviews}">
            <tr>
                <td>${review.reviewIdx}</td>
                <td>${review.book_name}</td>
                <td><a href="review/detail?reviewIdx=${review.reviewIdx}">${review.reviewTitle}</a></td>
                <td>${review.memId}</td>
                <td>${review.reviewRegDate}</td>
                <td>${review.reviewCnt}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>