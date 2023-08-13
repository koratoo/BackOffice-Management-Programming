<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">
 <link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">
<script>
$(document).ready(function(){
		getMenuNameByMenuno();
  var actionForm = $("#actionForm");
  $(".paginate_button a").on("click", function(e) {
    e.preventDefault();
    console.log('click');
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    
    actionForm.submit();
  });
});
function getMenuNameByMenuno() {
	   var menuno = 3;
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
<style>

  .indent {
    display: inline;
  }
 
  .btn-add-post {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 6px 12px;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
  }
  .btn-add-post:hover {
    background-color: #0056b3;
  }
  td{text-align:left;}
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
		     <h1 id="menu-title">질문게시판</h1>
	         <%@ include file="../common/greeting.jsp" %>
	    </div>
    <hr/>
    <a href="/board/qna_board_write" class="btn-add-post">문의 등록</a>
    <br><br>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>번호</th>
          <th>유형</th>
          <th style="width:700px;">제목</th>
          <th style="width:300px;">작성일</th>
          <th style="width:300px;">작성자</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="board" items="${qnaBoardList}">
          <tr>
            <td style="text-align:center;">${board.getQnabno()}</td>
            <td style="text-align:center; color: ${board.getQna_cd() == '질문' ? 'blue' : 'red'};">${board.getQna_cd() }</td>
            <td>
              <c:forEach var="i" begin="1" end="${board.getQnalvl()}">
                <span class="indent">&emsp;</span>
              </c:forEach>
                 <c:if test="${board.getQnalvl() >= 1}">
				    ➥
				  </c:if>
              <a href="/board/qna_board_dtl?qnabno=${board.getQnabno()}">${board.getTitle()}</a>
            </td>
             <td>${board.getWritedate()}</td>
            <td style="text-align:center;">${board.getName()}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    
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
                <form id="actionForm" action="/board/qna_board" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                </form>
    
    
  </div>
</div>
</body>
</html>
