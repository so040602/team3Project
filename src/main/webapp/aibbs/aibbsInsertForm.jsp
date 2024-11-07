<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="./../common/common.jsp" %>        
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>인공지능 개발 등록</title>
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
       max-width: 800px;  /* 600px에서 800px로 증가 */
    margin: 40px auto;
    padding: 40px;     /* 30px에서 40px로 증가 */
    background: var(--card-background);
    border-radius: 8px;
    border: 1px solid var(--border-color);
   }

   h2 {
       font-size: 20px;
       font-weight: 600;
       color: var(--text-primary);
       margin: 0 0 8px 0;
   }

   p {
       color: var(--text-secondary);
       font-size: 13px;
       margin-bottom: 24px;
   }

   .form-row {
       display: flex;
       margin-bottom: 12px;
   }

   .form-label {
       flex: 0 0 120px;  /* 100px에서 120px로 증가 */
    padding: 10px;
    font-size: 13px;
    font-weight: 500;
    color: var(--text-primary);
   }

   .form-input {
       flex: 1;
       padding: 4px 0;
   }

   input[type="text"],
   input[type="password"],
   textarea,
   select {
       width: 100%;
       padding: 8px 12px;
       border: 1px solid var(--border-color);
       border-radius: 4px;
       font-size: 13px;
       color: var(--text-primary);
   }

   select {
       background-color: #fff;
   }

   input[readonly] {
       background-color: #f8f9fa;
       color: var(--text-secondary);
   }

   textarea {
       min-height: 150px;
       resize: vertical;
   }

   .file-input {
       font-size: 13px;
   }

   .button-group {
       display: flex;
       justify-content: center;
       gap: 8px;
       margin-top: 30px;
       padding-top: 20px;
       border-top: 1px solid var(--border-color);
   }

   .btn {
       padding: 8px 16px;
       border-radius: 4px;
       font-size: 13px;
       font-weight: 500;
       cursor: pointer;
       transition: all 0.2s;
   }

   .btn-submit {
       background-color: var(--primary-color);
       color: white;
       border: none;
   }

   .btn-submit:hover {
       background-color: var(--hover-color);
   }

   .btn-cancel {
       background-color: #fff;
       color: var(--text-primary);
       border: 1px solid var(--border-color);
   }

   .btn-cancel:hover {
       background-color: #f8f9fa;
   }

   @media (max-width: 768px) {
       .container {
           margin: 20px;
           padding: 20px;
       }

       .form-row {
           flex-direction: column;
       }

       .form-label {
           padding: 8px 0;
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
       <h2>인공 지능 개발 추가</h2>
       <p>Team3 개발자들이 인공 지능을 개발한 결과물을 등록하는 페이지입니다.</p>
       
       <form action="<%=postForm%>" method="post" enctype="multipart/form-data">
           <input type="hidden" name="opsmode" value="aibbsInsert">
           
           <div class="form-row">
               <div class="form-label">작성자</div>
               <div class="form-input">
                   <input type="text" value="${sessionScope.loginfo.memname}(${sessionScope.loginfo.memid})" readonly>
                   <input type="hidden" name="memid" value="${sessionScope.loginfo.memid}">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">카테고리</div>
               <div class="form-input">
                   <select name="category" required>
                       <option value="">- 선택 -</option>
                       <option value="인공지능">인공지능</option>
                       <option value="머신러닝">머신러닝</option>
                   </select>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">제목</div>
               <div class="form-input">
                   <input type="text" name="subtitle" required>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">내용</div>
               <div class="form-input">
                   <textarea name="contents" required></textarea>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">첨부파일 1</div>
               <div class="form-input">
                   <input type="file" name="attach01" class="file-input" accept="image/*,application/pdf" required>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">첨부파일 2</div>
               <div class="form-input">
                   <input type="file" name="attach02" class="file-input" accept="image/*,application/pdf">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">첨부파일 3</div>
               <div class="form-input">
                   <input type="file" name="attach03" class="file-input" accept="image/*,application/pdf">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">첨부파일 4</div>
               <div class="form-input">
                   <input type="file" name="attach04" class="file-input" accept="image/*,application/pdf">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">코드파일</div>
               <div class="form-input">
                   <input type="file" name="codefile" class="file-input" accept=".java,.py,.js,.css,.jsp,.html,.zip,.txt,.pdf">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">비밀번호</div>
               <div class="form-input">
                   <input type="password" name="boardpwd" required>
               </div>
           </div>
           
           <div class="button-group">
               <button type="submit" class="btn btn-submit">등록</button>
               <button type="reset" class="btn btn-cancel">초기화</button>
               <button type="button" class="btn btn-cancel" onclick="history.back();">취소</button>
           </div>
       </form>
   </div>
</body>
</html>