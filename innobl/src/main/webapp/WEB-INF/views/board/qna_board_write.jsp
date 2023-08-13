<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성페이지</title>
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
	  font-size:25px;
	  overflow: auto;
	}
	#title_text{
		width: 100%;
		border-radius:10px;
		border:1px solid #eeeeee;
		padding:10px;
		margin:10px;
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
	form{ width:80%;
	height:100%;}
	
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
      <form method="post" action="/board/qna_board_write">
  <div class="main">
    <div class="panel panel-default">
    <h1 style="text-align:center;">새 글 작성페이지</h1>
      <br>
      <div class="panel-heading">
         <input type="text" name="title" placeholder="제목을 입력해주세요(50자 이내)" maxlength="50" id="title_text" />
      </div>
      <br>
      <div class="panel-body">
        <table class="table table-striped table-bordered">
          <tr>
            
            <th>작성자 </th>
            <td>${sessionScope.name}</td>
             <th>게시글 작성일</th>
            <td ><input type="text" name="writedate" id="writedate" readonly/></td>
            
          </tr>
           <tr>
            <td class="content-wrapper" colspan="6"><textarea id="content" placeholder="본문을 입력해주세요(2000자 이내)"  maxlength="2000" name="content"></textarea></td>
           
          </tr>
          <tr>
            
            <th colspan="6">	
            	<button>전송하기</button>
            </th>
          </tr>
        </table>
        	<input type="hidden" name="qna_cd" value="100" />
           <input type="hidden" name="mno" value="${sessionScope.mno}"/>
           <input type="hidden" name="qnalvl" value="0"/>
      </div>
    </div>
  </div><!-- container end -->
 </form>
</div><!-- main end -->
</body>

</html>
