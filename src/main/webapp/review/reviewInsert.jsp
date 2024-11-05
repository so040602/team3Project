<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.team3.model.bean.Review" %>
<%@ page import="com.team3.model.bean.Book" %>
<%@ page import="com.team3.model.dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<%
String appName = request.getContextPath();
String mappingName = "/coolapp";
String postForm = appName + mappingName;
String getEnvs = appName + mappingName + "?opsmode=";

BookDao bookDao = new BookDao();
List<Book> bookList = bookDao.getAllBooks();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    :root {
        --primary-color: #03C75A;
        --hover-color: #02b350;
        --error-color: #ff3b3b;
        --border-color: #e1e1e1;
        --bg-color: #f8f9fa;
        --text-color: #333;
        --text-secondary: #666;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
        background-color: var(--bg-color);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 800px;
        margin: 2rem auto;
        padding: 2rem;
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .header {
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--border-color);
    }

    .header h1 {
        font-size: 1.8rem;
        color: var(--text-color);
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    label {
        display: block;
        font-weight: 600;
        margin-bottom: 0.5rem;
        color: var(--text-color);
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    textarea:focus {
        outline: none;
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(3, 199, 90, 0.1);
    }

    textarea {
        min-height: 200px;
        resize: vertical;
    }

    .readonly-field {
        background-color: var(--bg-color);
        cursor: not-allowed;
    }

    .button-group {
        display: flex;
        gap: 1rem;
        margin-top: 2rem;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        text-decoration: none;
        gap: 0.5rem;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: white;
    }

    .btn-primary:hover {
        background-color: var(--hover-color);
    }

    .btn-secondary {
        background-color: var(--bg-color);
        color: var(--text-color);
    }

    .btn-secondary:hover {
        background-color: #e9ecef;
    }

    .error-message {
        color: var(--error-color);
        font-size: 0.875rem;
        margin-top: 0.25rem;
        display: none;
    }

    .select-container {
        position: relative;
        margin-bottom: 1.5rem;
    }

    .search-box {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        margin-bottom: 0.5rem;
        font-size: 1rem;
    }

    .custom-select {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid var(--border-color);
        border-radius: 5px;
        background-color: white;
        font-size: 1rem;
        max-height: 200px;
        overflow-y: auto;
        transition: all 0.3s ease;
    }
    .custom-select[size="1"] {
    padding: 0.75rem;
    height: auto;
    overflow: hidden;
}

    .custom-select option {
        padding: 0.5rem;
        cursor: pointer;
    }

    .custom-select option:hover {
        background-color: var(--bg-color);
    }

    .book-count {
        color: var(--text-secondary);
        font-size: 0.875rem;
        margin-top: 0.5rem;
    }

    .custom-select::-webkit-scrollbar {
        width: 8px;
    }

    .custom-select::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 4px;
    }

    .custom-select::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 4px;
    }

    .custom-select::-webkit-scrollbar-thumb:hover {
        background: #555;
    }

    @media (max-width: 768px) {
        .container {
            margin: 1rem;
            padding: 1rem;
        }

        .header h1 {
            font-size: 1.5rem;
        }

        .btn {
            padding: 0.5rem 1rem;
        }

        .button-group {
            flex-direction: column;
        }

        .btn {
            width: 100%;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-pen"></i> 리뷰 등록</h1>
        </div>

        <form id="reviewForm" action="<%=getEnvs%>reviewInsert" method="post">
            <div class="form-group">
                <label for="bookSearch">도서 검색</label>
                <input type="text" id="bookSearch" class="search-box" 
                       placeholder="도서명을 입력하여 검색...">
                
                <label for="bookidx">도서 선택 <span style="color: var(--error-color)">*</span></label>
                <select name="bookidx" id="bookidx" class="custom-select" size="8" required>
                    <option value="">도서를 선택해주세요</option>
                    <% for(Book book : bookList) { %>
                        <option value="<%=book.getbook_idx()%>">
                            <%=book.getBook_name()%>
                        </option>
                    <% } %>
                </select>
                <div id="bookError" class="error-message">도서를 선택해주세요.</div>
                <div class="book-count">전체 <span id="bookCount"><%=bookList.size()%></span>권</div>
            </div>

            <div class="form-group">
                <label for="memid">작성자</label>
                <input type="text" id="memid" name="memid" 
                       value="${sessionScope.loginfo.memid}" 
                       class="readonly-field" readonly>
            </div>

            <div class="form-group">
                <label for="review_title">제목 <span style="color: var(--error-color)">*</span></label>
                <input type="text" id="review_title" name="review_title" 
                       maxlength="100" 
                       placeholder="리뷰 제목을 입력해주세요" required>
                <div id="titleError" class="error-message">제목을 입력해주세요.</div>
            </div>

            <div class="form-group">
                <label for="review_body">내용 <span style="color: var(--error-color)">*</span></label>
                <textarea id="review_body" name="review_body" 
                          placeholder="리뷰 내용을 입력해주세요" required></textarea>
                <div id="bodyError" class="error-message">내용을 입력해주세요.</div>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-check"></i> 등록하기
                </button>
                <a href="<%=getEnvs%>reviewList" class="btn btn-secondary">
                    <i class="fas fa-list"></i> 목록으로
                </a>
            </div>
        </form>
    </div>

    <script>
    // 도서 검색 기능
    document.getElementById('bookSearch').addEventListener('input', function(e) {
        const searchText = e.target.value.toLowerCase();
        const select = document.getElementById('bookidx');
        const options = select.getElementsByTagName('option');
        let visibleCount = 0;
        
        for (let option of options) {
            if (option.value === "") continue; // 첫 번째 안내 옵션 제외
            
            const text = option.textContent.toLowerCase();
            if (text.includes(searchText)) {
                option.style.display = '';
                visibleCount++;
            } else {
                option.style.display = 'none';
            }
        }
        
        document.getElementById('bookCount').textContent = visibleCount;
    });

    // 폼 검증
    document.getElementById('reviewForm').addEventListener('submit', function(e) {
        let isValid = true;
        const book = document.getElementById('bookidx');
        const title = document.getElementById('review_title');
        const body = document.getElementById('review_body');
        
        if (!book.value) {
            document.getElementById('bookError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('bookError').style.display = 'none';
        }
        
        if (!title.value.trim()) {
            document.getElementById('titleError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('titleError').style.display = 'none';
        }
        
        if (!body.value.trim()) {
            document.getElementById('bodyError').style.display = 'block';
            isValid = false;
        } else {
            document.getElementById('bodyError').style.display = 'none';
        }
        
        if (title.value.length > 100) {
            alert('제목은 100자를 초과할 수 없습니다.');
            isValid = false;
        }
        
        if (!isValid) {
            e.preventDefault();
        }
    });

    // 입력 필드 변경 시 에러 메시지 숨기기
    ['bookidx', 'review_title', 'review_body'].forEach(id => {
        document.getElementById(id).addEventListener('input', function() {
            const errorElement = document.getElementById(id.replace('review_', '') + 'Error');
            if (errorElement) {
                errorElement.style.display = 'none';
            }
        });
    });
    
    document.getElementById('bookidx').addEventListener('change', function() {
        const searchBox = document.getElementById('bookSearch');
        const selectedOption = this.options[this.selectedIndex];
        
        if (this.value) {
            // 선택된 도서가 있을 때
            searchBox.value = selectedOption.text;
            this.size = 1; // 콤보박스를 단일 행으로 변경
        }
        
        // 검색 결과 카운트 업데이트
        const visibleCount = Array.from(this.options)
            .filter(option => option.style.display !== 'none' && option.value !== '')
            .length;
        document.getElementById('bookCount').textContent = visibleCount;
    });

    // 검색창 클릭 시 콤보박스 확장
    document.getElementById('bookSearch').addEventListener('click', function() {
        const select = document.getElementById('bookidx');
        select.size = 8; // 다시 8행으로 확장
    });

    // 검색창 이외의 영역 클릭 시 콤보박스 축소
    document.addEventListener('click', function(e) {
        const select = document.getElementById('bookidx');
        const searchBox = document.getElementById('bookSearch');
        
        if (!searchBox.contains(e.target) && !select.contains(e.target)) {
            select.size = 1;
        }
    });

    // 검색 기능 수정
    document.getElementById('bookSearch').addEventListener('input', function(e) {
        const searchText = e.target.value.toLowerCase();
        const select = document.getElementById('bookidx');
        select.size = 8; // 검색 시 콤보박스 확장
        const options = select.getElementsByTagName('option');
        let visibleCount = 0;
        
        for (let option of options) {
            if (option.value === "") continue;
            
            const text = option.textContent.toLowerCase();
            if (text.includes(searchText)) {
                option.style.display = '';
                visibleCount++;
            } else {
                option.style.display = 'none';
            }
        }
        
        document.getElementById('bookCount').textContent = visibleCount;
    });
    </script>
</body>
</html>