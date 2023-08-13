<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 화면</title>
    <style>
  		@font-face {
		    font-family: 'SEBANG_Gothic_Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
        body {
            font-family: 'SEBANG_Gothic_Bold';
            display: flex;
            justify-content: center;
           
            height: 100vh;
            margin: 0;
            background-color: darkgray; 
        }
        .container {
         	margin-top:210px;
            background-color: #eeeeee; 
            width: 600px;
            height: 300px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 590px;
            height: 300px;
            border-collapse: collapse;
              border-radius: 5px;
        }
        tr, td {
            border-top: 1px solid white;
            font-size: 40px;
            text-align: center;
            border-radius: 5px;
        }
        input {
            font-family: 'SEBANG_Gothic_Bold';
            height: 60px;
            width: 100%;
            font-size: 40px;
            margin: 0px;
            padding: 0px;
            border:1px solid #eeeeee;
            text-align:center;
        }
        button {
        	font-family: 'SEBANG_Gothic_Bold';
            height: 50px;
            width: 100%;
            font-size: 30px;
            background-color: #f2f2f2; 
        }
        button:hover {
        	font-family: 'SEBANG_Gothic_Bold';
            cursor: pointer;
            color: white;
            background-color: #007bff; 
            transition:1s;
        }
        
        
        ::placeholder {
            position: relative;
            color: #999; 
        }

        ::-webkit-input-placeholder {
            position: relative;
           	left:20px;
            color: #999; 
        }
    </style>
</head>
<body>
	<div class="container">
		<form action="/login/login" method="post" >
			<table>
				<tr style="background-color: #007bff;color:black;">
					<td colspan="2">INNOBL ADMIN</td>
				</tr>
				<tr>
					<td><input type="email" placeholder ="UserID" name ="userid" required></td>
				</tr>
				<tr>
					<td><input type="password" placeholder ="Password" name="password" required></td>
				</tr>
				<tr>
					<td colspan="2">
					<button>Login</button>
					<c:if test="${not empty loginFailed}">
							<script type="text/javascript">
								alert('로그인에 실패했습니다.')
							</script>
					</c:if>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
