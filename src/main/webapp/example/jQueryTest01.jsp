<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" 
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	</script>
	<script type="text/javascript">
		/* ready 함수는 이 문서의 모든 내용을 로딩한 다음 마지막에 호출이 됩니다. */
		$(document).ready(function(){
			console.log('하하하'); /* 브라우저의 콘솔 창에 출력하는 구문입니다. */
			
			/* 자바 스크립트는 변수 선언시 var 키워드를 사용합니다. */
			var a = 10 ;
			var b = 5 ;
			var c = a + b ;
			var result = a + ' + ' + b + ' = ' + c ;
			console.log(result);
			
			var label_count = $('label').length ;
			console.log('라벨의 개수 : ' + label_count);			
			
			$('#label_cnt').html('<b>' + label_count + '</b>');
			console.log($('#label_cnt').html());
			
			$('label').addClass('label_style');
			
			$('#age').removeClass('label_style');
			
			/* 메소드 체이닝 */
			$('#hobby').css('color', 'blue').css('background-color', 'red');
			$('#hobby').css('color', ''); /* 디폴트 설정으로 돌아감 */
			
			var label_string = '' ;
			
			$('label').each(function(){
				label_string += $(this).text().replace(' :', '') + ' ' ;
			});
			
			$('#label_text').html(label_string);
			
			$('#check01').click(function(){
				var checklist = $(':checkbox');
				console.log('type=checkbox인 항목 개수 : ' + checklist.length);
				
				var result = '' ;
				for(var i=0 ; i < checklist.length ; i++){
					if(checklist[i].checked){
						result += checklist[i].value + ' ';
					}
				}
				
				$('#check_result_01').html(result);
			});
			
			$('#check02').click(function(){
				var checklist = $('input[type="checkbox"]:checked');
				
				var result = '' ;
				
				for(var i=0 ; i < checklist.length ; i++){
					result += checklist[i].value + ' ';					
				}
				
				$('#check_result_02').html(result);
				
			});

			$('#radio01').click(function(){
				var radiolist = $(':radio'); /* type 속성이 radio인 항목들 */
				console.log('type=radio인 항목 개수 : ' + radiolist.length);
				
				var result = '' ;
				for(var i=0 ; i < radiolist.length ; i++){
					if(radiolist[i].checked){
						result += radiolist[i].value + ' ';
					}
				}
				
				$('#radio_result_01').html(result);
			});

			$('#radio02').click(function(){
				var radiolist = $('input[type="radio"]:checked');
				console.log('type=radio인 항목 개수 : ' + radiolist.length);
				
				var result = '' ;
				for(var i=0 ; i < radiolist.length ; i++){ 
					result += radiolist[i].value + ' ';
				}
				
				$('#radio_result_02').html(result);				
			});

		});
	</script>
	<style type="text/css">
		.label_style{background-color: yellow; font-size: 30px;}
	</style>
</head>
<body>
	<!-- 여기는 html 주석입니다. -->
	<!-- h1~h6 태그는 글 제목을 작성할 때 사용하는 태그입니다. -->
	<h1>폼 양식</h1>
	<!-- action 속성에 명시된 페이지로 폼 양식을 제출합니다. -->
	<form action="htmlTest01To.jsp">
		<label>이름 :</label>
		<input type="text" name="name">
		<br/><!-- br 태그는 엔터키 효과 -->
		<label id="age">나이 :</label>
		<input type="text" name="age">
		<br/>
		<label>이미지 :</label>
		<input type="file" name="image"> 
		<br/> 
		<label>숨김 파라미터 :</label>
		<input type="hidden" name="money" value="120000"> 
		<br/>	
		<label>성별 :</label>
		<!-- 라디오 버튼의 name 속성은 그룹을 묶어 주는 역할을 합니다. -->
		<input type="radio" name="gender" value="1" checked="checked">남자 
		<input type="radio" name="gender" value="2">여자
		<br/>
		<label id="hobby">취미 :</label>
		<input type="checkbox" name="hobby" value="당구">당구 
		<input type="checkbox" name="hobby" value="축구" checked="checked">축구
		<input type="checkbox" name="hobby" value="야구" checked="checked">야구
		<input type="checkbox" name="hobby" value="농구">농구		
		<br/>
		<label>직업 :</label>
		<select name="job"> 
			<option value="-">-- 선택해 주세요
			<option value="의사">의사 
			<option value="판사" selected="selected">판사
			<option value="변호사">변호사
			<option value="검사">검사
		</select>
		<br/>
		<label>코멘트 :</label>
		<textarea name="comment" rows="10" cols="50"></textarea>
		<br/><br/><br/> 
		<input type="submit" value="전송">
		<!-- entity : 특수 문자나 whiteCharacter 등을 표현하기 위한 문법 -->
		<!-- &로 시작하고 ;으로 끝이 납니다. -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<br/>
		1 &euro;는 약 1,400원입니다.
		
		
		<input type="reset" value="초기화">
	</form>
	<hr/>
	<!-- span은 작은 영역을 의미하는데, 주로 형광펜으로 표시할 때 많이 사용합니다. -->
	라벨 개수 : <span id="label_cnt"></span>
	<br/>
	라벨 문구 : <span id="label_text"></span>
	<br/><br/><br/>
	
	<button id="check01">체크 요소 확인 01</button><br/>
	<button id="check02">체크 요소 확인 02</button><br/>
	<button id="radio01">라디오 요소 확인 01</button><br/>
	<button id="radio02">라디오 요소 확인 02</button><br/>
	<br/>
	체크 결과 01 : <span id="check_result_01"></span><br/>
	체크 결과 02 : <span id="check_result_02"></span><br/>
	라디오 결과 01 : <span id="radio_result_01"></span><br/>
	라디오 결과 02 : <span id="radio_result_02"></span><br/>
</body>
</html>








