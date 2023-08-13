<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
<link rel="stylesheet" type="text/css" href="/resources/css/enroll.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/enroll.css">

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
</style>
</head>
<body>
<div class="member_container">
    <%@ include file= "../left_side_menu.jsp"%>
    <div class="main">
        <form action="/code/enroll_code" method="post" >
            <h1>코드 등록 화면</h1>
            <hr/>
            <div class="table">
                <table>
                    <tr>
                        <th>도메인 코드</th>
                        <td>
                        	<select name="DCODE">
                       		<c:forEach var="list" items="${list}">
								<option value="${list.DCODE}">${list.DCODENM}</option>                       			
                       		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <th>상세코드</th>
                       	<td><input type="text" name = "DTLCODE" /></td>
                    </tr>
                    <tr>
                    	<th>상세코드명</th>
                    	<td><input type="text" name ="DTLCODENM"/></td>
                    </tr>
                    
                   
                    <tr>
                        <td colspan="2">
                            <button type="submit" id="submitBtn">등록하기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br>    
        
    </div><!-- main end -->
</div>

</body>
</html>
