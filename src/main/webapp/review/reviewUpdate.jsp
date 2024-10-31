<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 수정</title>
    <style>
        .container {
            margin-top: 20px;
        }
        .panel {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .panel-heading {
            padding: 10px 15px;
            border-bottom: 1px solid #ddd;
            background-color: #f5f5f5;
        }
        .panel-body {
            padding: 15px;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="panel">
            <div class="panel-heading">
                <h2>리뷰 수정</h2>
            </div>
            <div class="panel-body">
                <form action="<%=getEnvs%>reviewUpdate" method="post">
                    <input type="hidden" name="command" value="reviewUpdate">
                    <input type="hidden" name="reviewIdx" value="${requestScope.bean.reviewidx}">
                    
                    <div class="form-group">
                        <label for="review_title">제목</label>
                        <input type="text" class="form-control" id="review_title" 
                            name="review_title" value="${requestScope.bean.review_title}" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="review_body">내용</label>
                        <textarea class="form-control" id="review_body" 
                            name="review_body" rows="10" required>${requestScope.bean.review_body}</textarea>
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-primary">수정하기</button>
                        <a class="btn btn-danger" href="<%=getEnvs%>reviewList">취소</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>