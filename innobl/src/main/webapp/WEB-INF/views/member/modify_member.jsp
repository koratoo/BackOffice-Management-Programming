<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 수정 화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="/resources/css/member/enroll.css">
 <script>
	 getMarriageTypeOptions();
	 getPayTypeOptions();
	 getEmplTypeOptions();
	 getWishPosOptions();
	 getSkillLevelOptions();
	 getGenderTypeOptions();
	 function getMarriageTypeOptions() {
		    var selectedValue = '${member.getMarriage()}';
		    $.ajax({
		        type: "GET",
		        url: "/code/codeVal",
		        data: { codeVal: "M001" },
		        dataType: "json",
		        success: function(response) {
		            var options = "<tr id='marriagetr'>";
		            options += "<th colspan='2'>*결혼유무</th>";
		            $.each(response, function(index, option) {
		                options += "<td colspan='1'>";
		                options += "<input type='radio' name='marriage' value='" + option.dtlcode + "' id='marriage_" + index + "'";

		                if (option.dtlcodenm === selectedValue) {
		                    options += " checked";
		                }

		                options += " />";
		                options += "<label for='marriage_" + index + "'>" + option.dtlcodenm + "</label>";
		                options += "</td>";
		            });
		            options += "</tr>";
		            $("#marriagetr").replaceWith(options);
		        },
		        error: function(xhr, status, error) {
		            console.log(error);
		        }
		    });
		}

	 	function getPayTypeOptions() {
		    var selectedValue = '${member.getPayType()}';

			  $.ajax({
			    type: "GET",
			    url: "/code/codeVal",
			    data: { codeVal: "M002" },
			    dataType: "json",
			    success: function(response) {
			      var options = "<tr>";
			      options += "<th colspan='2'>*급여지급유형</th>";
			      options += "<td colspan='2'>";
			      options += "<select name='payType'>";
			      $.each(response, function(index, option) {
		                options += "<option value='" + option.dtlcode + "'";
		                if (option.dtlcodenm === selectedValue) {
		                    options += " selected";
		                }
		                options += ">" + option.dtlcodenm + "</option>";
		            });
			      options += "</select>";
			      options += "</td>";
			      options += "</tr>";
			      $("#payTypetr").replaceWith(options);
			    },
			    error: function(xhr, status, error) {
			      console.log(error);
			    }
			  });
			}
	  function getEmplTypeOptions() {
		  var selectedValue = '${member.getEmplType()}';
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M003" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<td colspan='2'>*입사유형</td>";
		      options += "<td colspan='2'>";
		      options += "<select name='emplType'>";
		      $.each(response, function(index, option) {
	                options += "<option value='" + option.dtlcode + "'";
	                if (option.dtlcodenm === selectedValue) {
	                    options += " selected";
	                }
	                options += ">" + option.dtlcodenm + "</option>";
	            });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#emplTypetr").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}
	 function getWishPosOptions() {
	    var selectedValue = '${member.getWishPos()}'; 
	    $.ajax({
	        type: "GET",
	        url: "/code/codeVal",
	        data: { codeVal: "M004" },
	        dataType: "json",
	        success: function(response) {
	            var options = "<tr>";
	            options += "<td colspan='2'>*희망직무</td>";
	            options += "<td colspan='2'>";
	            options += "<select name='wishPos'>";
	            $.each(response, function(index, option) {
	                options += "<option value='" + option.dtlcode + "'";
	                if (option.dtlcodenm === selectedValue) {
	                    options += " selected";
	                }
	                options += ">" + option.dtlcodenm + "</option>";
	            });
	            options += "</select>";
	            options += "</td>";
	            options += "</tr>";
	            $("#wishTypetr").replaceWith(options);
	        },
	        error: function(xhr, status, error) {
	            console.log(error);
	        }
	    });
	}
	 
	  function getSkillLevelOptions() {
		  var selectedValue = '${member.getSkillLevel()}';
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M005" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<th colspan='2'>*기술등급</th>";
		      options += "<td colspan='2'>";
		      options += "<select name='skillLevel'>";
		      $.each(response, function(index, option) {
	                options += "<option value='" + option.dtlcode + "'";
	                if (option.dtlcodenm === selectedValue) {
	                    options += " selected";
	                }
	                options += ">" + option.dtlcodenm + "</option>";
	            });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#skillLevelRow").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}
 

      function getGenderTypeOptions() {
    	  var selectedValue = '${member.getGender()}';
      $.ajax({
          type: "GET",
          url: "/code/codeVal",
          data: { codeVal: "M006"},
          dataType: "json",
          success: function(response) {
          var options = "<tr id='gendertr'>";
          options += "<td colspan='2'>*성별유무</td>";
          $.each(response, function(index, option) {
              options += "<td colspan='1'>";
              options += "<input type='radio' name='gender' value='" + option.dtlcode + "' id='gender_" + index + "'";

              if (option.dtlcodenm === selectedValue) {
                  options += " checked";
              }

              options += " />";
              options += "<label for='gender_" + index + "'>" + option.dtlcodenm + "</label>";
              options += "</td>";
          });
          options += "</tr>";
          $("#gendertr").replaceWith(options);
          },
	            error: function(xhr, status, error) {
	            console.log(error);
          }
        });
      }
      
      function checkInputLength(e) {
    	  var koreanRegExp = /^[가-힣ㄱ-ㅎㅏ-ㅣ]*$/;
    	  var inputElement = e.target || e.srcElement;
    	  console.log('한글 유효성 작동');
    	  if (inputElement.value.length >= 10 || !koreanRegExp.test(String.fromCharCode(e.charCode))) {

    	    e.preventDefault();
    	    return false;
    	  }

    	  return true;
    	}

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
    	  var inputElement = e.target ? e.target : e.srcElement;
    	  
    	  if (inputElement.value.length >= 10 || !koreanRegExp.test(String.fromCharCode(e.charCode))) {
    	    e.preventDefault();
    	    return false;
    	  }

    	  return true;
    	}
      
      function isHanja(text) {
    	  var hanjaKoreanAndJamoRange = /^[\u4E00-\u9FFF\uAC00-\uD7A3\u3131-\u314E\u314F-\u3163]*$/;
    	  return hanjaKoreanAndJamoRange.test(text);
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

        

      function checkNumbersOnly(input) {
          const nonNumberRegex = /[^0-9]/g;
          if (input.value.match(nonNumberRegex)) {
              alert("숫자만 입력 가능합니다.");
          }
       // 입력 값의 길이를 제한하는 검사
          if (input.value.length > maxLength) {
            input.value = input.value.slice(0, maxLength);
          }

          input.value = input.value.replace(nonNumberRegex, "");
          
      }
    
 </script>
<style>
	.profile-image>img{
		padding : 30px;
		height:300px;
		width:350px;
		border:3px solid #eeeeee;
		border-radius:10%;
	}
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
	  hr{
	  	width:50%;
	  }
</style>
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
	<form action="modify_member" method="post" onsubmit="return checkHanjaBeforeSubmit();">
	<span>* 은 필수입력 사항입니다.</span>
	    <input type="hidden" name="mno" value="${member.getMno()}">
		<hr/>
		<div class="top">
			<div class="profile-image">
				<img src="/resources/${member.getProfileImg().substring(member.getProfileImg().indexOf("resources") + 9)}" alt="프로필 이미지">
			
			</div>
			<table>
				<tr>
					<th>*한글이름</th>
					<td> 
						<input type="text" name="name" maxlength="11" onkeypress="return checkInputLength(event)"  value="${member.getName()}"  autocomplete = off required/>
    					<span id="nameError" style="color: red; display: none;">10글자를 초과할 수 없습니다.</span>
    				</td>
				</tr>
				<tr>
					<td>영문이름</td>
					<td><input type="text" name="engName" value="${member.getEngName()}" maxlength="11" oninput="checkEnglish(this)"  autocomplete = off/>
					<span id="errorMsgNotEng" style=" display: none;">영문자와 공백만 입력 가능합니다.</span>
		            <span id="errorMsgSpecialChar" style=" display: none;">특수문자는 입력할 수 없습니다.</span>
					
					</td>
				</tr>
				<tr>
					<th>한자이름</th>
					<td>
						<input type="text" name="chnName" oninput="validateHanja(this)" maxlength="11" value="${member.getChnName()}" oninput="validateHanja(this)"  autocomplete = off/>
    					<span id="hanjaAlert" style=" display: none;">한자 이름을 입력해주세요.</span>
    					 <span id="specialCharAlert" style=" display: none;">특수문자는 입력할 수 없습니다.</span>
				
					</td>
				</tr>
				<tr>
					<td>*주민등록번호</td>
					<td> 
						<input type="text" id="juminNo1" maxlength="6" oninput ="checkNumbersOnly(this)"  value="${fn:substring(member.getJuminNo(), 0, 6)}" autocomplete = off required/>-
					   <input type="text" id="juminNo2" maxlength="7" oninput ="checkNumbersOnly(this)" value="${fn:substring(member.getJuminNo(), 7, 14)}" autocomplete = off required/>
					   <input type="hidden" id="hiddenJuminNo"  value="${member.getJuminNo()}" name="juminNo" required/>
				  </td>
				</tr>
			</table>
		</div><!-- top end -->
		<hr/>
		<div class="main-bottom">
			<table>
				<tr>
					<th colspan="2">*생년월일</th>
					<td colspan="2">
					  <input type="number" id="year" placeholder="년도"   value="${fn:substring(member.getBirthday(), 0, 4)}" autocomplete = off min="1950" max="2002" maxlength="4" />
					  <input type="number" id="month" placeholder="월"  value="${fn:substring(member.getBirthday(), 5, 7)}" autocomplete = off min="1" max="12" maxlength="2" />
					  <input type="number" id="day" placeholder="일" value="${fn:substring(member.getBirthday(), 8, 10)}" autocomplete = off min="1" max="31" maxlength="2" />
					  <input type="hidden" id="hiddenBirthday" value="${member.getBirthday()}" name="birthday" /><br>
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
					<td colspan="2"><input type="number" name="emplYear" value="${member.getEmplYear()}" min="1" max="100" required></td>
				</tr>
				<tr id="payTypetr">	
					<th colspan="2">*급여 지급 유형</th>
					<td colspan="2">
					<select name="payType">
						<option value="일급">일급</option>
						<option value="월급" selected>월급</option>
					</select></td>
				</tr>
				<tr id="wishTypetr">
					<td colspan="2">*희망 직무</td>
					<td colspan="2">
						 <input type="text" name="wishPos" required/>
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
                     <td colspan="2"><input type="text" id="address_kakao" name="addr" readonly value="${member.getAddr()}"/></td>
                </tr>
                <tr>
                    <td colspan="2">상세 주소</td>
                    <td colspan="2"><input type="text" name="addrdtl" value="${member.getAddrdtl()}" />
                </tr>
            	<tr>
					<th colspan="2">*연락처</th>
					<td colspan="2"><input type="text" name="phone" value="${member.getPhone()}" maxlength ="13" required/></td>
				</tr>
				<tr>
					<td colspan="2">*이메일</td>
					<td colspan="2"><input type="email" name="email" value="${member.getEmail()}" required/></td>
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
				  <td colspan="2">
				    <input type="text" name="joinDate" onchange="validateDates()" 
				      value="${member.getJoinDate()}" maxlength="8" required/>
				  </td>
				</tr>
				<tr>
				  <th colspan="2">*계약만료일</th>
				  <td colspan="2"><input type="text" name="exitDate" onchange="validateDates()" value="${member.getExitDate() }" maxlength="8" required>
					<span id="dateAlert" style="color: red; display: none;">입사일이 계약 만료일 보다 더 늦을 수 없습니다.</span>
				  </td>
				</tr>
				<tr>
					<td colspan="2">주량</td>
					<td colspan="2"><input type="text" name="alchol" maxlength="4" value="${member.getAlchol()}"/></td>
				</tr>
				<tr>
					<td colspan="4"><button>수정하기</button></td>
				</tr>
			</table>
		</div>
		</form>
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
                    console.log(data.address);
                    document.querySelector("input[name=addrdtl]").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }
</script>
</body>

</html>