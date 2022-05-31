<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	//API 같은경우 코드 하나하나에 집중 X, 그냥 가져다가 쓰면 됨. 
	function zipcodeFind(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data);
	            //<form>태그의 DOM 객체를 얻어온다. 
	            var f = document.registFrm;
	            //id값으로 접근하면 더 코드가 복잡해짐
	            //document.getElemenById("aaa");
	            f.zipcode.value = data.zonecode;
	            f.address1.value = data.address;
	            f.address2.focus();
	            
	            f.sido.value = data.sido;
	            f.sigungu.value = data.sigungu;
	        }
	    }).open();
	}	
	</script>
	<h2>회원가입폼</h2>
	<!-- form 테그에는 name태그를 사용하면 되기에 id 속성은 잘 사용하지 않음. -->
	<form name="registFrm" id="aaa" method="전송방식(디폴트get방식)" action="전송할URL" onsubmit="이벤트리스너">
		우편번호: <input type="text" name="zipcode" onclick="zipcodeFind()" />
		<input type="button"  value="우편번호검색" onclick="zipcodeFind()"/>
		<br />
		주소 1: <input type="text" name="address1" />
		<br />
		주소 2: <input type="text" name="address2"/>
		<br />
		<!-- 회원 로그분석에 필요한 데이터들 -->
		<input type="hidden" name="sido"/>
		<input type="hidden" name="sigungu"/>
		
		<hr />
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	  <!-- 
	  링크 작동 안됨. 속도가 무지하게 느려짐.
	  <link rel="stylesheet" href="/resources/demos/style.css"> -->
	  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	  
	  <script>
	  $( function() {
	    $( "#birth" ).datepicker({
	    	"dateFormat": "yy-mm-dd"
	    });
	    
	    
	    $( "input[type=radio]" ).checkboxradio({
	    	icon:false
	    });
	  } );
	  </script>
		생년월일: <input type="text" name="birth" id="birth" />
		
		<hr />
		
		성별 : 
			<label for="gen1"></label>
			<input type="radio" name="gender" id="gen1" value="남" /> 남
			<label for="gen2"></label>
			<input type="radio" name="gender" id="gen2" value="여" /> 여
			<label for="gen3"></label>
			<input type="radio" name="gender" id="gen3" value="트" /> 트랜스젠더
		
		<!--  
		https://api.jqueryui.com/
		이 사이트에서 UI 가져다 쓰기
		-->
	</form>
</body>
</html>
























