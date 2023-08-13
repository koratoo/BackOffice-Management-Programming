<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h5>로그인 계정 : <span id="userid"  >${userid}  - ${authno}</span></h5>
<span id="logout" onclick="logout()">로그아웃</span>

<script>
        function logout() {
            const isLogoutConfirmed = confirm("로그아웃 하시겠습니까?");
            if (isLogoutConfirmed) {
                window.location.href = "/login/logout"; 
            }
        }
</script>