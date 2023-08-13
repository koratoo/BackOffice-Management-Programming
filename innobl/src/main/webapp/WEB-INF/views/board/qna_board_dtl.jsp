<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 페이지</title>
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
</style>
<script>
$(document).ready(function(){

document.getElementById("replyButton").addEventListener("click", function() {
    window.location.href = "/board/qna_board_repl?qnabno=" + ${qna.getQnabno()};
  });
});
</script>
</head>
<body>
<div class="member_container">
  <%@ include file= "../left_side_menu.jsp"%>
  <div class="main">
    <div class="panel panel-default">
      <br>
      <div class="panel-heading">
        ${qna.getTitle()}
      </div>
      <br>
      <div class="panel-body">
        <table class="table table-striped table-bordered">
          <tr>
            <th>게시글 번호</th>
            <td>${qna.getQnabno()}</td>
            <th>작성자 </th>
            <td>${qna.getMno() }</td>
             <th>게시글 작성일</th>
            <td>${qna.getWritedate()}</td>
          </tr>
           <tr>
            <td class="content-wrapper" colspan="6">${qna.getContent()}</td>
          </tr>
          
          <tr>
            <th colspan="6">	
				<button id="replyButton" class="btn-reply">답글 달기</button>
            </th>
          </tr>
        </table>
      </div>
    </div>
  </div><!-- container end -->
</div><!-- main end -->
</body>
</html>
