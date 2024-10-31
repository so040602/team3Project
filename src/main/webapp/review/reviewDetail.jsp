<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세보기</title>
    <style>
        .review-detail {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
        }
        .review-header {
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .review-content {
            min-height: 200px;
            margin: 20px 0;
            white-space: pre-wrap;
        }
        .btn-group {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="review-detail">
            <div class="review-header">
                <h2>${review.review_title}</h2>
                <p>
                    도서: ${review.book_name} | 
                    작성자: ${review.memid} | 
                    조회수: ${review.review_cnt} | 
                    작성일: <fmt:formatDate value="${review.review_regdate}" pattern="yyyy-MM-dd HH:mm"/>
                </p>
            </div>
            
            <div class="review-content">
                ${review.review_body}
            </div>
            
            <div class="btn-group">
                <a href="<%=getEnvs%>reviewList" class="btn btn-primary">목록</a>
                <c:if test="${sessionScope.loginfo.memid eq review.memid}">
                    <a href="<%=getEnvs%>reviewUpdate&reviewIdx=${review.reviewidx}" 
                       class="btn btn-success">수정</a>
                    <a href="<%=getEnvs%>reviewDelete&reviewIdx=${review.reviewidx}" 
                       class="btn btn-danger" 
                       onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>