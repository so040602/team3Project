<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <style>
        .write-form {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        textarea {
            min-height: 300px;
            resize: vertical;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="write-form">
            <h2>리뷰 작성</h2>
            
            <form action="<%=getEnvs%>reviewInsert" method="post">
                <input type="hidden" name="command" value="reviewInsert">
                
                <div class="form-group">
                    <label for="review_title">제목</label>
                    <input type="text" name="review_title" id="review_title" 
                           class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="review_body">내용</label>
                    <textarea name="review_body" id="review_body" 
                              class="form-control" required></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary">등록</button>
                <a href="<%=getEnvs%>reviewList" class="btn btn-secondary">취소</a>
            </form>
        </div>
    </div>
</body>
</html>