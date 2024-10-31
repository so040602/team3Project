<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 가입</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Noto Sans KR', sans-serif;
        }
        
        .container {
            max-width: 800px;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-top: 50px;
            margin-bottom: 50px;
        }
        
        .page-title {
            color: #333;
            font-weight: bold;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
        }
        
        .sub-title {
            color: #666;
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        
        .input-group {
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .input-group-text {
            width: 120px;
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            color: #495057;
            font-weight: 500;
        }
        
        .form-control {
            border: 1px solid #ddd;
            padding: 12px;
            font-size: 1rem;
        }
        
        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        
        .radio-group {
            padding: 10px 15px;
        }
        
        .radio_gender {
            margin-right: 20px;
            font-size: 1rem;
        }
        
        .radio-inline input[type="radio"] {
            margin-right: 5px;
        }
        
        #buttonset {
            margin-top: 30px;
            gap: 10px;
            display: flex;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        
        .btn-reset {
            background-color: #6c757d;
            border: none;
            color: white;
        }
        
        .btn-reset:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }
        
        .input-group-append {
            display: flex;
        }
        
        .id-check-btn {
            border-radius: 0 8px 8px 0 !important;
            white-space: nowrap;
        }
        
        /* 반응형 스타일 */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                margin-top: 20px;
            }
            
            .input-group {
                flex-direction: column;
            }
            
            .input-group-text {
                width: 100%;
                border-radius: 8px 8px 0 0;
                padding: 8px;
            }
            
            .form-control {
                border-radius: 0;
            }
            
            .radio-group {
                padding: 15px;
            }
            
            #buttonset {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
            
            .id-check-btn {
                border-radius: 0 0 8px 8px !important;
                width: 100%;
            }
        }
    </style>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	        $('#birth').datepicker({dateFormat:"yy-mm-dd"});
	    });
//-----------------------------------------------------------------------// 추가된 함수 필요 없으면 지워주세요.
        // ID 중복 체크 함수
        function validCheck() {
            const memid = $('#memid').val();
            
            if (memid.length < 4 || memid.length > 12) {
                alert('아이디는 4글자 이상 12글자 이하로 입력해 주세요.');
                $('#memid').focus();
                return;
            }
            
            // Ajax를 사용하여 서버에 중복 확인 요청
            $.ajax({
                url: 'checkId.jsp',  // 실제 중복 체크를 처리할 서버 엔드포인트
                type: 'POST',
                data: { memid: memid },
                success: function(response) {
                    // 서버로부터의 응답을 처리
                    if (response.trim() === 'available') {
                        alert('사용 가능한 아이디입니다.');
                    } else {
                        alert('이미 사용중인 아이디입니다.');
                        $('#memid').val('').focus();
                    }
                },
                error: function() {
                    alert('중복 확인 중 오류가 발생했습니다.');
                }
            });
        }
//--------------------------------------------------------------------------//

	    function validCheck() {

	        const memidOK = $('#memidOK').val(); 
	        
	        if (memidOK == "NOTYET") { 
	            alert('해당 아이디 사용을 확인하시기 바랍니다.'); 
	            return false; 
	        } else if (memidOK == "USEOK") { 
	            alert('해당 아이디는 사용할 수 있습니다.'); 
	            $('#memidOK').prop("readonly", true); 
	        } else {
	            alert('해당 아이디는 사용할 수 없습니다.'); 
	            $('#memid').val(""); 
	            $('#memid').focus(); 
	            return false; 
	        }
	
	        const memname = $('#memname').val();
	        if (memname.length < 2 || memname.length > 12) {
	            alert('이름은 2글자 이상 12글자 이하로 입력해 주세요.');
	            $('#memname').focus();
	            return false;
	        }
	
	        const mempwd = $('#mempwd').val();
	        if (mempwd.length < 5 || mempwd.length > 12) {
	            alert('비밀번호는 5자리 이상 12자리 이하로 입력해 주세요.');
	            $('#mempwd').focus();
	            return false;
	        }
	
	        const regexPassword = /^[a-z]\S{4,11}$/;
	        if (!regexPassword.test(mempwd)) {
	            alert('비밀번호의 첫 글자는 반드시 소문자이어야 합니다.');
	            $('#mempwd').focus();
	            return false;
	        }
	
	        if (!/[#$@]/.test(mempwd)) {
	            alert('비밀번호에는 특수 문자 #@$ 중에서 최소 1개가 포함되어야 합니다.');
	            $('#mempwd').focus();
	            return false;
	        }
	
	        if ($('input[name="gender"]:checked').length === 0) {
	            alert('성별은 반드시 선택이 되어야 합니다.');
	            return false;
	        }
	
	        const birth = $('#birth').val();
	        const regexBirth = /^\d{4}[-/]\d{2}[-/]\d{2}$/;
	        if (!regexBirth.test(birth)) {
	            alert('생일은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd 형식으로 입력해 주셔야 합니다.');
	            $('#birth').focus();
	            return false;
	        }
	
	        const email = $('#email').val();
	        const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; 
	        if (!regexEmail.test(email)) {
	            alert("이메일 주소를 정확하게 입력해 주세요");
	            $('#email').val("");
	            $('#email').focus();
	            return false;
	        }
	
	        const addr01 = $('#addr01').val();
	        if (addr01.length < 12) {
	            alert('주소를 입력해 주세요.');
	            $('#addr01').focus();
	            return false;
	        }
	
	        return true;
	    }
	</script>

</head>
<body>
    <div class="container">
        <h2 class="page-title">회원 가입</h2>
        <p class="sub-title">신규 회원이 가입하는 페이지입니다.</p>
        
        <form action="<%=postForm%>" method="post">
            <input type="hidden" name="opsmode" value="memInsert">
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-user me-2"></i>아이디</span>
                <input type="text" class="form-control noPreData" id="memid" name="memid" 
                	placeholder="아이디는 4~12 영문 소문자와 숫자만 사용할 수 있습니다." autocomplete="off">
                <input type="hidden" id="memidOK" value="NOTYET" />
                <button type="button" class="btn btn-outline-primary id-check-btn" onclick="checkDuplicateId();">
                    <i class="fas fa-check me-1"></i>중복확인
                </button>
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-signature me-2"></i>이름</span>
                <input type="text" class="form-control" id="memname" name="memname" autocomplete="off" 
                	value="<%=request.getAttribute("parsedName")%>" placeholder="이름을 입력해주세요" >
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-lock me-2"></i>비밀번호</span>
                <input type="password" class="form-control noPreData" id="mempwd" name="mempwd" autocomplete="off" 
                	placeholder="5~12자 사이로 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-venus-mars me-2"></i>성별</span>
                <div class="form-control radio-group">
                    <label class="radio-inline radio_gender">
                        <input type="radio" name="gender" id="gender1" value="남자" <%= "남자".equals(request.getAttribute("parsedGender")) ? "checked" : "" %>>
                        <i class="fas fa-male me-1"></i>남자
                    </label>
                    <label class="radio-inline radio_gender">
                        <input type="radio" name="gender" id="gender2" value="여자" <%= "여자".equals(request.getAttribute("parsedGender")) ? "checked" : "" %>>
                        <i class="fas fa-female me-1"></i>여자
                    </label>
                </div>
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-calendar me-2"></i>생년월일</span>
                <input type="datetime" class="form-control" id="birth" name="birth" value="<%=request.getAttribute("parsedBirth")%>">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-mobile-alt me-2"></i>휴대폰</span>
                <input type="text" class="form-control noPreData" id="mobile" name="mobile" autocomplete="off" placeholder="휴대폰 번호를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-envelope me-2"></i>이메일</span>
                <input type="email" class="form-control noPreData" id="email" name="email" autocomplete="off" 
                	placeholder="이메일 주소를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-map-marker-alt me-2"></i>주소</span>
                <input type="text" class="form-control" id="addr01" name="addr01" autocomplete="off"
                	value="<%=request.getAttribute("parsedAddr01")%>" placeholder="기본 주소를 입력해주세요">
            </div>
            
            <div class="input-group">
                <span class="input-group-text"><i class="fas fa-home me-2"></i>상세주소</span>
                <input type="text" class="form-control" id="addr02" name="addr02" autocomplete="off" 
                	value="<%=request.getAttribute("parsedAddr02")%>" placeholder="상세 주소를 입력해주세요">
            </div>

            <div id="buttonset">
                <button type="submit" class="btn btn-primary" onclick="return validCheck();">
                    <i class="fas fa-user-plus me-2"></i>가입하기
                </button>
                <button type="reset" class="btn btn-reset">
                    <i class="fas fa-redo me-2"></i>초기화
                </button>
            </div>
            
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
	<script> 
	    function alertUser(result) {
	    	
	    	let resText = "";
	    	if (result) {
	    	    resText = result.trim(); 
	    	    document.getElementById("memidOK").value = resText; 
	    	} else {
	    	    return false;
	    	}

	        // elmMemid 변수 정의
	        const elmMemid = document.getElementById('memid');
	
	        if (resText === "NOGOOD") {
	            alert("해당 아이디를 사용할 수 없습니다.");
	            elmMemid.value = "";
	            elmMemid.focus();      	
	        } else if (resText === "USEOK") { 
	            alert('해당 아이디는 사용할 수 있습니다.'); 
	            elmMemid.readOnly = true; 
	        }  
	    }
	
	    function validateMemId(){
	        const elmMemid = document.getElementById('memid');
	        if (!elmMemid.value) {
	            alert("아이디를 입력하세요.");
	            elmMemid.focus();
	            return false;
	        }
	
	        if (elmMemid.value.length < 4 || elmMemid.value.length > 12) {
	            alert('아이디는 4글자 이상 12글자 이하로 입력해 주세요.');
	            elmMemid.focus();
	            return false;
	        }
	        
	        // 아이디가 영문 소문자와 숫자만 구성되어 있는지 확인
	        const alphanumericRegex = /^[a-z0-9]+$/; 
	        if (!alphanumericRegex.test(elmMemid.value)) {
	            alert('아이디는 영문 소문자와 숫자만 사용할 수 있습니다.');
	            elmMemid.focus();
	            return false;
	        }
	
	        return true; // 유효성 검사 통과 시 true 반환
	    }
	
	    // 바닐라 Ajax 코드
	    function checkDuplicateId() {
	    	
	        const elmMemid = document.getElementById('memid'); // elmMemid 변수 정의
	        const valResult = validateMemId();
	        if (valResult === false) {
	            return false;
	        }
	
	        const xhr = new XMLHttpRequest();
	        const url = "AjaxMemidCheck"; // 중요! 요청할 Servlet URL
	        const data = "memid=" + encodeURIComponent(elmMemid.value); // URL 인코딩
	
	        xhr.open("POST", url, true);
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	
	        xhr.onreadystatechange = function () {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	                alertUser(xhr.responseText);
	            }
	        };
	        xhr.send(data);
	    }
	</script>
	
	<script>
	function checkMemIdDuplicate() {
	    const elmMemid = document.getElementById('memid'); // elmMemid 변수 정의
	    const valResult = validateMemId();
	    if (valResult === false) {
	        return false;
	    }

	    // FormData 객체 생성
	    const formData = new FormData();
	    formData.append("memid", elmMemid.value); // memid 값을 FormData에 추가

	    const url = "AjaxMemidCheck"; // 중요! 요청할 Servlet URL

	    // fetch를 사용하여 POST 요청
	    fetch(url, {
	        method: "POST",
	        body: formData // FormData를 본문으로 전송
	    })
	    .then(response => {
	        if (!response.ok) {
	            throw new Error('네트워크 응답이 좋지 않습니다.');
	        }
	        return response.text(); // 응답을 텍스트로 변환
	    })
	    .then(data => {
	        alertUser(data); // 서버 응답 처리
	    })
	    .catch(error => {
	        console.error('오류 발생:', error); // 오류 처리
	    });
	}

	</script>

    
    <script>
        $(document).ready(function() {
            setTimeout(function() {
              	$(".noPreData").val("");
            }, 1200); 
        });
    </script>
</body>
</html>