<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 투입 리스트 화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">
<link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">
 
<script type="text/javascript">
$(document).ready(function(){
    var actionForm = $("#actionForm");
    $(".paginate_button a").on("click", function(e) {
      e.preventDefault();
      console.log('click');
      actionForm.find("input[name='pageNum']").val($(this).attr("href"));
      actionForm.submit();
    });
  });
	getPMRole();
  function validateDates() {
    var startDate = document.getElementById("start-date").value;
    var endDate = document.getElementById("end-date").value;

    if (endDate < startDate) {
      alert("종료일은 시작일일보다 이른 날짜일 수 없습니다.");
      return false;
    }

    return true;
  }

  function getPMRole() {
	  $.ajax({
	    type: "GET",
	    url: "/code/codeVal",
	    data: { codeVal: "PM001" },
	    dataType: "json",
	    success: function(response) {
	      var options = "";
	      options += "<select name='PRJMNG_ROLE' id='prjMngRole'>";
	      $.each(response, function(index, option) {
	        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
	      });
	      options += "</select>";
	      $("#prjMngRole").html(options);
	    },
	    error: function(xhr, status, error) {
	      console.log(error);
	    }
	  });
	}
 
</script>
 <style>
 	.search{display:relative;}
 	#search_member{width:100px;border:1px solid #eeeeee;}
 	#search_all{height:30px;width:200px;border:1px solid #eeeeee;}
 </style>
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
		<div class="greeting-container">
	        <h1>프로젝트 투입현황</h1>
	         <%@ include file="../common/greeting.jsp" %>
	    </div>
		<hr/>
		<a href="/pm/enroll_pm">프로젝트 인원 배치</a>
		
		
		<div class="search">
			<br>
			<form id='searchForm' action="/pm/pm_list" method="post" onsubmit="return validateDates()">
			  <button disabled>프로젝트 투입일</button>
			  <input type="date" id="start-date" name="from" max="9999-12-31" min="1900-12-31" required>
			  <span>  ~  </span>
			  <input type="date" id="end-date" name="to" max="9999-12-31" min="1900-12-31"  required>
			  <button disabled>프로젝트 직책</button>
				<select id="prjMngRole" name = "PRJMNG_ROLE">
					<option>주임</option>
					<option>대리</option>
					<option>과장</option>
					<option>차장</option>
					<option>부장</option>
					<option>이사</option>
				</select>
				<button disabled>이름</button>
				<input type="text" name="name" id="search_member"/>
				
	            <button class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="table">
			<table>
				<tr>
					<th>선택</th>
					<th>성명</th>
					<th>프로젝트 명</th>
					<th>프로젝트 투입일</th>
					<th>프로젝트 철수일</th>
					<th>프로젝트 직책</th>
					<th>비고</th>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="7">등록된 프로젝트가 존재하지 않습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="pm" items="${list}">
			        <tr>
			          <td><input type="checkbox" /></td>
			          <td>${pm.name}</td>
			          <td>${pm.PRJNAME}</td>
			          <td>${pm.PRJMNG_ST}</td>
			          <td>${pm.PRJMNG_END}</td>
			          <td>${pm.PRJMNG_ROLE}</td>
			          <td><a href="#" data-toggle="modal" data-target="#editProjectModal" class="edit-project" data-prjname="${pm.PRJNAME}">수정</a></td>	
			        </tr>
			      </c:forEach>
			    </c:otherwise>
			  </c:choose>
			</table>
			<!-- paging -->
                <div class="pull-right">
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
                <form id="actionForm" action="/pm/pm_list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                </form>
                <!-- /.paging-form -->
                
                <!-- modal -->
                <div class="modal" tabindex="-1" role="dialog" id="editProjectModal">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">프로젝트 수정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <form id="editProjectForm">
				          <div class="form-group">
				            <label for="editProjectName">프로젝트 이름</label>
				            <input type="text" class="form-control" id="editProjectName" name="editProjectName" required>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id="saveProjectChanges">저장</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>		
	</div>
</div>

<script>
  ...
  
  $(document).ready(function() {
    
    $(".edit-project").on("click", function() {
      var projectName = $(this).data("prjname");
      $("#editProjectName").val(projectName);
    });

    $("#saveProjectChanges").on("click", function() {
      var projectName = $("#editProjectName").val();

      // Save the project changes by sending an AJAX request to the server
      // ...
      
      // Close the modal manually after successful request
      $("#editProjectModal").modal("hide");
    });
  });
</script>

</body>
</html>