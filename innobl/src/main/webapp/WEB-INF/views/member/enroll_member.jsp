<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 등록 화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

 <link rel="stylesheet" type="text/css" href="/resources/css/member/enroll.css">
<script type="text/javascript" src="/resources/js/enroll_member.js"></script> 
<style>
	.profile-image>input{
		font-size:20px;
	}
	button{
    	font-size:30px;
    }
    button:hover{
    	cursor:pointer;
    }
    tr, td{
    	border:1px solid #eeeeee;
    }
    th{
    	width:30%;
    	background-color:#eeeeee;
    }
	span{
		color:red;
		font-size:20px;
	} 
	
	  #juminNo1,
	  #juminNo2 {
	    width: 47%;
	    margin:0px;
	    padding :0px;
	  }
	  
	 #year {
	    width: 45%;
	  }
	
	 #month,#day {
	    width: 25%;
	  }
	
</style>
<script>

function checkEnglish(input) {
    const specialCharRegex = /[\!\@\#\$\%\^\&\*\(\)\_\+\-\=\[\]\{\}\;\:\"\'\\\|<>\,\.\?\/]/; // 특수문자 정규식
    const notEngCharRegex = /[^a-zA-Z\!\@\#\$\%\^\&\*\(\)\_\+\-\=\[\]\{\}\;\:\"\'\\\|<>\,\.\?\/\s]/; // 영문자, 공백 및 특수문자를 제외한 문자의 정규식

    if (input.value.match(specialCharRegex)) {
        input.value = input.value.replace(specialCharRegex, ''); // 특수문자 제거
        document.getElementById("errorMsgSpecialChar").style.display = "inline";
        document.getElementById("errorMsgNotEng").style.display = "none";
    } else if (input.value.match(notEngCharRegex)) {
        input.value = input.value.replace(notEngCharRegex, ''); // 영문자, 공백 및 특수문자를 제외한 문자 제거
        document.getElementById("errorMsgSpecialChar").style.display = "none";
        document.getElementById("errorMsgNotEng").style.display = "inline";
    } else {
        document.getElementById("errorMsgNotEng").style.display = "none";
        document.getElementById("errorMsgSpecialChar").style.display = "none";
    }
}

function checkInputLength(e) {
	  var koreanRegExp = /^[가-힣ㄱ-ㅎㅏ-ㅣ]*$/;
	  var inputElement = e.target || e.srcElement;
	  
	  if (inputElement.value.length >= 10 || !koreanRegExp.test(String.fromCharCode(e.charCode))) {

	    e.preventDefault();
	    return false;
	  }

	  return true;
	}
  
  function validateHanja(inputElement) {
    var hanjaAlert = document.getElementById("hanjaAlert");
    var specialCharAlert = document.getElementById("specialCharAlert");
    var value = inputElement.value;

    const specialCharRegex = /[\!\@\#\$\%\^\&\*\(\)\_\+\-\=\[\]\{\}\;\:\"\'\\\|<>\,\.\?\/]/;

    if (value.match(specialCharRegex)) {
        specialCharAlert.style.display = "inline";
        inputElement.value = value.replace(specialCharRegex, ''); // 특수 문자 제거

    } else {
        specialCharAlert.style.display = "none";
    }

    if (!isHanja(value)) {
        hanjaAlert.style.display = "inline";
        inputElement.value = value.replace(/[\u0000-\u4DFF\uA000-\uFFFF]/g, ''); 

    } else {
        hanjaAlert.style.display = "none";
    }
}

function isHanja(text) {
    var hanjaAndKoreanRange = /^[\u4E00-\u9FFF\uAC00-\uD7A3]*$/;

    return hanjaRange.test(text);
}

function checkNumbersOnly(input) {
    const nonNumberRegex = /[^0-9]/g;
    if (input.value.match(nonNumberRegex)) {
        alert("숫자만 입력 가능합니다.");
    }

    input.value = input.value.replace(nonNumberRegex, "");
}
</script>
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
	<form action="enroll_member" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
		<span>* 은 필수입력 사항입니다.</span>
		<div class="top">
			<div class="profile-image">
			  <img id="previewImage" src="/resources/img/person-icon.png" alt="Preview">
			  <input type="file" id="uploadFile" name="uploadFile" multiple required>
			</div>
			<script>
			  document.getElementById("uploadFile").addEventListener("change", function () {
			    var file = this.files[0];
			    var reader = new FileReader();
			
			    reader.onload = function (e) {
			      // 파일을 읽어서 미리보기 이미지에 설정합니다.
			      var previewImage = document.getElementById("previewImage");
			      previewImage.src = e.target.result;
			    };
			
			    // 선택한 파일을 읽습니다.
			    reader.readAsDataURL(file);
			  });
			  
			
			</script>
			<table>
				<tr>
					<th>*한글이름</th>
					<td> 
						<input type="text" name="name" maxlength="11" onkeypress="return checkInputLength(event)" autocomplete = off required/>
    					<span id="nameError" style=" display: none;">한글만 입력 가능합니다.(최대 10글자)</span>
    				</td>
				</tr>
				<tr>
					<td>영문이름</td>
					<td><input type="text" maxlength="30" name="engName" oninput="checkEnglish(this)" autocomplete = off/>
		            <span id="errorMsgNotEng" style=" display: none;">영문자와 공백만 입력 가능합니다.</span>
		            <span id="errorMsgSpecialChar" style=" display: none;">특수문자는 입력할 수 없습니다.</span>
					</td>
				</tr>
				<tr>
					<th>한자이름</th>
					<td>
						<input type="text" name="chnName" maxlength="11" oninput="validateHanja(this)" autocomplete = off/>
    					<span id="hanjaAlert" style=" display: none;">한자 이름을 입력해주세요.</span>
    					 <span id="specialCharAlert" style=" display: none;">특수문자는 입력할 수 없습니다.</span>
					</td>
				</tr>
				<tr>
				  <td>*주민등록번호</td>
				  <td> <input type="text" id="juminNo1" maxlength="6" oninput ="checkNumbersOnly(this)" required/>-
				
				   <input type="text" id="juminNo2" maxlength="7" oninput ="checkNumbersOnly(this)" required/>
				   <input type="hidden" id="hiddenJuminNo" name="juminNo" required/>
				  </td>
				</tr>
			</table>
		</div><!-- top end -->
		<div class="main-bottom">
			<table>
				<tr>
				  <th colspan="2">*생년월일</th>
				  <td colspan="2">
					  <input type="text" id="year" oninput ="checkNumbersOnly(this)" placeholder="년도" maxlength="4" />
					  <input type="text" id="month" oninput ="checkNumbersOnly(this)" placeholder="월" maxlength="2" />
					  <input type="text" id="day" oninput ="checkNumbersOnly(this)" placeholder="일" maxlength="2" />
					  <input type="hidden" id="hiddenBirthday" name="birthday" /><br>
				  </td>
				</tr>
				<tr id="gendertr">
					<td colspan="2">*성별</td>
					<td colspan="1">
					    <input type="radio" name="gender" value="남자" checked/>
					    남자
					  </td>
					  <td colspan="1">
					    <input type="radio" name="gender" value="여자"/>
					    여자
					</td>
				</tr>
				<tr id="marriagetr">
					<th colspan="2">*결혼유무</th>
					
				</tr>
				<tr>
					<td colspan="2">*년차</td>
					<td colspan="2"><input type="number" name="emplYear" required></td>
				</tr>
				<tr id="payTypetr">	
					<th colspan="2">*급여 지급 유형</th>
					<td colspan="2">
					<select name="payType" >
						<option value="일급">일급</option>
						<option value="월급" selected>월급</option>
					</select></td>
				</tr>
				<tr id="wishTypetr">
					<td colspan="2">*희망 직무</td>
					<td colspan="2">
						 <input type="text" name="wishPos" />
					</td>
				</tr>
				<tr id="emplTypetr">
					<th colspan="2">*입사유형</th>
					<td colspan="2">
						<select name="emplType">
							<option value="정규직">정규직</option>
							<option value="계약직">계약직</option>
						</select>
					</td>
				</tr>
				<tr>
                    <th colspan="2">주소</th>
                     <td colspan="2"><input type="text" id="address_kakao" name="addr" readonly required/></td>
                </tr>
                <tr>
                    <td colspan="2">상세 주소</td>
                    <td colspan="2"><input type="text" name="addrdtl" />
                </tr>
				<tr>
					<th colspan="2">*연락처</th>
					<td colspan="2"><input type="text" placeholder="010-1234-1234" name="phone" maxlength="12" required/></td>
				</tr>
				<tr>
					<td colspan="2">*이메일</td>
					<td colspan="2"><input type="email" placeholder="test@email.com" name="email" /></td>
				</tr>
				<tr id="skillLevelRow">
					<th colspan="2">*기술등급</th>
					<td colspan="2">
						<select name="skillLevel">
							<option value="초급">초급</option>
							<option value="중급">중급</option>
							<option value="고급">고급</option>
							<option value="특급">특급</option>
						</select>
					</td>
				</tr>
				<tr>
				  <td colspan="2">*입사일</td>
				  <td colspan="2"><input type="text" name="joinDate" placeholder="20230711" maxlength="8" onchange="validateDates()"  required/></td>
				</tr>
				<tr>
				  <th colspan="2">*계약만료일</th>
				  <td colspan="2"><input type="text" name="exitDate" placeholder="20230711" maxlength="8" onchange="validateDates()" required>
					<span id="dateAlert" style="color: red; display: none;">입사일이 계약 만료일 보다 더 늦을 수 없습니다.</span>
				  </td>
				</tr>
				<tr>
					<td colspan="2">주량</td>
					<td colspan="2"><input type="text" placeholder="n병" maxlength="4" name="alchol"/></td>
				</tr>
				<tr>
					<td colspan="4"><button>등록하기</button></td>
				</tr>
			</table>
		</div>
	</form>
	
<script>
  const serverValidResult = {};
  <c:forEach items="${errors}" var="error">
    serverValidResult['${error.field}'] = '${error.defaultMessage}';
  </c:forEach>
  console.log(serverValidResult);
</script>
	</div>
</div>
<script>
var yearInput = document.getElementById("year");
var monthInput = document.getElementById("month");
var dayInput = document.getElementById("day");
var hiddenBirthday = document.getElementById("hiddenBirthday");

function updateBirthday() {
  var year = yearInput.value;
  var month = monthInput.value;
  var day = dayInput.value;
  hiddenBirthday.value = year + "-" + month + "-" + day;
}
yearInput.addEventListener("input", updateBirthday);
monthInput.addEventListener("input", updateBirthday);
dayInput.addEventListener("input", updateBirthday);


document.getElementById("juminNo1").addEventListener("input", function () {
    var juminNo1 = this.value;
    var juminNo2 = document.getElementById("juminNo2").value;
    var hiddenJuminNo = document.getElementById("hiddenJuminNo");

    // 주민등록번호를 합쳐서 hidden input에 저장합니다.
    hiddenJuminNo.value = juminNo1 + juminNo2;
  });
document.getElementById("juminNo2").addEventListener("input", function () {
    var juminNo1 = document.getElementById("juminNo1").value;
    var juminNo2 = this.value;
    var hiddenJuminNo = document.getElementById("hiddenJuminNo");

    // 주민등록번호를 합쳐서 hidden input에 저장합니다.
    hiddenJuminNo.value = juminNo1 +"-"+ juminNo2;
  });
  

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function(data) { //선택시 입력값 세팅
                    document.querySelector("input[name=addr]").value = data.address; // 입력한 주소를 name이 addr인 input 태그에 넣기
                    document.querySelector("input[name=addrdtl]").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }
    
    

   
</script>

</body>
</html>