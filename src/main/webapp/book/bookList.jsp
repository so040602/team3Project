<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>도서 목록</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<style type="text/css">
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

:root {
   --primary-color: #0066FF;
   --primary-hover: #0052CC;
   --secondary-color: #666;
   --text-color: #333;
   --border-color: #eee;
   --bg-color: #f7f8f9;
   --shadow-sm: 0 2px 8px rgba(0,0,0,0.08);
   --shadow-md: 0 5px 15px rgba(0,0,0,0.1);
   --border-radius: 12px;
}

body {
   font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
   background: var(--bg-color);
   color: var(--text-color);
   line-height: 1.6;
}

.container {
   max-width: 1300px;
   margin: 40px auto;
   padding: 40px;
   background: #fff;
   border-radius: 20px;
   box-shadow: var(--shadow-md);
   position: relative;
}

/* 헤더 & 제목 */
h2 {
   font-size: 28px;
   font-weight: 700;
   color: #111;
   margin-bottom: 35px;
   padding-bottom: 15px;
   border-bottom: 2px solid #111;
   letter-spacing: -0.5px;
}

/* 통합 검색 폼 */
#bookSearch {
   display: flex;
   align-items: center;
   gap: 15px;
   padding: 25px;
   background: #fff;
   border-radius: var(--border-radius);
   box-shadow: var(--shadow-sm);
   margin-bottom: 30px;
}

.search-wrapper {
   display: flex;
   flex: 1;
   align-items: center;
   gap: 15px;
   background: var(--bg-color);
   border: 2px solid #e0e0e0;
   border-radius: 8px;
   padding: 5px;
   transition: all 0.3s ease;
}

.search-wrapper:focus-within {
   border-color: var(--primary-color);
}

.search-wrapper select,
.search-wrapper input[type="text"] {
   padding: 12px 20px;
   font-size: 15px;
   border: none;
   background: transparent;
   outline: none;
}

.search-wrapper select {
   min-width: 140px;
   color: #333;
   cursor: pointer;
   appearance: none;
   background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
   background-repeat: no-repeat;
   background-position: right 10px center;
   background-size: 14px;
   padding-right: 30px;
}

.search-wrapper input[type="text"] {
   flex: 1;
   min-width: 200px;
   font-size: 15px;
}

button[type="submit"] {
   background: var(--primary-color);
   color: white;
   border: none;
   padding: 14px 30px;
   border-radius: 8px;
   font-weight: 500;
   font-size: 15px;
   cursor: pointer;
   transition: all 0.3s ease;
   display: flex;
   align-items: center;
   gap: 8px;
}

button[type="submit"]:hover {
   background: var(--primary-hover);
   transform: translateY(-1px);
}

/* 카테고리 선택 */
#categoryForm {
   margin-bottom: 30px;
}

.category-select {
   padding: 12px 25px;
   border: 2px solid #e0e0e0;
   border-radius: 8px;
   font-size: 15px;
   background: #fff;
   min-width: 200px;
   cursor: pointer;
   transition: all 0.3s ease;
   appearance: none;
   background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
   background-repeat: no-repeat;
   background-position: right 15px center;
   background-size: 14px;
   padding-right: 40px;
}

.category-select:hover,
.category-select:focus {
   border-color: var(--primary-color);
   outline: none;
}

/* 도서 목록 */
.book-list {
   display: grid;
   grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
   gap: 30px;
   margin-bottom: 100px;
}

.book-item {
   background: #fff;
   border-radius: 12px;
   overflow: hidden;
   transition: all 0.3s ease;
   border: 1px solid #eee;
}

.book-item:hover {
   transform: translateY(-5px);
   box-shadow: var(--shadow-md);
}

.book-image {
   width: 100%;
   height: 280px;
   object-fit: cover;
   transition: transform 0.3s ease;
}

.book-item:hover .book-image {
   transform: scale(1.03);
}

.book-details {
   padding: 20px;
}

.book-title {
   font-size: 16px;
   font-weight: 600;
   margin-bottom: 12px;
   line-height: 1.4;
}

.book-title a {
   color: #111;
   text-decoration: none;
   transition: color 0.2s;
}

.book-title a:hover {
   color: var(--primary-color);
}

.book-category {
   color: var(--primary-color);
   font-size: 14px;
   margin-bottom: 8px;
   font-weight: 500;
}

.book-description {
   color: #666;
   font-size: 14px;
   line-height: 1.6;
   margin-bottom: 15px;
}

/* 버튼 그룹 */
.button-group {
   padding: 0 20px 20px;
   display: flex;
   gap: 10px;
}

.button-group button {
   flex: 1;
   padding: 12px;
   border-radius: 8px;
   font-weight: 500;
   font-size: 14px;
   cursor: pointer;
   transition: all 0.3s ease;
}

.reserve-button {
   background: #fff;
   color: var(--primary-color);
   border: 1px solid var(--primary-color);
}

.reserve-button:hover {
   background: #f0f7ff;
}

.borrow-button {
   background: var(--primary-color);
   color: white;
   border: none;
}

.borrow-button:hover {
   background: var(--primary-hover);
}

/* 페이지네이션 */
.pagination {
   display: flex;
   justify-content: center;
   gap: 5px;
   margin-top: 40px;
   background: white;
   padding: 15px 25px;
   border-radius: 12px;
   box-shadow: var(--shadow-sm);
	position: absolute;   
	min-width:390px; 
   bottom: 30px;
   left: 50%;
   transform: translateX(-50%);
}

.page-item {
   list-style: none;
   margin: 0 2px;
}

.page-link {
   display: inline-flex;
   align-items: center;
   justify-content: center;
   min-width: 40px;
   height: 40px;
   padding: 0 12px;
   border-radius: 8px;
   border: 1px solid #e0e0e0;
   color: #333;
   text-decoration: none;
   transition: all 0.3s ease;
   font-weight: 500;
}

.page-item.active .page-link {
   background: var(--primary-color);
   color: white;
   border-color: var(--primary-color);
}

.page-link:hover:not(.disabled) {
   background: #f8f9fa;
   border-color: var(--primary-color);
   color: var(--primary-color);
}

.page-item.disabled .page-link {
   color: #999;
   pointer-events: none;
   background: #f8f9fa;
}

/* 반응형 디자인 */
@media (max-width: 768px) {
   .container {
       margin: 20px;
       padding: 20px;
   }

   #bookSearch {
       flex-direction: column;
       padding: 20px;
   }

   .search-wrapper {
       width: 100%;
   }

   button[type="submit"] {
       width: 100%;
       justify-content: center;
   }

   .book-list {
       grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
       gap: 20px;
   }

   .book-image {
       height: 220px;
   }

   .book-details {
       padding: 15px;
   }

   .button-group {
       padding: 0 15px 15px;
   }

   .pagination {
       position: static;
       transform: none;
       margin: 20px 0;
       flex-wrap: wrap;
   }
}
</style>
</head>
<body>
<div class="container">
      <h2>전체도서 목록</h2>

    <!-- 통합 검색 폼 -->
    <!-- 카테고리 설정 후 검색 내용을 Post 형식으로 bookList Controller에 전달하는 코드입니다. -->
    <form id="bookSearch" action="<%=getEnvs%>bookList" method="POST">
        <div class="search-wrapper">
            <select name="category">
                <option value="전체보기">전체</option>
                <c:forEach var="category" items="${requestScope.category_List}">
                    <option value="${category}" 
                        <c:if test="${category == requestScope.selectedCategory}">selected</c:if>> <!-- 검색 후 카테고리를 유지하기 위한 코드입니다. -->
                        ${category}
                    </option>
                </c:forEach>
            </select>
            <input type="text" name="keyword" placeholder="도서명, 저자, 출판사를 검색해보세요">
        </div>
        <button type="submit">
            <i class="fas fa-search"></i>
            검색
        </button>
    </form>
    
    
    <!-- 독립적인 카테고리 선택 -->
    <!-- 선택된 카테고리 값을 bookList에 Post 형식으로 전달-->
    <form id="categoryForm" action="<%=getEnvs%>bookList" method="POST">
        <select class="category-select" name="category" onchange="document.getElementById('categoryForm').submit()">
            <option value="전체보기">전체</option>
            <c:forEach var="category" items="${requestScope.category_List}">
                <option value="${category}" 
                    <c:if test="${category == requestScope.selectedCategory}">selected</c:if>> <!-- bookList에서 현재 카테고리 값을 받아서 카테고리를 유지하기 위한 코드입니다. -->
                    ${category}
                </option>
            </c:forEach>
        </select>
    </form>
      

      <div class="book-list" id="dataContainer">
         <c:forEach var="bean" items="${requestScope.datalist}">
            <div class="book-item">
               <img class="book-image" src="${bean.img}" alt="${bean.book_name}">
               <div class="book-details">
                  <div class="book-title">
                     <a href="<%=getEnvs%>bookDetail&book_idx=${bean.book_idx}">${bean.book_name}</a>
                  </div>
                  <div class="book-category">카테고리: ${bean.category}</div>
                  <div class="book-description">
                     <c:choose>
                        <c:when test="${fn:length(bean.description) > 50}">
                                    ${fn:substring(bean.description, 0, 50)}...
                                </c:when>
                        <c:otherwise>
                                    ${bean.description}
                                </c:otherwise>
                     </c:choose>
                  </div>
               </div>
               <c:if test="${whologin > 0}">
	               <div class="button-group">
	                  <button class="reserve-button" onclick="showConfirm(this.value)" value="${bean.book_idx}">북 마크</button>
	                  <button class="borrow-button btn-out" onclick="showBookOutConfirm(this.value)" value="${bean.book_idx}">대출하기</button>
	               </div>
               </c:if>
            </div>
         </c:forEach>
         
         <ul class="pagination">
            <c:if test="${requestScope.keyword == ''}">
               <c:if test="${pagelist.beginPage > 10}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=1&currCategory=${requestScope.selectedCategory}"><i class="fa fa-step-backward" aria-hidden="true"></i></a></li><!-- 처음 -->
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled"><i class="fa fa-step-backward" aria-hidden="true"></i></span><!-- 처음 -->
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.beginPage - 1}&currCategory=${requestScope.selectedCategory}"><i class="fa fa-backward" aria-hidden="true"></i></a></li><!-- 이전 -->
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
                        class="page-link" href="<%=getEnvs%>bookList&pageNumber=${i}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookList&pageNumber=${pagelist.endPage + 1}&currCategory=${requestScope.selectedCategory}"><i class="fa fa-forward" aria-hidden="true"></i></a></li><!-- 다음 -->
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link"><i class="fa fa-forward" aria-hidden="true"></i></span><!-- 다음 -->
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.totalPage}&currCategory=${requestScope.selectedCategory}"><i class="fa fa-step-forward" aria-hidden="true"></i></a></li><!-- 맨끝 -->
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">맨끝</span><!-- 맨끝 -->
                  </li>
               </c:if>
            </c:if>
            <c:if test="${requestScope.keyword != ''}">
               <c:if test="${pagelist.beginPage > 10}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=1&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">처음</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 10}">
                  <li class="page-item"><span class="page-link disabled">처음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage > 1}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.beginPage - 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">이전</a></li>
               </c:if>
               <c:if test="${pagelist.beginPage <= 1}">
                  <li class="page-item disabled"><span class="page-link">이전</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.beginPage <= pagelist.totalPage}">
                  <c:forEach var="i" begin="${pagelist.beginPage}"
                     end="${pagelist.endPage}">
                     <li
                        class="page-item <c:if test="${i == pagelist.pageNumber}">active</c:if>"><a
                        class="page-link" href="<%=getEnvs%>bookList&pageNumber=${i}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">${i}</a></li>
                  </c:forEach>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                        href="<%=getEnvs%>bookList&pageNumber=${pagelist.endPage + 1}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">다음</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">다음</span>
                  </li>
               </c:if>
               <c:if test="${pagelist.endPage < pagelist.totalPage}">
                  <li class="page-item"><a class="page-link"
                     href="<%=getEnvs%>bookList&pageNumber=${pagelist.totalPage}&search=${requestScope.keyword}&currCategory=${requestScope.selectedCategory}">맨끝</a></li>
               </c:if>
               <c:if test="${pagelist.endPage >= pagelist.totalPage}">
                  <li class="page-item disabled"><span class="page-link">맨끝</span> 
                  </li>
               </c:if>
            </c:if>
         </ul>         
      </div>
   </div>
   
   	<script>
	   	function showBookOutConfirm(bookidx) {
	        const result = confirm("대출을 진행 하시겠습니까?");
	        if(result) {
	            fetch('<%=getEnvs%>BookListOut', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify({bookId: bookidx})
	            })
	            .then(response => {
	                if(!response.ok) {
	                    throw new Error('Network response was not ok');
	                }
	                return response.json();
	            })
	            .then(data => {
	            	
	            	switch (data) {
		                case "불가능":
		                    alert('이미 책이 대여 중 입니다.');
		                    break;
		                case "성공":
		                    alert('해당 책이 대출되었습니다.');
		                    break;
		                case "실패":
		                    alert('책을 대출할 수 없습니다.');
		                    break;
		                case "오류":
		                    alert('대출 진행 중 오류가 발생했습니다. 다시 시도해주세요.');
		                    break;
		                case "초과":
		                    alert('대출 가능한 권수(4)를 초과했습니다.');
		                    break;
	            		}
	            })
	            .catch(error => {
	                console.error('There has been a problem with your fetch operation:', error);
	            });
	        }
	    }
    </script>
    <script>
        function showConfirm(bookidx) {
            const result = confirm("북마크에 추가 하시겠습니까?");
            if(result) {
                fetch('<%=getEnvs%>bookOutCart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({bookId: bookidx})
                })
                .then(response => {
                    if(!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                	if(data === "초과"){
                    	alert('책은 6권 이상 담을 수 없습니다.');
                    }else if(data === "중복"){
                    	alert('같은 책은 담을 수 없습니다.');
                    }else if(data === "오류"){
                    	alert('책을 담을 수 없습니다.')
                    } else if(data === "가능"){
                    	alert('북마크에 추가되었습니다.');
                    }else{
                    	alert('이미 대출중인 도서 입니다.');
                    }         
                })
                .catch(error => {
                    console.error('There has been a problem with your fetch operation:', error);
                });
            }
        }
    </script>
</body>
</html> 