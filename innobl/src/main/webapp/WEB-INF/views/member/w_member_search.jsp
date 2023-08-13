<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta charset="UTF-8">
<title>회원 검색창</title>
<script>
function selectMember(name, mno) {
    if (window.opener && !window.opener.closed) {
        var memberNameField = window.opener.document.querySelector("#memberName");
        var mnoField = window.opener.document.querySelector("#mno");
        memberNameField.value = name;
        mnoField.value = mno;
    }
    window.close();
}
</script>
</head>
<body>
<div class="container">
<h2>회원 검색 창</h2>
<hr/>
<form method="post" action="/member/w_member_search" >
	<input type="text" name="name">
	
	<button>검색하기</button>
</form>

<hr/>

<table class="table table-hover">

	<tr>
		<th>이름</th>
		<th>성별</th>
		<th>직책</th>
	</tr>
	<c:forEach var="member" items="${member}">
	<tr style="cursor: pointer;" onclick="selectMember('${member.name}', '${member.mno}');">
	
		<td>${member.name}</td>
		<td>${member.gender}</td>
		<td>${member.skillLevel}</td>
		<td><input type="hidden" name = "mno" value="${member.mno}" /></td>
	</tr>
	</c:forEach>
</table>
</div>

</body>
</html>