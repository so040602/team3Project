<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
    $(document).ready(function() {
        $('input[value="${requestScope.bean.gender}"]').attr('checked', true);
        $('#birth').datepicker({
            dateFormat: "yy-mm-dd",
            changeYear: true,
            changeMonth: true,
            yearRange: "-100:+0"
        });
    });

    function showErrorMessage(message) {
        alert(message); // 오류 메시지를 alert로 표시
    }

    function validCheck() {
        const mempwd = $('#mempwd').val();

        if (mempwd.length < 5 || mempwd.length > 12) {
            showErrorMessage('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
            $('#mempwd').focus();
            return false;
        }

        // 비동기 검사를 수행하고, 비밀번호 검사가 완료된 후 나머지 검사를 진행
        ajaxCheckMempwd(function(isValid) {
            if (!isValid) {
                showErrorMessage("비밀번호를 정확하게 입력해 주세요.");
                $('#mempwd').val("");
                $('#mempwd').focus();
                return;
            }

            // 비밀번호가 유효한 경우에만 나머지 유효성 검사를 수행
            if ($('input[name="gender"]:checked').length === 0) {
                showErrorMessage('성별은 반드시 선택이 되어야 합니다.');
                return false;
            }

            const birth = $('#birth').val();
            const regexBirth = /^\d{4}[-/]\d{2}[-/]\d{2}$/;
            if (!regexBirth.test(birth)) {
                showErrorMessage('생일은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd 형식으로 입력해 주셔야 합니다.');
                $('#birth').focus();
                return false;
            }

            const email = $('#email').val();
            const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!regexEmail.test(email)) {
                showErrorMessage("이메일 주소를 정확하게 입력해 주세요");
                $('#email').val("");
                $('#email').focus();
                return false;
            }

            const addr01 = $('#addr01').val();
            if (addr01.length < 12) {
                showErrorMessage('주소를 입력해 주세요.');
                $('#addr01').focus();
                return false;
            }

            // 모든 유효성 검사를 통과했음을 알리는 메시지를 표시합니다.
            alert("모든 입력이 유효합니다!"); // 알림 메시지로 변경
            // Ajax 요청을 보냅니다.
            document.forms[0].submit(); // 폼을 제출하여 서버에 요청
        });

        return false; // 비동기 처리가 완료되기 전까지는 폼이 제출되지 않도록 합니다.
    }

    // 비동기 Ajax 함수
    function ajaxCheckMempwd(callback) {
        const elmMemid = document.getElementById('memid');
        const elmMempwd = document.getElementById('mempwd');

        const xhr = new XMLHttpRequest();
        const url = "AjaxMempwdCheck";
        
        // URL 인코딩하여 memid와 mempwd를 data에 포함
        let data = "memid=" + encodeURIComponent(elmMemid.value);
        data += "&mempwd=" + encodeURIComponent(elmMempwd.value);

        xhr.open("POST", url, true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 서버의 응답에 따라 콜백 함수를 호출
                if(xhr.responseText.trim() === "CORRECTPWD") {
                    callback(true);
                } else {
                    callback(false);
                }
            }
        };
        xhr.send(data);
    }
</script>

<style type="text/css">
:root {
    --primary-color: #03c75a;
    --primary-hover: #02b351;
    --background-color: #f5f6f7;
    --text-primary: #333;
    --text-secondary: #666;
    --border-color: #e5e5e5;
    --error-color: #ff3e3e;
    --card-shadow: 0 1px 3px rgba(0,0,0,0.1);
}

body {
    background-color: var(--background-color);
    color: var(--text-primary);
    font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    margin: 0;
    line-height: 1.6;
}

.container {
    max-width: 780px;
    margin: 2rem auto;
    padding: 2rem;
}

.card {
    background: white;
    border-radius: 12px;
    box-shadow: var(--card-shadow);
    padding: 2rem;
}

.page-title {
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--text-primary);
    margin: 0 0 0.5rem 0;
}

.page-description {
    color: var(--text-secondary);
    margin: 0 0 2rem 0;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    display: block;
    font-size: 0.875rem;
    font-weight: 500;
    color: var(--text-primary);
    margin-bottom: 0.5rem;
}

.form-control {
    width: 100%;
    padding: 0.75rem 1rem;
    font-size: 1rem;
    border: 1px solid var(--border-color);
    border-radius: 6px;
    background-color: white;
    transition: border-color 0.2s;
}

.form-control:focus {
    outline: none;
    border-color: var(--primary-color);
}

.form-control:disabled {
    background-color: var(--background-color);
    cursor: not-allowed;
}

.radio-group {
    display: flex;
    gap: 1rem;
    padding: 0.5rem 0;
}

.radio-label {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
}

.radio-input {
    width: 1.25rem;
    height: 1.25rem;
    accent-color: var(--primary-color);
}

.button-group {
    display: flex;
    gap: 1rem;
    margin-top: 2rem;
}

.btn {
    padding: 0.875rem 1.5rem;
    font-size: 1rem;
    font-weight: 500;
    border-radius: 6px;
    cursor: pointer;
    transition: all 0.2s;
    border: none;
}

.btn-primary {
    background-color: var(--primary-color);
    color: white;
}

.btn-primary:hover {
    background-color: var(--primary-hover);
}

.btn-secondary {
    background-color: gray;
    color: white; 
    border: 1px solid var(--border-color);
}

.btn-secondary:hover {
    background-color: var(--background-color);
    color: black;
}

@media (max-width: 768px) {
    .container {
        padding: 1rem;
        margin: 1rem;
    }
    
    .card {
        padding: 1.5rem;
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
        <div class="card">
            <h2 class="page-title">회원정보 수정</h2>
            <p class="page-description">회원님의 정보를 안전하게 수정하실 수 있습니다.</p>
            
            <form action="<%=postForm%>" method="post">
                <input type="hidden" name="opsmode" value="memUpdate">
                <input type="hidden" id="memid" name="memid" value="${requestScope.bean.memid}">

                <div class="form-group">
                    <label class="form-label">아이디</label>
                    <input type="text" class="form-control" disabled value="${requestScope.bean.memid}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">이름</label>
                    <input type="text" class="form-control" id="memname" name="memname" value="${requestScope.bean.memname}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="mempwd" name="mempwd">
                </div>
                
                <div class="form-group">
                    <label class="form-label">성별</label>
                    <div class="radio-group">
                        <label class="radio-label">
                            <input type="radio" class="radio-input" name="gender" value="남자" id="gender1" 
                                <c:if test="${requestScope.bean.gender == '남자'}">checked</c:if> >
                            <span>남자</span>
                        </label>
                        <label class="radio-label">
                            <input type="radio" class="radio-input" name="gender" value="여자" id="gender2" 
                                <c:if test="${requestScope.bean.gender == '여자'}">checked</c:if> >
                            <span>여자</span>
                        </label>
                    </div>
                </div>    
                
                <div class="form-group">
                    <label class="form-label">생일</label>
                    <input type="date" class="form-control" id="birth" name="birth" 
                           value="${requestScope.bean.birth != null ? requestScope.bean.birth : ''}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">휴대폰</label>
                    <input type="text" class="form-control" id="mobile" name="mobile" value="${requestScope.bean.mobile}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">이메일</label>
                    <input type="text" class="form-control" id="email" name="email" value="${requestScope.bean.email}">
                </div>
                
                <div class="form-group">
                    <label class="form-label">주소</label>
                    <input type="text" class="form-control" id="addr01" name="addr01" value="${requestScope.bean.addr01}">
                </div>

                <div class="form-group">
                    <label class="form-label">상세 주소</label>
                    <input type="text" class="form-control" id="addr02" name="addr02" value="${requestScope.bean.addr02}">
                </div>
                
				<div class="button-group" style="display: flex; justify-content: center; gap: 1rem; margin-top: 2rem;">
				    <button type="button" class="btn btn-primary" onclick="return validCheck();">수정</button>
				    <button type="button" class="btn btn-secondary" onclick="window.history.back()">취소</button>
				</div>

            </form>
        </div>
    </div>
</body>
</html>
                    
