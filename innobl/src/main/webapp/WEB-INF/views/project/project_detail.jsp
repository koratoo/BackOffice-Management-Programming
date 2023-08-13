<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세화면</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/member/enroll.css">
<style>
    table{width:100%;}
    table,tr,td,th{
        border:1px solid black;
        
    }
    select{
        width:100%;
        height:40px;
        font-size: 30px;
    }
    button{
        font-size:30px;
    }
    button:hover{
        cursor:pointer;
    }
    ul{
        font-size:30px;
        list-style:none;
    }
    li{
        padding:5px;
    }
    
    textarea{
    	width: 100%;
    	height: 500px;
    	font-size:30px;
    }
    .project_member{
    	display:flex;
    	justify-content: space-between;
    }
</style>
<script>
function validateDates() {
    var startDate = document.getElementById("start-date").value;
    var endDate = document.getElementById("end-date").value;

    if (endDate < startDate) {
      alert("종료일은 시작일일보다 이른 날짜일 수 없습니다.");
      return false;
    }

    return true;
  }
  

function openNewWindow(e) {
	  e.preventDefault(); // 기본 앵커 태그 동작을 중지
	  var url = e.target.href; // 앵커 태그의 href 값
	  window.open(url, '신규 인원등록', 'width=1000, height=800'); // 새 창으로 해당 URL 열기
	}
	
	
window.addEventListener("message", function (event) {
	  // 메시지를 받았을 시, senderOrigin 확인을 통해 믿을 수 있는 페이지에서 온 것인지 검사
	  var senderOrigin = location.protocol + "//" + location.host;
	  if (event.origin !== senderOrigin) return;

	  // 메시지가 "refresh"일 때, 페이지를 새로고침
	  if (event.data === "refresh") {
	    location.reload();
	  }
	});
</script>
</head>
<body>
<div class="member_container">
    <%@ include file= "../left_side_menu.jsp"%>
    <div class="main">
        <form action="/project/enroll_project" method="post" onsubmit="return validateForm()">
            <h1>프로젝트 상세 화면</h1>
            <hr/>
            <div class="table">
                <table>
                    <tr>
                        <th>프로젝트 이름</th>
                        <td>
                       		<input type="text" value="${project.PRJNAME}" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트상태</th>
                        <td>
                        	<input type="text" value="${project.PRJSTATUS}" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 시작일</th>
                        <td>
                          <input type="text" value ="${project.PRJST}" id="start-date" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 종료일</th>
                        <td>
                          <input type="text" value ="${project.PRJEND}" id="end-date" readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th>프로젝트 상세설명</th>
                        <td>
                          <input type="text" value ="${project.PRJDESC}" readonly />
                        </td>
                    </tr>
                    
                </table>
                <p/><br>
                <div class="project_member">
                <h1>프로젝트 투입 인원</h1>
				<a href="/pm/enroll_pm?PRJNO=${project.PRJNO}" onclick="openNewWindow(event)">신규 인원등록</a>
				</div>
                <hr/>
                <table>
                	<tr>
                		<th>이름</th>
                		<th>프로젝트 투입일</th>
                		<th>프로젝트 철수일</th>
                   		<th>프로젝트 직책</th>
                	</tr>
                		<c:forEach var="pm" items="${pm}">
                	<tr>
                		<td><input type="text" value="${pm.name}" readonly/></td>
                		<td><input type="text" value="${pm.PRJMNG_ST}" readonly/></td>
                		<td>
                   			<input type="text" value="${pm.PRJMNG_END}" readonly/>
                   		</td>
                   		<td>
                   			<input type="text" value="${pm.PRJMNG_ROLE}" readonly/>
                   		</td>
                	</tr>
                   		</c:forEach>
                </table>
            </div>
        </form>
        <br>    
        
    </div><!-- main end -->
</div>

</body>
</html>
