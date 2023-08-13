<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">
<link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">

 <script >
 	$(document).ready(function(){
 		var actionForm = $("#actionForm");
 		$(".paginate_button a").on("click",function(e){
 			e.preventDefault();
 			console.log('click');
 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 			actionForm.submit();
 		});
 		
 		getMenuNameByMenuno() ;
 	});
 	
 	function getMenuNameByMenuno() {
		   var menuno = 4;
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
 </script>
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
		<div class="greeting-container">
	        <h1 id="menu-title">코드마스터 목록</h1>
	         <%@ include file="../common/greeting.jsp" %>
	    </div>
		<hr/>
		<a href="/code/enroll_code">신규코드 등록</a>
		<div class="search">
		<form id='searchForm' action="/vendor/vendor_list" method="get">
			<select name="type">
				<option value="C">수정예정</option>
			</select>
			<input type="text" name="keyword" id="search_member"/>
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
            <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
            <button class="btn btn-default">검색</button>
		</form>
		</div>
		<div class="table">
			<table>
				<tr>
					<th></th>
					<th>도메인코드</th>
					<th>상세코드</th>
					<th>상세코드명</th>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="7">등록된 vendor가 존재하지 않습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="list" items="${list}">
			        <tr>
			          <td><input type="checkbox" /></td>
			          <td>${list.DCODE}</td>
			          <td>${list.DTLCODE}</td>
			          <td>${list.DTLCODENM}</td>
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
                <form id="actionForm" action="/vendor_list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                </form>
                <!-- /.paging-form -->
		</div>		
	
	</div>
</div>
</body>
</html>
