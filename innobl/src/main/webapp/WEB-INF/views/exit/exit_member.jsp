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
 <link rel="stylesheet" type="text/css" href="/resources/css/current_member.css">
 
 <script type="text/javascript">
 	$(document).ready(function(){
 		var actionForm = $("#actionForm");
 		$(".paginate_button a").on("click",function(e){
 			e.preventDefault();
 			console.log('click');
 			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
 			actionForm.submit();
 		});
 		
 	});
 	
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
		<h1>👤퇴직 사원 목록</h1>
		<hr/>
		<div class="search">
			<br>
			<form id='searchForm' action="/current_member" method="post">
				<button disabled>기술등급</button>
				<select name="skillLevel" id="search_member">
					<option value="초급">초급</option>
					<option value="중급">중급</option>
					<option value="고급">고급</option>
					<option value="특급">특급</option>
				</select>
				
			
				<button disabled>성별</button>
				<select name="gender" id="search_member">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select>
			
				<button disabled>이름</button>
				<input type="text" name="name" id="search_member"/>
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
	            <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
	            <button class="btn btn-default">검색</button>
			</form>
		</div>
		<div class="table">
			<table>
				<tr>
					<th>체크</th>
					<th>이름</th>
					<th>년차</th>
					<th>기술등급</th>
					<th>주민번호</th>
					<th>성별</th>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="7">등록된 회원이 존재하지 않습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="member" items="${list}">
			        <tr>
			          <td><input type="checkbox" /></td>
			          <td><a href="member_detail?mno=${member.mno}">${member.name}</a></td>
			          <td>${member.emplYear}</td>
			          <td>${member.skillLevel}</td>
			          <td>${member.juminNo}</td>
			          <td>${member.gender}</td>
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
                <form id="actionForm" action="/current_member" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                </form>
                <!-- /.paging-form -->
		</div>		
	
	</div>
</div>
</body>
</html>