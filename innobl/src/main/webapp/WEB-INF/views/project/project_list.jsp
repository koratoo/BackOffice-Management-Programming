<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 리스트 화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">
<link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
getStatusTypeOptions();

  function validateDates() {
    var startDate = document.getElementById("start-date").value;
    var endDate = document.getElementById("end-date").value;

    if (endDate < startDate) {
      alert("종료일은 시작일일보다 이른 날짜일 수 없습니다.");
      return false;
    }

    return true;
  }

  $(document).ready(function(){
    var actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function(e) {
      e.preventDefault();
      console.log('click');
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      actionForm.submit();
    });
    
   
  });
  
  function getStatusTypeOptions() {
	  var selectedValue = '${PRJSTATUS}';

	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "P001" },
	    dataType: "json",
	    success: function(response) {
	      var options = "<button disabled>프로젝트 상태</button>";
	      options += "<select name='PRJSTATUS' id='search_member'>";
	      options += "<option value='0' selected >선택없음</option>"; // 기본 옵션 추가

	      $.each(response, function(index, option) {
              options += "<option value='" + option.dtlcode + "'";
              if (option.dtlcode === selectedValue) {
                  options += " selected";
              }
              options += ">" + option.dtlcodenm + "</option>";
          });
	      options += "</select>";
	      $(".projectStatustr").html(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
  $(document).ready(function(){
	  const menuno =2;
	  $("#start-date, #end-date").on("input", function () {
		    let inputValue = $(this).val();
		    let noKoreanValue = inputValue.replace(/[가-힣ㄱ-ㅎㅏ-ㅣ]/g, "");
		    $(this).val(noKoreanValue);
		});   
	  function validateLength() {
		    var startDate = document.getElementById("start-date").value;
		    var endDate = document.getElementById("end-date").value;

		    if (startDate.length < 8 || endDate.length < 8) {
		        alert("YYYYMMDD 의 형태로 입력해 주세요.(ex 20230723)");
		        return false;
		    }
		    return true;
		}
	 
	  function getMenuNameByMenuno(menuno) {
		   
		    $.ajax({
		      url: "/getMenuName",
		      type: "GET",
		      dataType: "text",
		      data: { menuno: menuno },
		      contentType: "text/plain;charset=UTF-8",
		      success: function(data) {
		        // 가져온 메뉴 이름을 H1 태그의 텍스트로 설정
		        $("#menu-title").text(data);
		      },
		      error: function(xhr, status, error) {
		        console.log("Error: " + error);
		      }
		    });
		  } 
	  getMenuNameByMenuno(menuno); 

  });
  
 
</script>
 <style>
 	.search{display:relative;}
 	#search_member{width:100px;border:1px solid #eeeeee;}
 	#search_all{height:30px;width:200px;border:1px solid #eeeeee;}
 	#start-date,#end-date{height:30px;width:100px;border:1px solid #eeeeee;}
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
		<a href="/project/enroll_project">프로젝트 등록</a>
		<div class="search">
			
			<br>
			<form id='searchForm' action="/project/project_list" method="post" onsubmit="return validateDates()">
			  <button disabled>프로젝트 시작일</button>
			  <input type="text" id="start-date" name="from" value="${from}" max="9999-12-31" maxlength="8" autocomplete=off required>
			  <span>  ~  </span>
			  <input type="text" id="end-date" name="to" value="${to}" max="9999-12-31" maxlength="8" autocomplete=off required>
			  <script type="text/javascript" src="/resources/js/date_check_function.js"></script> 		
				<button disabled>완료여부</button>
				<select class="projectStatustr" name="PRJSTATUS" id="search_member">
				</select>
				
				<button disabled>프로젝트 명</button>
				<input type="text" name="PRJNAME" id="search_member"/>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
	            <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
	            <button class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="table">
		<form id="deleteForm">
			<table>
				<tr>
					<th>선택</th>
					<th>프로젝트 이름</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>상태정보</th>
					<th>고객사명</th>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="7">등록된 프로젝트가 존재하지 않습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="project" items="${list}">
			        <tr>
			          <td><input type="checkbox" name="projectIds" value="${project.PRJNO}" /></td>
			          <td><a href="project_detail?PRJNO=${project.PRJNO}">${project.PRJNAME}</a></td>
			          <td>${project.PRJST}</td>
			          <td>${project.PRJEND}</td>
			          <td>${project.PRJSTATUS}</td>
			          <td>${project.VNAME}</td>
			        </tr>
			      </c:forEach>
			    </c:otherwise>
			  </c:choose>
			</table>
			<br>
			<div class="pull-left">
				<input type="button" value="삭제하기" id="deleteButton">
			</div>
		</form>
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
                <form id="actionForm" action="/project/project_list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="from" value="${from}" />
                    <input type="hidden" name="to" value="${to}" />
                    <input type="hidden" name="PRJSTATUS" value="${PRJSTATUS}" />
                </form>
                <!-- /.paging-form -->
                
           
                
		</div>		
	
	
	
	</div>
</div>
 			
<script>
  document.getElementById("deleteButton").addEventListener("click", function () {
    const checkboxes = document.querySelectorAll('input[name="projectIds"]:checked');

    if (checkboxes.length === 0) {
      alert("선택된 프로젝트가 없습니다.");
      return;
    }

    const projectIds = Array.from(checkboxes).map(checkbox => checkbox.value);

    fetch('/project/delete_projects', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(projectIds)
    })
    .then(response => response.json())
    .then(data => {
      alert(data.message);
      location.href="/project/project_list";
    })
    .catch(error => {
      console.error('Error:', error);
      alert('에러 발생 관리자에게 문의해 주세요.');
    });
  });
  
  
</script>
</body>
</html>