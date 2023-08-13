<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
        <form action="/vendor/enroll_vendor" method="post" onsubmit="return validateForm()">
            <h2>거래처 등록 화면</h2>
            <hr/>
            <div class="table">
                <table>
                    <tr>
                        <th>거래처 이름</th>
                        <td><input type="text" name="vname" oninput="checkEmptyFields()" /></td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td><input type="text" name="vrep" oninput="checkEmptyFields()"/></td>
                    </tr>
                    <tr>
                        <th>거래처 등급</th>
                        <td>
                            <select name="vgrade">
                                <option value="A">A 등급</option>
                                <option value="B">B 등급</option>
                                <option value="C" selected>C 등급</option>
                                <option value="D">D 등급</option>
                                <option value="E">E 등급</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>거래처 전화번호</th>
                        <td><input type="text" name="vphone" oninput="checkEmptyFields()" /></td>
                    </tr>
                    <tr>
                        <th>거래처 주소</th>
                        <td><input type="text" id="address_kakao" name="address" readonly /></td>
                    </tr>
                    <tr>
                        <th>상세 주소</th>
                        <td><input type="text" name="address_detail" oninput="checkEmptyFields()" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="hidden" name="vaddr" id="vaddr" oninput="checkEmptyFields()" />
                            <button type="submit" id="submitBtn" disabled>등록하기</button>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <br>    
        <div class="grade_info">
            <ul>
                <li><strong>[ 거래처 등급 설명 ]</strong></li>
                <li><strong>등급 A : 연간 거래건수 3건 이상 혹은 거래액 100억 이상</strong></li>
                <li>등급 B : 연간 거래건수 3건 이상 혹은 거래액 50억 이상</li>
                <li>등급 C : 연간 거래건수 1건 이상 혹은 거래액 5억 이상</li>
                <li>등급 D : 연간 거래건수 1건 이상 혹은 거래액 1억 이상</li>
                <li>등급 E : 기타</li>
            </ul>
        </div>
    </div><!-- main end -->
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    window.onload = function(){
        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function(data) { //선택시 입력값 세팅
                    document.getElementById("address_kakao").value = data.address; // 주소 넣기
                    document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }

    document.querySelector('form').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼 전송을 막음
        var address = document.getElementById("address_kakao").value;
        var addressDetail = document.querySelector('input[name="address_detail"]').value;
        var vaddr = address + " " + addressDetail;
        document.getElementById("vaddr").value = vaddr;
        this.submit(); // 폼 전송
    });
    
    function validateForm() {
        var vname = document.querySelector('input[name="vname"]').value;
        var vrep = document.querySelector('input[name="vrep"]').value;
        var vphone = document.querySelector('input[name="vphone"]').value;
        var address = document.getElementById("address_kakao").value;
        var addressDetail = document.querySelector('input[name="address_detail"]').value;

        // 빈 값 확인
        if (vname === "" || vrep === "" || vphone === "" || address === "" || addressDetail === "") {
            alert("필수 항목을 모두 입력해주세요.");
            return false; // 폼 제출을 막음
        }
        
        return true; // 폼 제출을 허용
    }
    
    function checkEmptyFields() {
        var vname = document.querySelector('input[name="vname"]').value;
        var vrep = document.querySelector('input[name="vrep"]').value;
        var vphone = document.querySelector('input[name="vphone"]').value;
        var addressDetail = document.querySelector('input[name="address_detail"]').value;

        // 빈 값 확인
        var isEmpty = vname === "" || vrep === "" || vphone === "" || addressDetail === "";

        // 버튼 활성화/비활성화
        var submitBtn = document.getElementById("submitBtn");
        submitBtn.disabled = isEmpty;
    }
</script>
</body>
</html>
