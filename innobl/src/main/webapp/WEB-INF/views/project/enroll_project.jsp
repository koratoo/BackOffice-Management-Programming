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
    table{width:100%;}
    table,tr,td,th{
        border:1px solid black;
        
    }
    select{
        width:100%;
        height:40px;
        font-size: 30px;
    }
    button{
        font-size:30px;
    }
    button:hover{
        cursor:pointer;
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
</style>

<script>
getStatusTypeOptions();
getVendorOptions();
  
function getStatusTypeOptions() {
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "P001" },
	    dataType: "json",
	    success: function(response) {
	      var options = "<tr>";
	      options += "<th colspan='1'>*프로젝트 상태</th>";
	      options += "<td colspan='1'>";
	      options += "<select name='PRJSTATUS'>";
	      $.each(response, function(index, option) {
	        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
	      });
	      options += "</select>";
	      options += "</td>";
	      options += "</tr>";
	      $("#projectStatustr").replaceWith(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
	

function getVendorOptions() {
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "V001" },
	    dataType: "json",
	    success: function(response) {
	      var options = "<tr>";
	      options += "<th colspan='1'>*거래처 정보</th>";
	      options += "<td colspan='1'>";
	      options += "<select name='VNAME'>";
	      $.each(response, function(index, option) {
	        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
	      });
	      options += "</select>";
	      options += "</td>";
	      options += "</tr>";
	      $("#vendortr").replaceWith(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
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
        <form action="/project/enroll_project" id="project-form" method="post"  >
            <h1>프로젝트 등록 화면</h1>
            <hr/>
            <div class="table">
                <table>
                    <tr>
                        <th>프로젝트 이름</th>
                        <td>
                       		<input type="text" name ="PRJNAME" maxlength="50" required/>
                        </td>
                    </tr>
                    <tr id="projectStatustr">
                        <th>프로젝트상태</th>
                       	
                    </tr>
                    <tr id="vendortr">
                    	<th>거래처 정보</th>
                    </tr>
                    <tr>
                        <th>프로젝트 시작일</th>
                        <td>
                        
                          <input type="text" name="PRJST" id="start-date" maxlength="8" oninput ="checkNumbersOnly(this)" autocomplete="off" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 종료일</th>
                        <td>
                          <input type="text" name="PRJEND" id="end-date" maxlength="8" oninput ="checkNumbersOnly(this)" autocomplete="off" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 상세설명</th>
                        <td>
                          <textarea name="PRJDESC" ></textarea>
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
				     
				     $("#project-form").on("submit", function(event) {
				         if (!validateDates()||!validateLength()) {
				             event.preventDefault();
				         }
				     });
				   });
				
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
