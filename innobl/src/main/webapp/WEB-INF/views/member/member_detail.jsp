<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 상세 화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" type="text/css" href="/resources/css/greeting.css">
 <link rel="stylesheet" type="text/css" href="/resources/css/member/member_detail.css">

</head>
<body>
<div class="member_container">
	<%@ include file= "../left_side_menu.jsp"%>
	<div class="main">
	
	    <h1>사원 상세정보</h1>
       

	<hr/>
		<div class="top">
			<div class="profile-image">
				<img src="/resources/${member.getProfileImg().substring(member.getProfileImg().indexOf("resources") + 9)}" alt="프로필 이미지">

			</div>
			<table>
				<tr>
					<td>한글이름</td>
					<td><input type="text" value="${member.getName()}" readOnly/></td>
				</tr>
				<tr>
					<td>영문이름</td>
					<td><input type="text" value="${member.getEngName()}" readOnly/></td>
				</tr>
				<tr>
					<td>한자이름</td>
					<td><input type="text" value="${member.getChnName()}" readOnly/></td>
				</tr>
				
			</table>
		</div><!-- top end -->
		<hr/>
		<div class="main-bottom">
			<table>
			
				<tr>
					<td>생년월일</td>
					<td><input type="text" value="${member.getBirthday()}" name="birthday" readOnly/></td>
					<td>주민등록번호</td>
					<td><input type="text" value="${member.getJuminNo()}" id="jumin_text" readOnly/></td>
				</tr>
				<tr>	
					<td>주소</td>
					<td><input type="text" value="${member.getAddr()} " name="addr" readOnly/></td>
					<td>상세주소</td>
					<td><input type="text" value="${member.getAddrdtl()} " name="addrdtl" readOnly/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" value="${member.getGender()}" name="gender" readOnly /></td>
					<td>결혼유무</td>
					<td><input type="text" value="${member.getMarriage()}" name="marriage" readOnly /></td>
				</tr>
				<tr>
					<td>년차</td>
					<td><input type="text" value="${member.getEmplYear()}" name="emplYear" readOnly/></td>
					<td>급여 지급 유형</td>
					<td><input type="text" value="${member.getPayType()}" name="payType" readOnly/></td>
				
				</tr>
				<tr>
					<td>희망 직무</td>
					<td><input type="text" value="${member.getWishPos()}" name="wishPos" readOnly/></td>
				
					<td>입사유형</td>
					<td><input type="text" value="${member.getEmplType()}" name="emplType" readOnly/></td>
				</tr>
				
				<tr>
					<td>연락처</td>
					<td><input type="text" value="${member.getPhone()}" name="phone" readOnly/></td>
				
					<td>이메일</td>
					<td><input type="text" value="${member.getEmail()}" name="email" readOnly/></td>
				</tr>
				
				<tr>
					<td>기술등급</td>
					<td><input type="text" value="${member.getSkillLevel()}" name="skillLevel" readOnly/></td>
					<td>주량</td>
					<td><input type="text" value="${member.getAlchol()}" name="alchol" readOnly/></td>
				</tr>
				
				<tr>
					<td colspan="4"><hr/><a href="modify_member?mno=${member.mno}">수정하기</a>&nbsp;&nbsp;<a href="remove_member?mno=${member.mno}">삭제하기</a><hr/></td>
				</tr>
				
			</table>
		</div>
	</div>
</div>
</body>
</html>