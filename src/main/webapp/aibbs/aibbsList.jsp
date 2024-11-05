<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>인공지능 목록</title>
<style>
:root {
   --primary-color: #03C75A;
   --hover-color: #02b350;
   --background-color: #fff;
   --border-color: #e5e5e5;
   --text-primary: #222;
   --text-secondary: #666;
   --section-bg: #f9fafb;
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
   padding: 30px;
   background: #fff;
   border-radius: 8px;
   border: 1px solid var(--border-color);
}

.page-header {
   margin-bottom: 30px;
}

h2 {
   font-size: 24px;
   color: var(--text-primary);
   margin-bottom: 10px;
   font-weight: 600;
}

p {
   color: var(--text-secondary);
   font-size: 14px;
   margin-bottom: 20px;
}

/* 필터 영역 */
.filter-section {
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-bottom: 20px;
}

.custom-select {
   padding: 8px 12px;
   border: 1px solid var(--border-color);
   border-radius: 4px;
   font-size: 14px;
   color: var(--text-primary);
   width: 200px;
   background-color: #fff;
}

.button-group {
   display: flex;
   gap: 8px;
}

.btn {
   padding: 8px 16px;
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

/* 테이블 스타일 */
.table {
   width: 100%;
   border-top: 1px solid #222;
   border-collapse: collapse;
   margin-top: 20px;
}

.table th {
   background-color: var(--section-bg);
   padding: 12px 16px;
   font-size: 14px;
   font-weight: 500;
   color: var(--text-primary);
   text-align: left;
   border-bottom: 1px solid var(--border-color);
}

.table td {
   padding: 12px 16px;
   font-size: 14px;
   border-bottom: 1px solid var(--border-color);
   color: var(--text-secondary);
   vertical-align: middle;
}

.table tr:hover {
   background-color: #f8f9fa;
}

/* 뱃지 스타일 */
.badge {
   display: inline-flex;
   align-items: center;
   padding: 4px 8px;
   border-radius: 12px;
   font-size: 12px;
   font-weight: 500;
   margin-right: 4px;
}

.bg-secondary {
   background-color: #868e96;
   color: white;
}

.bg-primary {
   background-color: var(--primary-color);
   color: white;
}

.bg-danger {
   background-color: #ff6b6b;
   color: white;
}

/* 링크 스타일 */
a {
   color: var(--text-primary);
   text-decoration: none;
   transition: color 0.2s;
}

a:hover {
   color: var(--primary-color);
}

td a {
   display: flex;
   align-items: center;
   gap: 6px;
}

.empty-data {
   padding: 40px 0;
   text-align: center;
   color: var(--text-secondary);
   font-size: 14px;
   background-color: var(--section-bg);
}

/* 반응형 */
@media (max-width: 768px) {
   .container {
       padding: 20px;
       margin: 20px;
   }

   .filter-section {
       flex-direction: column;
       gap: 15px;
   }

   .custom-select {
       width: 100%;
   }

   .button-group {
       width: 100%;
   }

   .btn {
       flex: 1;
       justify-content: center;
   }
   
   .table {
       display: block;
       overflow-x: auto;
       white-space: nowrap;
   }

   .table th, 
   .table td {
       padding: 10px;
   }
}
</style>
</head>
<body>
   <div class="container">
       <div class="page-header">
           <h2>인공지능 목록</h2>
           <p>Team3 팀원들이 작업한 목록을 보여 주는 페이지</p>
       </div>

       <div class="filter-section">
           <select class="custom-select">
               <option value=""> 전체 카테고리 </option>
               <option value="인공지능"> 인공지능 </option>
               <option value="빅데이터"> 빅데이터 </option>
           </select>
           
           <div class="button-group">
               <button type="submit" class="btn btn-primary" onclick="aibbsInsert();">
                   <i class="fas fa-plus"></i>인공 지능 개발 추가
               </button>
               <button type="submit" class="btn btn-primary" onclick="aibbsBigData();">
                   <i class="fas fa-database"></i>빅데이터 처리 목록
               </button>
           </div>
       </div>

       <table class="table">
           <thead>
               <tr>
                   <th>번호</th>
                   <th>개발자</th>
                   <th>글제목</th>
                   <th>조회수</th>
                   <th>작성일</th>
                   <th>수정</th>
               </tr>
           </thead>
           <tbody>
               <c:forEach var="bean" items="${requestScope.datalist}">
                   <tr>
                       <td>${bean.brdidx}</td>
                       <td>${bean.memid}</td>
                       <td>
                           <a href="<%=getEnvs%>aibbsDetail&brdidx=${bean.brdidx}">
                               <c:forEach var="i" begin="1" end="${bean.depthcnt}" step="1">
                                   <span class="badge bg-secondary">re</span>
                               </c:forEach>
                               ${bean.subtitle}
                           </a>
                       </td>
                       <td>
                           <c:if test="${bean.readcnt >= 30}">
                               <span class="badge bg-primary">${bean.readcnt}</span>
                           </c:if>
                           <c:if test="${bean.readcnt < 30}">
                               <span class="badge bg-danger">${bean.readcnt}</span>
                           </c:if>
                       </td>
                       <td>${bean.regdate}</td>
                       <td>
                           <c:if test="${sessionScope.loginfo.memid == bean.memid}">
                               <a href="<%=getEnvs%>aibbsUpdate&brdidx=${bean.brdidx}" class="edit-link">수정</a>
                           </c:if>
                       </td>
                   </tr>
               </c:forEach>

               <c:if test="${empty requestScope.datalist}">
                   <tr>
                       <td colspan="6">
                           <div class="empty-data">데이터가 없습니다.</div>
                       </td>
                   </tr>
               </c:if>
           </tbody>
       </table>
   </div>

   <script>
       <%
           boolean isLoggedIn = session.getAttribute("loginfo") != null;
       %>
       function aibbsInsert() {
           const isLoggedIn = <%= isLoggedIn ? 1 : 0 %>;
           const aibbsInsertUrl = "<%= getEnvs %>aibbsInsert";

           if (!isLoggedIn) {
               alert("로그인 이후 사용할 수 있습니다.");
           } else {
               location.assign(aibbsInsertUrl);
           }
       }

       function aibbsBigData() {
           const aibbsBigListUrl = "<%= getEnvs %>aibbsBigList";
           location.assign(aibbsBigListUrl);
       }
   </script>
</body>
</html>