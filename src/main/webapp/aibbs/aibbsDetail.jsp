<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시물 상세보기</title>
<style>
:root {
   --primary-color: #03C75A;
   --hover-color: #02b350;
   --background-color: #f5f6f8;
   --card-background: #fff;
   --text-primary: #222;
   --text-secondary: #666;
   --border-color: #e5e5e5;
}

body {
   background-color: var(--background-color);
   font-family: 'Pretendard', -apple-system, BlinkMacSystemFont, system-ui, sans-serif;
   margin: 0;
   padding: 0;
   color: var(--text-primary);
   line-height: 1.5;
}

.container {
   max-width: 1000px;
   margin: 40px auto;
   padding: 40px;
   background: var(--card-background);
   border-radius: 8px;
   border: 1px solid var(--border-color);
}

h2 {
   font-size: 24px;
   color: var(--text-primary);
   margin-bottom: 30px;
   padding-bottom: 15px;
   border-bottom: 1px solid var(--border-color);
   font-weight: 600;
}

.table {
   width: 100%;
   border-collapse: collapse;
   margin-bottom: 30px;
}

.table th {
   width: 150px;
   background-color: #f9fafb;
   padding: 16px 20px;
   text-align: left;
   color: var(--text-primary);
   font-weight: 500;
   font-size: 14px;
   border-bottom: 1px solid var(--border-color);
   vertical-align: top;
}

.table td {
   padding: 16px 20px;
   color: var(--text-primary);
   font-size: 14px;
   border-bottom: 1px solid var(--border-color);
   line-height: 1.6;
}

/* 이미지 스타일 */
.image-container {
   margin: 10px 0;
}

.image-container img {
   max-width: 100%;
   height: auto;
   border-radius: 4px;
   border: 1px solid var(--border-color);
}

/* 파일 다운로드 링크 */
.file-download {
   display: inline-flex;
   align-items: center;
   gap: 8px;
   padding: 8px 16px;
   background-color: #f8f9fa;
   border: 1px solid var(--border-color);
   border-radius: 4px;
   color: var(--text-primary);
   text-decoration: none;
   font-size: 14px;
   transition: all 0.2s;
}

.file-download:hover {
   background-color: #e9ecef;
   border-color: #dde0e4;
}

.file-download i {
   color: var(--primary-color);
}

/* 버튼 스타일 */
.button-container {
   display: flex;
   justify-content: center;
   margin-top: 30px;
}

.btn {
   padding: 10px 24px;
   border-radius: 4px;
   font-size: 14px;
   font-weight: 500;
   cursor: pointer;
   transition: all 0.2s;
   border: none;
   display: inline-flex;
   align-items: center;
   gap: 6px;
}

.btn-primary {
   background-color: var(--primary-color);
   color: white;
}

.btn-primary:hover {
   background-color: var(--hover-color);
}

/* 반응형 */
@media (max-width: 768px) {
   .container {
       margin: 20px;
       padding: 20px;
   }

   .table th {
       width: 100px;
       padding: 12px;
   }

   .table td {
       padding: 12px;
   }

   h2 {
       font-size: 20px;
       margin-bottom: 20px;
   }
}
</style>
</head>
<body>
   <div class="container">
       <h2>${requestScope.bean.subtitle}</h2>
       
       <table class="table">
           <tbody>
               <tr>
                   <th>글번호</th>
                   <td>${requestScope.bean.brdidx}</td>
               </tr>
               <tr>
                   <th>작성자</th>
                   <td>${requestScope.bean.memid}</td>
               </tr>
               <tr>
                   <th>조회수</th>
                   <td>${requestScope.bean.readcnt}</td>
               </tr>
               <tr>
                   <th>글내용</th>
                   <td>
                   		${requestScope.convertedContents}
                   </td>
               </tr>

               <c:forEach var="i" begin="1" end="4">
                   <tr>
                       <th>
                       		<div>첨부파일(${i})</div>
                       </th>
                       <td>
                           <c:set var="attachVar" value="attach0${i}" />
                           <c:choose>
                               <c:when test="${not empty requestScope.bean[attachVar]}">
                                   <div class="image-container">
                                       <img src="${requestScope.filePath}/${requestScope.bean[attachVar]}" 
                                           alt="첨부 이미지 ${i}" />
                                   </div>
                               </c:when>
                               <c:otherwise>
                                   첨부파일이 없습니다.
                               </c:otherwise>
                           </c:choose>
                       </td>
                   </tr>
               </c:forEach>

               <tr>
                   <th>코드파일</th>
                   <td>
                       <c:choose>
                           <c:when test="${not empty requestScope.bean.codefile}">
                               <a href="${requestScope.filePath}/${requestScope.bean.codefile}" 
                                  class="file-download" download>
                                   <i class="fa fa-file-code"></i>
                                   ${requestScope.bean.codefile}
                               </a>
                           </c:when>
                           <c:otherwise>
                               코드파일이 없습니다.
                           </c:otherwise>
                       </c:choose>
                   </td>
               </tr>
           </tbody>
       </table>

       <div class="button-container">
           <button type="button" class="btn btn-primary" onclick="history.back();">
               <i class="fas fa-arrow-left"></i>
               돌아가기
           </button>
       </div>
   </div>
</body>
</html>