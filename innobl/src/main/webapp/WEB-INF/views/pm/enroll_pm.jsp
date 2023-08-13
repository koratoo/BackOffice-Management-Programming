<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록화면</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/resources/css/member/enroll.css">
<style>
    
    table{width:100%; background-color:white;}
    table,tr,td,th{
        border:1px solid black;
    }
    th{
    	background-color:rgb(70, 130, 180);
    	color:white;
    }
    select{
        width:100%;
        height:40px;
        font-size: 30px;
    }
    button{
        font-size:30px;
        background-color: rgb(70, 130, 180);
        color: white;
    }
    button:hover{
        cursor:pointer;
        background-color: rgb(50, 110, 160);
    }
    ul{
        font-size:30px;
        list-style:none;
    }
    li{
        padding:5px;
    }
    
    textarea{
    	width: 100%;
    	height: 500px;
    	font-size:30px;
    }
    .error {
        color: red;
        font-size: 14px;
        font-style: italic;
        /* 기타 에러 메시지 스타일 지정 */
    }
</style>
<script>
$(document).ready(function () {
	checkNumbersOnly(input)
    const errorMessage = '${error}';
    
    if (errorMessage === 'duplicate') {
        alert('이미 등록된 인원입니다^^');
    }
});
getRoleTypeOptions();
function validateDates() {
    var startDate = document.getElementById("start-date").value;
    var endDate = document.getElementById("end-date").value;

    if (endDate < startDate) {
      alert("종료일은 시작일일보다 이른 날짜일 수 없습니다.");
      return false;
    }

    return true;
  }
  
function getRoleTypeOptions() {
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: 'PM001' },
	    dataType: "json",
	    success: function(response) {
	      var options = "<tr>";
	      options += "<th>프로젝트직책코드</th>";
	      options += "<td>";
	      options += "<select name='prjmng_role'>";
	      $.each(response, function(index, option) {
	        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
	      });
	      options += "</select>";
	      options += "</td>";
	      options += "</tr>";
	      $("#projectRoletr").replaceWith(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}


function openSearchWindow() {
    window.open("/member/w_member_search", "searchWindow",800,500);
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
    <div class="main">
        <form action="/pm/enroll_project" id="project-form" method="post">
            <h1>신규인원등록</h1>
            <hr/>
            <input type="hidden" name="prjno" value="${project.PRJNO}" />
            <div class="table">
                <table>
                  <tr>
                   		<th>프로젝트명</th>
                  		<td><input type="text" value="${project.PRJNAME}" readonly/></td>
                  </tr>
                  
                   <tr>
					    <th>회원명</th>
					    <td onclick="openSearchWindow()">
					        <input type="text" id="memberName" value="" readonly />
    						<input type="hidden" name="mno" id="mno" value="" />
					    </td>
					</tr>
                    <tr>
                        <th>프로젝트 투입일</th>
                        <td>
                          <input type="text" name="prjmng_st" oninput="checkNumbersOnly(this)" maxlength="8" id="start-date"  autocomplete="off" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 철수일</th>
                        <td>
                          <input type="text" name="prjmng_end" oninput="checkNumbersOnly(this)" maxlength="8" id="end-date" autocomplete="off"  required/>
                        </td>
                    </tr>
                    <tr id="projectRoletr">
                        <th>프로젝트 직책코드</th>
                        <td>
                          <input type="text" name="prjmng_role" />
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="2">
                            <button type="submit" id="submitBtn">등록하기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br>    
        
    </div><!-- main end -->
</div>

<script type="text/javascript" src="/resources/js/date_check_function.js"></script> 		

</body>
<script>
				$(document).ready(function() {
				     const today = new Date();
				     const shortYear = String(today.getFullYear()); // 연도의 마지막 두 자리만 필요합니다
				     const mm = String(today.getMonth() + 1).padStart(2, '0');
				     const dd = String(today.getDate()).padStart(2, '0');
				     const currentDate = shortYear+ mm + dd;
				     if('${from}' == null || '${from}' == ''){
				         
				     $("#end-date").attr("value", currentDate);
				     $("#start-date").attr("value", currentDate);
				     }
				     
				     $("#submitBtn").click(function(event) {
				    	    event.preventDefault();
				    	    
				    	    if (validateDates() && validateLength()) {
				    	      var formData = $("#project-form").serialize();
				    	  
				    	      $.ajax({
				    	        type: "POST",
				    	        url: $("#project-form").attr("action"),
				    	        data: formData,
				    	        success: function() {
				    	        	window.opener.postMessage("refresh", location.protocol + "//" + location.host);
				    	          window.close();
				    	        },
				    		    error: function(xhr, status, error) {
				    		    	 alert("중복인원이 존재합니다.");
				    			    }
				    	      });
				    	    } 
				    	  });/* submitBtn end */
				    	});/* ready end */
				
				function validateDates() {
				    var startDate = document.getElementById("start-date").value;
				    var endDate = document.getElementById("end-date").value;
				    if (endDate < startDate) {
				      alert("시작일이 종료일보다 이른 날짜일 수 없습니다. \n시작일 : "+startDate+" ~ 종료일 : "+endDate);
				      return false;
				    }
				    
				    return true;
				  }
				
				 
				   function validateLength() {
					    var startDate = document.getElementById("start-date").value;
					    var endDate = document.getElementById("end-date").value;

					    if (startDate.length < 8 || endDate.length < 8) {
					        alert("YYYYMMDD 의 형태로 입력해 주세요.(ex 20230723)");
					        return false;
					    }
					    return true;
					}
				
				</script>		
</html>
