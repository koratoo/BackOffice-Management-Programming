<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 페이지</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/current_member.css">

<style>
	body {
		font-family: "Noto Sans KR", sans-serif;
	}

	.main {
		display: flex;
	}

	.container {
		margin-left: 0;
		margin-top: 30px;
	}

	.panel {
		width: 100%;
	}

	.panel-heading {
		font-size: 24px;
		font-weight: bold;
	}

	.panel-body {
		font-size: 16px;
		padding-top: 0;
	}
	
	.btn-reply {
		background-color: #007bff;
		color: white;
		border: none;
		padding: 6px 12px;
		border-radius: 4px;
		cursor: pointer;
	}
	.btn-reply:hover {
		background-color: #0056b3;
	}

	.table th {
		font-weight: bold;
		color:black;
		background-color: #eeeeee;
	    vertical-align: middle; 
	}
	td{
		text-align:left;
		background-color:white;
	}
	.content-wrapper {
	  height: 300px; /* 원하는 높이로 조절하세요 */
	  overflow: auto;
	}
	#title_text{
		width: 100%;
		border-radius:10px;
		border:1px solid #eeeeee;
	}
	#content{
		width:100%;
		height:100%;
		border-radius:10px;
		border:1px solid #eeeeee;
	}
	#writedate{
		border : 1px solid white;
	}
	form{ 
		width:80%;
		height:100%;
	}
	
</style>
<script>
	function setCurrentDate() {
	
	  let today = new Date();
	  document.getElementById("writedate").value = today.toLocaleString();
	}

	document.addEventListener("DOMContentLoaded", setCurrentDate);
</script>
</head>
<body>
<div class="member_container">
  <%@ include file= "../left_side_menu.jsp"%>
      <form method="post" action="/board/qna_board_repl">
  <div class="main">
    <div class="panel panel-default">
      <br>
      <div class="panel-heading">
         <input type="text" name="title" id="title_text" placeholder="제목을 입력해주세요" />
      </div>
      <br>
      <div class="panel-body">
        <table class="table table-striped table-bordered">
          <tr>
            
            <th>작성자 </th>
            <td>${sessionScope.name}</td>
            <th>게시글 작성일</th>
            <td ><input type="text" name="writedate" id="writedate" readonly/></td>
            <th>유형</th>
            <td>
          		<select name="qna_cd">
          			<option value="100">질문</option>
          			<option value="200">답변</option>
          		</select>
          	</td>
          </tr>
           <tr>
            <td class="content-wrapper" colspan="6"><textarea id="content" name="content"></textarea></td>
           
          </tr>
          <tr>
          	
          </tr>
          <tr>
            
            <th colspan="6">	
            	<button>전송하기</button>
            </th>
          </tr>
        </table>
           <input type="hidden" name="mno" value="${sessionScope.mno}"/>
           <input type="hidden" name="prnt_qnabno" value="${qnabno}"/>
           <input type="hidden" name="qnalvl" value="${qna.qnalvl}"/>
      </div>
    </div>
  </div><!-- container end -->
 </form>
</div><!-- main end -->
</body>

</html>
