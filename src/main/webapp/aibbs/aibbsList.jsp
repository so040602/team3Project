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
   border-top: 2px solid #333;
   border-collapse: collapse;
   margin-top: 20px;
   table-layout: fixed;  /* 칼럼 너비 고정 */
}

.table th {
   background-color: var(--section-bg);
   padding: 12px 16px;
   font-size: 14px;
   font-weight: 500;
   color: var(--text-primary);
   text-align: center;  /* 중앙 정렬 */
   border-bottom: 1px solid var(--border-color);
   white-space: nowrap;
}

.table td {
   padding: 12px 16px;
   font-size: 14px;
   border-bottom: 1px solid var(--border-color);
   color: var(--text-secondary);
   vertical-align: middle;
   text-align: center;  /* 중앙 정렬 */
}

/* 칼럼별 너비 조정 */
.table th:nth-child(1), 
.table td:nth-child(1) { /* 번호 */
   width: 8%;
}

.table th:nth-child(2),
.table td:nth-child(2) { /* 개발자 */
   width: 15%;
}

.table th:nth-child(3),
.table td:nth-child(3) { /* 글제목 */
   width: 40%;
   text-align: left;  /* 글제목만 좌측 정렬 */
}

.table th:nth-child(4),
.table td:nth-child(4) { /* 조회수 */
   width: 10%;
}

.table th:nth-child(5),
.table td:nth-child(5) { /* 작성일 */
   width: 15%;
}

.table th:nth-child(6),
.table td:nth-child(6) { /* 수정,삭제 */
   width: 12%;
}

.table tr:hover {
  background-color: #f8f9fa;
}

/* 수정/삭제 버튼 컨테이너 */
.button-group-right {
    display: flex;
    gap: 8px;
    justify-content: center;  /* 중앙 정렬 */
    flex-direction: row;  /* 가로 방향으로 배치 */
    align-items: center;  /* 세로 중앙 정렬 */
    width: 100%;  /* 너비를 100%로 설정 */
}

.btn-edit, .btn-delete {
    padding: 4px 8px;
    border-radius: 4px;
    font-size: 14px;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center; /* 내용 중앙 정렬 */
    gap: 4px;
    min-width: 50px; /* 최소 너비 설정 */
    white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}

.btn-edit {
   color: var(--primary-color);
}

.btn-delete {
   color: #ff6b6b;
}

.btn-edit:hover {
   background-color: var(--primary-color);
   color: white;
}

.btn-delete:hover {
   background-color: #ff6b6b;
   color: white;
}

/* 뱃지 스타일 */
.badge {
   min-width: 40px;
   height: 24px;
   display: inline-flex;
   justify-content: center;
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

/* 아이콘 스타일 */
.fas {
   font-size: 12px;
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
           <select class="custom-select" onchange="moveCate(this)">
               <option value=""> 전체 카테고리 </option>
               <option value="인공지능" <c:if test="${requestScope.selectedCate == '인공지능'}">selected</c:if>> 인공지능 </option>
               <option value="머신러닝" <c:if test="${requestScope.selectedCate == '머신러닝'}">selected</c:if>> 머신러닝 </option>
           </select>
           
           <div class="button-group">
               <button type="submit" class="btn btn-primary" onclick="aibbsInsert();">
                   <i class="fas fa-plus"></i>개발 산출물 추가
               </button>
               <!--button type="submit" class="btn btn-primary" onclick="aibbsBigData();">
                   <i class="fas fa-database"></i>머신러닝 처리 목록
               </button-->
           </div>
       </div>
       
		<script>
		    function moveCate(selectElem) {
		        const category = encodeURIComponent(selectElem.value);  // 선택된 카테고리 값 인코딩
		        const myURL = "<%= getEnvs %>aibbsList&category=" + category;  // 동적으로 URL 생성
		        location.assign(myURL);  // 해당 URL로 이동
		    }
		</script>

       <table class="table">
           <thead>
               <tr>
                   <th>번호</th>
                   <th>개발자</th>
                   <th>글제목</th>
                   <th>조회수</th>
                   <th>작성일</th>
                   <th>수정 · 삭제</th>
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
        <div class="button-group-right">
            <a href="<%=getEnvs%>aibbsUpdate&brdidx=${bean.brdidx}" class="btn btn-edit">
                <i class="fas fa-edit"></i> 수정
            </a>
            <a href="#" onclick="confirmDelete(${bean.brdidx}); return false;" class="btn btn-delete">
                <i class="fas fa-trash-alt"></i> 삭제
            </a>
        </div>
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
       
       <div style="display: flex; justify-content: center; align-items: center; margin-top:10px;">
			<ul class="pagination">
	            <c:if test="${requestScope.keyword == ''}">
	               <c:if test="${pagelist.beginPage > 10}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=1&category=${requestScope.selectedCate}"><i class="fa fa-step-backward" aria-hidden="true"></i></a></li><!-- 처음 -->
	               </c:if>
	               <c:if test="${pagelist.beginPage <= 10}">
	                  <li class="page-item"><span class="page-link disabled"><i class="fa fa-step-backward" aria-hidden="true"></i></span><!-- 처음 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.beginPage > 1}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.beginPage - 1}&category=${requestScope.selectedCate}"><i class="fa fa-backward" aria-hidden="true"></i></a></li><!-- 이전 -->
	               </c:if>
	               <c:if test="${pagelist.beginPage <= 1}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-backward" aria-hidden="true"></i></span><!-- 이전 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.beginPage <= pagelist.totalPage}">
	                  <c:forEach var="i" begin="${pagelist.beginPage}"
	                     end="${pagelist.endPage}">
	                     <li
	                        class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
	                        class="page-link" href="<%=getEnvs%>aibbsList&pageNumber=${i}&category=${requestScope.selectedCate}">${i}</a></li>
	                  </c:forEach>
	               </c:if>
	               <c:if test="${pagelist.endPage < pagelist.totalPage}">
	                  <li class="page-item"><a class="page-link"
	                        href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.endPage + 1}&category=${requestScope.selectedCate}"><i class="fa fa-forward" aria-hidden="true"></i></a></li><!-- 다음 -->
	               </c:if>
	               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-forward" aria-hidden="true"></i></span><!-- 다음 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.endPage < pagelist.totalPage}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.totalPage}&category=${requestScope.selectedCate}"><i class="fa fa-step-forward" aria-hidden="true"></i></a></li><!-- 맨끝 -->
	               </c:if>
	               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-step-forward" aria-hidden="true"></i></span><!-- 맨끝 -->
	                  </li>
	               </c:if>
	            </c:if>
	            <c:if test="${requestScope.keyword != ''}">
	               <c:if test="${pagelist.beginPage > 10}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=1&search=${requestScope.keyword}&category=${requestScope.selectedCate}"><i class="fa fa-step-backward" aria-hidden="true"></i></a></li><!-- 처음 -->
	               </c:if>
	               <c:if test="${pagelist.beginPage <= 10}">
	                  <li class="page-item"><span class="page-link disabled"><i class="fa fa-step-backward" aria-hidden="true"></i></span><!-- 처음 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.beginPage > 1}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.beginPage - 1}&search=${requestScope.keyword}&category=${requestScope.selectedCate}"><i class="fa fa-backward" aria-hidden="true"></i></a></li><!-- 이전 -->
	               </c:if>
	               <c:if test="${pagelist.beginPage <= 1}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-backward" aria-hidden="true"></i></span><!-- 이전 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.beginPage <= pagelist.totalPage}">
	                  <c:forEach var="i" begin="${pagelist.beginPage}"
	                     end="${pagelist.endPage}">
	                     <li
	                        class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
	                        class="page-link" href="<%=getEnvs%>aibbsList&pageNumber=${i}&search=${requestScope.keyword}&category=${requestScope.selectedCate}">${i}</a></li>
	                  </c:forEach>
	               </c:if>
	               <c:if test="${pagelist.endPage < pagelist.totalPage}">
	                  <li class="page-item"><a class="page-link"
	                        href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.endPage + 1}&search=${requestScope.keyword}&category=${requestScope.selectedCate}"><i class="fa fa-forward" aria-hidden="true"></i></a></li><!-- 다음 -->
	               </c:if>
	               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-forward" aria-hidden="true"></i></span><!-- 다음 -->
	                  </li>
	               </c:if>
	               <c:if test="${pagelist.endPage < pagelist.totalPage}">
	                  <li class="page-item"><a class="page-link"
	                     href="<%=getEnvs%>aibbsList&pageNumber=${pagelist.totalPage}&search=${requestScope.keyword}&category=${requestScope.selectedCate}"><i class="fa fa-step-forward" aria-hidden="true"></i></a></li><!-- 맨끝 -->
	               </c:if>
	               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
	                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-step-forward" aria-hidden="true"></i></span> <!-- 맨끝 -->
	                  </li>
	               </c:if>
	            </c:if>
	         </ul>     
   		</div>
       
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
       
      
       function confirmDelete(brdidx) {
    	    if (confirm('정말 이 게시글을 삭제하시겠습니까?')) {
    	        window.location.href = '<%=getEnvs%>aibbsDelete&brdidx=' + brdidx;
    	    }
    	}
   </script>
</body>
</html>