<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ include file="./../common/common.jsp" %>        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시물 수정</title>
	<style type="text/css">
		.container { margin-top: 10px; }
		.input-group { margin: 7px; }
		.input-group-text { display: inline-block; width: 120px; text-align: center; }
		#buttonset { margin-top: 15px; }
		#boardNo { display: none; visibility: hidden; }
	</style>
</head>
<body>
	<div class="container">
		<h2>게시물 수정</h2>
		<p>${requestScope.bean.brdidx}번 게시물 수정</p>
		
		<form action="<%=postForm%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="opsmode" value="aibbsUpdate">
			
			<div class="input-group">
				<span class="input-group-text col-md-2">번호</span>
				<input id="brdidx" name="brdidx" type="text" class="form-control" value="${requestScope.bean.brdidx}" readonly>
			</div>
			
			<div class="input-group">
				<span class="input-group-text col-md-2">작성자</span>
				<input id="memid" name="memid" disabled="disabled" type="text" class="form-control" 
					value="${requestScope.bean.memid}" readonly>
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">카테고리</span> 
				<select id="category" name="category" class="custom-select">
					<option value="" <c:if test="${empty requestScope.bean.category}">selected</c:if>> 선택 </option>
					<option value="인공지능" <c:if test="${requestScope.bean.category eq '인공지능'}">selected</c:if>> 인공지능 </option>
					<option value="빅데이터" <c:if test="${requestScope.bean.category eq '빅데이터'}">selected</c:if>> 빅데이터 </option>
				</select>	
			</div>
			
			<div class="input-group">
				<span class="input-group-text col-md-2">제목</span> 
				<input id="subtitle" name="subtitle" type="text" class="form-control" value="${requestScope.bean.subtitle}" autocomplete="off">
			</div>
			<div class="input-group">
				<span class="input-group-text col-md-2">내용</span> 
				<textarea id="contents" name="contents" class="form-control" autocomplete="off"
					style="height:200px; min-height:200px; max-height:300px;">${requestScope.bean.contents}</textarea>
			</div>  
			
			<c:if test="${not empty requestScope.bean.attach01}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(1)</span> 
					<input id="attach01FileName" type="text" class="form-control" value="${requestScope.bean.attach01}" readonly />
				</div>	
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(1) 변경</span> 
					<input id="attach01" name="attach01" type="file" class="form-control">
				</div>
			</c:if>
			<c:if test="${empty requestScope.bean.attach01}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(1)</span> 
					<input id="attach01" name="attach01" type="file" class="form-control">
				</div>
			</c:if>
						
			<c:if test="${not empty requestScope.bean.attach02}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(2)</span> 
					<input type="text" class="form-control" value="${requestScope.bean.attach02}" readonly />
				</div>	
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(2) 변경</span> 
					<input id="attach02" name="attach02" type="file" class="form-control">
				</div>
			</c:if>
			<c:if test="${empty requestScope.bean.attach02}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(2)</span> 
					<input id="attach02" name="attach02" type="file" class="form-control">
				</div>
			</c:if>
			
			<c:if test="${not empty requestScope.bean.attach03}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(3)</span> 
					<input type="text" class="form-control" value="${requestScope.bean.attach03}" readonly />
				</div>	
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(3) 변경</span> 
					<input id="attach03" name="attach03" type="file" class="form-control">
				</div>
			</c:if>
			<c:if test="${empty requestScope.bean.attach03}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(3)</span> 
					<input id="attach03" name="attach03" type="file" class="form-control">
				</div>
			</c:if>
			
			<c:if test="${not empty requestScope.bean.attach04}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(4)</span> 
					<input type="text" class="form-control" value="${requestScope.bean.attach04}" readonly />
				</div>	
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(4) 변경</span> 
					<input id="attach04" name="attach04" type="file" class="form-control">
				</div>
			</c:if>
			<c:if test="${empty requestScope.bean.attach04}">
				<div class="input-group">
					<span class="input-group-text col-md-2">첨부파일(4)</span> 
					<input id="attach04" name="attach04" type="file" class="form-control">
				</div>
			</c:if>
			
			<c:if test="${not empty requestScope.bean.codefile}">
				<div class="input-group">
					<span class="input-group-text col-md-2">코드파일</span> 
					<input type="text" class="form-control" value="${requestScope.bean.codefile}" readonly />
				</div>	
				<div class="input-group">
					<span class="input-group-text col-md-2">코드파일 변경</span> 
					<input id="codefile" name="codefile" type="file" class="form-control" 
						accept=".zip,.java,.py,.js,.css,.jsp,.html,.pdf,.txt">
				</div>
			</c:if>
			<c:if test="${empty requestScope.bean.codefile}">
				<div class="input-group">
					<span class="input-group-text col-md-2">코드파일</span> 
					<input id="codefile" name="codefile" type="file" class="form-control">
				</div>
			</c:if>
						
			<div class="input-group">
				<span class="input-group-text col-md-2">비밀번호</span> 
				<input id="boardpwd" name="boardpwd" type="password" class="form-control" autocomplete="off">
			</div> 			
			<div id="buttonset" class="input-group d-flex justify-content-center">
			    <button type="submit" class="btn btn-primary btn-lg" onclick="return validCheck();">수정</button>
			    <button type="reset" class="btn btn-secondary btn-lg mx-2">초기화</button>
			    <button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">취소</button>
			</div>
		</form>
	</div>

<script>
    function validCheck() {
        const boardpwd = $('#boardpwd').val();

        if (boardpwd.length < 5 || boardpwd.length > 12) {
            showErrorMessage('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
            $('#boardpwd').focus();
            return false;
        }

        // 비동기 검사를 수행하고, 비밀번호 검사가 완료된 후 나머지 검사를 진행
        ajaxCheckBoardpwd(function(isValid) {
            if (!isValid) {
                showErrorMessage("비밀번호를 정확하게 입력해 주세요.");
                $('#boardpwd').val("");
                $('#boardpwd').focus();
                return false;
            }

            // 제목 필드 검사
            const subtitle = document.getElementById('subtitle').value.trim();
            if (subtitle.length === 0) {
                alert('제목을 입력해 주세요.');
                document.getElementById('subtitle').focus();
                return false;
            }

            // 내용 필드 검사
            const contents = document.getElementById('contents').value.trim();
            if (contents.length === 0) {
                alert('내용을 입력해 주세요.');
                document.getElementById('contents').focus();
                return false;
            }
            
            // 첨부파일 검사: 반드시 입력되어야 함
            const attach01FileName = document.getElementById('attach01FileName').value;
            const attach01 = document.getElementById('attach01').value;
            
            if (!attach01FileName && attach01.length === 0) {
                alert('첨부파일(1)은 반드시 입력해 주세요.');
                document.getElementById('attach01').focus();
                return false;
            }

            // 파일 확장자 검사
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

            // 모든 유효성 검사를 통과한 경우
            alert("모든 입력이 유효합니다!"); // 알림 메시지
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

        
