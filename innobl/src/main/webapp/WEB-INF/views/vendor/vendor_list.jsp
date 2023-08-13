<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 목록</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="/resources/css/current_member.css">
 
 <script >
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
</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
		<h1>거래처 목록(현재 사용X)</h1>
		<hr/>
		<a href="/vendor/enroll_vendor">거래처 등록</a>
		<div class="search">
		<form id='searchForm' action="/vendor/vendor_list" method="get">
			<select name="type">
				<option value="CGR">전체</option>
				<option value="C">거래처명</option>
				<option value="G">거래처등급</option>
				<option value="R">대표자명</option>
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
					<th>번호</th>
					<th>거래처명</th>
					<th>대표자명</th>
					<th>거래처등급</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
				<c:choose>
			    <c:when test="${empty list}">
			      <tr><td colspan="7">등록된 vendor가 존재하지 않습니다.</td></tr>
			    </c:when>
			    <c:otherwise>
			      <c:forEach var="vendor" items="${list}">
			        <tr>
			          <td><input type="checkbox" /></td>
			          <td>${vendor.vno}</td>
			          <td>${vendor.vname}</td>
			          <td>${vendor.vrep}</td>
			          <td>${vendor.vgrade}</td>
			          <td>${vendor.vphone}</td>
			          <td>${vendor.vaddr}</td>
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
