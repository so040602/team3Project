<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ include file="./../common/common.jsp" %>        
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>게시물 수정</title>
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
       max-width: 800px;
       margin: 40px auto;
       padding: 40px;
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
       flex: 0 0 120px;
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

   .file-info {
       font-size: 12px;
       color: var(--text-secondary);
       margin-bottom: 4px;
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

   .btn-primary {
       background-color: var(--primary-color);
       color: white;
       border: none;
   }

   .btn-primary:hover {
       background-color: var(--hover-color);
   }

   .btn-secondary {
       background-color: #fff;
       color: var(--text-primary);
       border: 1px solid var(--border-color);
   }

   .btn-secondary:hover {
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
       <h2>게시물 수정</h2>
       <p>${requestScope.bean.brdidx}번 게시물 수정</p>
       
       <form action="<%=postForm%>" method="post" enctype="multipart/form-data">
           <input type="hidden" name="opsmode" value="aibbsUpdate">
           
           <div class="form-row">
               <div class="form-label">번호</div>
               <div class="form-input">
                   <input type="text" id="brdidx" name="brdidx" value="${requestScope.bean.brdidx}" readonly>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">작성자</div>
               <div class="form-input">
                   <input type="text" id="memid" name="memid" value="${requestScope.bean.memid}" readonly>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">카테고리</div>
               <div class="form-input">
                   <select id="category" name="category">
                       <option value="" ${empty requestScope.bean.category ? 'selected' : ''}>선택</option>
                       <option value="인공지능" ${requestScope.bean.category eq '인공지능' ? 'selected' : ''}>인공지능</option>
                       <option value="머신러닝" ${requestScope.bean.category eq '머신러닝' ? 'selected' : ''}>머신러닝</option>
                   </select>
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">제목</div>
               <div class="form-input">
                   <input type="text" id="subtitle" name="subtitle" value="${requestScope.bean.subtitle}">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">내용</div>
               <div class="form-input">
                   <textarea id="contents" name="contents">${requestScope.bean.contents}</textarea>
               </div>
           </div>
           
           <c:forEach var="i" begin="1" end="4">
               <div class="form-row">
                   <div class="form-label">
                   		<div>첨부파일 ${i}</div>
                   		<div>파일변경 ${i}</div>
                   </div>		
                   <div class="form-input">
                       <c:set var="attachVar" value="attach0${i}" />
                       <c:if test="${not empty requestScope.bean[attachVar]}">
                           <div class="file-info">현재 파일: ${requestScope.bean[attachVar]}</div>
                       </c:if>
                       <input type="file" id="attach0${i}" name="attach0${i}" class="file-input">
                   </div>
               </div>
           </c:forEach>
           
           <div class="form-row">
               <div class="form-label">
               		<div>코드파일</div>
               		<div>파일변경</div>
               	</div>
               <div class="form-input">
                   <c:if test="${not empty requestScope.bean.codefile}">
                       <div class="file-info">현재 파일: ${requestScope.bean.codefile}</div>
                   </c:if>
                   <input type="file" id="codefile" name="codefile" class="file-input" 
                          accept=".java,.py,.js,.css,.jsp,.html,.zip,.txt,.pdf">
               </div>
           </div>
           
           <div class="form-row">
               <div class="form-label">비밀번호</div>
               <div class="form-input">
                   <input type="password" id="boardpwd" name="boardpwd">
               </div>
           </div>
           
           <div class="button-group">
               <button type="submit" class="btn btn-primary" onclick="return validCheck();">수정</button>
               <button type="reset" class="btn btn-secondary">초기화</button>
               <button type="button" class="btn btn-secondary" onclick="history.back();">취소</button>
           </div>
       </form>
   </div>
   
   <script>
    function validCheck() {
        const boardpwd = $('#boardpwd').val();

        // 비밀번호 유효성 검사
        if (boardpwd.length < 5 || boardpwd.length > 12) {
            showErrorMessage('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
            $('#boardpwd').focus();
            return false;
        }

        // 비동기 비밀번호 검사
        ajaxCheckBoardpwd(function(isValid) {
            if (!isValid) {
                showErrorMessage("비밀번호를 정확하게 입력해 주세요.");
                $('#boardpwd').val("");
                $('#boardpwd').focus();
                return false;
            }

            // 제목 검사
            const subtitle = document.getElementById('subtitle').value.trim();
            if (subtitle.length === 0) {
                alert('제목을 입력해 주세요.');
                document.getElementById('subtitle').focus();
                return false;
            }

            // 내용 검사
            const contents = document.getElementById('contents').value.trim();
            if (contents.length === 0) {
                alert('내용을 입력해 주세요.');
                document.getElementById('contents').focus();
                return false;
            }
            
            // 첨부파일 유효성 검사
            const attachments = [
                { id: 'attach01', message: 'jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.' },
                { id: 'attach02', message: 'jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.' },
                { id: 'attach03', message: 'jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.' },
                { id: 'attach04', message: 'jpg, jpeg, png, gif, pdf 파일만 첨부할 수 있습니다.' },
                { id: 'codefile', message: 'zip, java, py, js, css, jsp, html, pdf, txt 파일만 첨부할 수 있습니다.' }
            ];

            for (let attachment of attachments) {
                const fileValue = document.getElementById(attachment.id).value;
                if (fileValue.length > 0) {
                    const allowedExtensions = attachment.id === 'codefile' 
                        ? /(\.zip|\.java|\.py|\.txt|\.pdf|\.js|\.html|\.css)$/i 
                        : /(\.jpg|\.jpeg|\.png|\.gif|\.pdf)$/i;
                    
                    if (!allowedExtensions.exec(fileValue)) {
                        alert(attachment.message);
                        document.getElementById(attachment.id).focus();
                        return false;
                    }
                }
            }

            // 모든 유효성 검사 통과 후 폼 제출
            alert("모든 입력이 유효합니다!");
            document.forms[0].submit(); // 폼을 제출하여 서버에 요청
        });

        return false; // 비동기 처리가 완료되기 전까지는 폼이 제출되지 않도록 합니다.
    }

    // 비동기 Ajax 함수
    function ajaxCheckBoardpwd(callback) {
        const elmBrdId = document.getElementById('brdidx');
        const elmBrdpwd = document.getElementById('boardpwd');

        const xhr = new XMLHttpRequest();
        const url = "AjaxAibbsPwdCheck";
        
        // URL 인코딩하여 brdidx와 boardpwd를 data에 포함
        let data = "brdidx=" + encodeURIComponent(elmBrdId.value);
        data += "&boardpwd=" + encodeURIComponent(elmBrdpwd.value);

        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버의 응답에 따라 콜백 함수를 호출
                callback(xhr.responseText.trim() === "AIBBS_CORRECT_PWD");
            }
        };
        xhr.send(data);
    }
    
    // 오류 메시지를 표시하는 함수
    function showErrorMessage(message) {
        alert(message);
    }
</script>

</body>
</html>