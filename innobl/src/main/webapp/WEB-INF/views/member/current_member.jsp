<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">
 <link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">
 
<script>
  $(document).ready(function(){
	  getGenderTypeOptions();
		getSkillTypeOptions();
		getRoleTypeOptions();
		getMenuNameByMenuno();
    var actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function(e) {
      e.preventDefault();
      console.log('click');
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      
      actionForm.submit();
    });

  function getSkillTypeOptions() {
	  var selectedValue = '${skillLevel}';
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "M005" },
	    dataType: "json",
	    success: function(response) {
	      var options = "<button disabled>기술등급</button>";
	      options += "<select name='skillLevel' id='search_member'>";
	      options += "<option value='0' selected >선택없음</option>"; // 기본 옵션 추가

	      $.each(response, function(index, option) {
              options += "<option value='" + option.dtlcode + "'";
              if (option.dtlcode === selectedValue) {
                  options += " selected";
              }
              options += ">" + option.dtlcodenm + "</option>";
          });
	      options += "</select>";
	      $(".skillSelect").html(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
  
  function getGenderTypeOptions() {
	  var selectedValue = '${gender}';
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "M006" },
	    dataType: "json",
	    success: function(response) {
	      var options = "<button disabled>성별</button>";
	      options += "<select name='gender' id='search_member'>";
	      options += "<option  value='0'  selected >선택없음</option>"; // 기본 옵션 추가
	      $.each(response, function(index, option) {
              options += "<option value='" + option.dtlcode + "'";
              if (option.dtlcode === selectedValue) {
                  options += " selected";
              }
              options += ">" + option.dtlcodenm + "</option>";
          });
	      options += "</select>";
	      $(".genderSelect").html(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
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
  
  function getSelectedItems() {
	  // 체크박스를 선택하여 선택한 항목 수집
	  let selectedItems = [];
	  $("input[type='checkbox']:checked").each(function () {
	    selectedItems.push($(this).attr("name"));
	  });

	  return selectedItems;
	}
  	  
 
  function checkNumbersOnly(input) {
	    const nonNumberRegex = /[^0-9]/g;
	    if (input.value.match(nonNumberRegex)) {
	        alert("숫자만 입력 가능합니다.");
	    }

	    input.value = input.value.replace(nonNumberRegex, "");
	    
	}
	
	$("#assign-selected").click(function (event) {
		 let selectedItems = getSelectedItems();

		  // 선택된 항목이 없는 경우 경고창 표시
		  if (selectedItems.length === 0) {
		    alert("선택된 인원이 없습니다.");
		    return false;
		  }
	  // 선택한 항목 ID를 URL에 전달합니다.
	  let url = "/member/w_enroll_member?selectedItems=" + selectedItems.join(',');
	  
	  // 새 창을 엽니다.
	  window.open(url, "_blank", "width=1000, height=800, top=0, left=250");
	  });

	   $("#start-date, #end-date").on("input", function () {
		    let inputValue = $(this).val();
		    let noKoreanValue = inputValue.replace(/[가-힣ㄱ-ㅎㅏ-ㅣ]/g, "");
		    $(this).val(noKoreanValue);
		  });
	   
	   
	   $("#resetSearch").on("click", function() {
		   location.href="/member/current_member";
		 });
	  
	  
	   function getMenuNameByMenuno() {
		   var menuno = 1;
		    $.ajax({
		      type: "GET",
		      url: "/getMenuName",
		      data: { menuno: menuno },
		      dataType: "text",
		      success: function(data) {
		    	  // 새로운 H1 태그를 생성하고 가져온 메뉴 이름을 텍스트로 설정
		          const newH1 = $('<h1>').text(data);

		          // 기존의 H1 태그를 새로 만든 태그로 교체
		          $("#menu-title").replaceWith(newH1);
		      },
		      error: function(xhr, status, error) {
		        console.log("Error: " + error);
		      }
		    });
		  } 
	   
  });/* ready function end */
  
  
</script>
 <style>
 	.search{display:relative;}
 	#search_member{width:100px;border:1px solid #eeeeee;}
 	#start-date,#end-date{height:30px;width:100px;border:1px solid #eeeeee;}
 	.multi-function {
	  margin-top: 70px;
	  width: 100%;
	  height: 100px;
	  border: 10px solid rgb(70, 130, 180);
	  border-radius: 5px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	}
	.pagination{
		justify-content: center;
	}
	
 </style>
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
		<div class="greeting-container">
		<h1 id="menu-title"></h1>
	         <%@ include file="../common/greeting.jsp" %>
	    </div>
		<hr/>
		<c:if test="${authno == 1}">
		    <a href="/member/enroll_member">신규사원등록</a>
		</c:if>
		<div class="search">
			<form id='searchForm' action="current_member" method="post">
			  <button disabled>입사일</button>
				  <input type="text" id="start-date" name="from" maxlength="8" value="${from}"  autocomplete="off" required>
				  <span>  ~  </span>
				  <input type="text" id="end-date" name="to" maxlength="8" value="${to}"  autocomplete="off" required>
				<script type="text/javascript" src="/resources/js/date_check_function.js"></script> 		
			
				<button disabled>기술등급</button>
				<select class="skillSelect" name="skillLevel" id="search_member">
					<option value="초급">초급</option>
					<option value="중급">중급</option>
					<option value="고급">고급</option>
					<option value="특급">특급</option>
				</select>
				
			
				<button disabled>성별</button>
				<select class="genderSelect" name="gender" id="search_member">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			
				<button disabled>이름</button>
				<input type="text" name="name" id="search_member" autocomplete="off"/>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
	            <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
	            <button class="btn btn-primary"  >검색</button>&nbsp;&nbsp;
	            <button class="btn btn-default" id="resetSearch" type="reset">초기화</button>
			</form>
		</div>
		<br>
		
		<div id="member-table" class="table" >
			<table  >
				<tr>
					<th onclick="toggleCheckboxes()">선택</th>
					
					<th>이름</th>
					<th>년차</th>
					<th>기술등급</th>
					<c:if test="${authno == 1}">
					<th>주민번호</th>
					</c:if>
					<th>성별</th>
					<c:if test="${authno == 1}">
					<th>입사일</th>
					<th>계약만료일</th>
					</c:if>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="9">검색결과를 찾을 수 없습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="member" items="${list}" >
			        <tr>
			          <td><input type="checkbox" name="${member.mno }" /></td>
			          	<c:choose>
						  <c:when test="${authno == 1}">
						    <td><a href="member_detail?mno=${member.mno}">${member.name}</a></td>
						  </c:when>
						  <c:otherwise>
						    <td>${member.name}</td>
						  </c:otherwise>
						</c:choose>
			          <td>${member.emplYear}</td>
			          <td>${member.skillLevel}</td>
			          <c:if test="${authno == 1}">
			            <c:set var="juminNo" value="${member.juminNo}" />
			            <c:set var="frontPart" value="${fn:substring(juminNo, 0, fn:length(juminNo) - 7)}" />
			          
						<c:set var="maskedPart" value="*******" />
						<c:set var="maskedJuminNo" value="${frontPart}${maskedPart}" />
						
						<td>${maskedJuminNo}</td>
					 </c:if>


			          <td>${member.gender}</td>
			          <c:if test="${authno == 1}">
			          <td><fmt:parseDate value="${member.joinDate}" pattern="yyyyMMdd" var="parsedJoinDate" />
					    <fmt:formatDate value="${parsedJoinDate}" pattern="yyyy-MM-dd" /></td>
					  <td><fmt:parseDate value="${member.exitDate}" pattern="yyyyMMdd" var="parsedExitDate" />
					    <fmt:formatDate value="${parsedExitDate}" pattern="yyyy-MM-dd" /></td>
					   </c:if>
			        </tr>
			      </c:forEach>
			    </c:otherwise>
			  </c:choose>
			</table>
			<script> 
				function toggleCheckboxes() {
			        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
			        var isChecked = checkboxes[0].checked;

			        for (var i = 0; i < checkboxes.length; i++) {
			          if (!isChecked) {
			            checkboxes[i].checked = true;
			          } else {
			            checkboxes[i].checked = false;
			          }
			        }
			      }
			</script>
			<!-- paging -->
                <div class="text-center">
                    <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous">
                                <a href="${pageMaker.startPage - 1}">Previous</a>
                            </li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                                <a href="${num}">${num}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="paginate_button next">
                                <a href="${pageMaker.endPage + 1}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
                <!-- /.paging -->

                <!-- paging form -->
                <form id="actionForm" action="/member/current_member" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                    <input type="hidden" name="skillLevel" value="${skillLevel}" />
                    <input type="hidden" name="gender" value="${gender}" />
                    <input type="hidden" name="from" value="${from}" />
                    <input type="hidden" name="to" value="${to}" />
                </form>
                
                <!-- /.paging-form -->
		</div>		
		<c:if test="${authno == 1}">
			<div class="multi-function">
			  	 <button id="assign-selected">투입</button>&nbsp;
			     <span>선택항목 여러개 선택시</span>
			</div>
		</c:if>
		
	</div><!-- main end -->
</div>
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
				     
				     $("#searchForm").on("submit", function(event) {
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