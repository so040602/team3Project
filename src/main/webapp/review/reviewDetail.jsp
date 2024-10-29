<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세보기</title>
</head>
<body>
    <h1>리뷰 상세보기</h1>
    <p>도서명: ${review.book_name}</p>
    <p>제목: ${review.reviewTitle}</p>
    <p>내용: ${review.reviewBody}</p>
    <p>작성자: ${review.memId}</p>
    <p>작성일: ${review.reviewRegDate}</p>
    <p>수정일: ${review.reviewUpdated}</p>
    <p>조회수: ${review.reviewCnt}</p>
    <a href="review/list">목록으로</a>
</body>
</html>