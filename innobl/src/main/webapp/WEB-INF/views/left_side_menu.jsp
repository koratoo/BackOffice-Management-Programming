<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <style>
        @font-face {
            font-family: 'HANAMDAUM';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/HANAMDAUM.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }
        .member_container {
            display: flex;
            height: 100%;
        }
        .left-sidemenu>ul>li>a {
            text-decoration-line: none;
            color: black;
        }
        .left-sidemenu {
            font-family: 'HANAMDAUM';
            width: 20%;
            height: 1080px;
            background-color: rgb(40, 90, 140);
            font-size: 30px;
            display: flex;
            flex-direction: column;
            padding: 20px;
            border-right: 1px solid rgba(0, 0, 0, 0.1);
        }
        .left-sidemenu > ul {
            list-style: none;
            padding: 0;
            width: 100%;
        }
        .left-sidemenu > ul > li {
            padding: 10px;
            text-align: center;
            background-color: #ffffff;
            margin-bottom: 10px;
            border-radius: 10px;
        }
        .left-sidemenu > img {
            width: 70%;
            align-self: center;
            padding-top: 10px;
            padding-bottom: 5px;
            margin-bottom: 5px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }
        .left-sidemenu > ul > li:first-child {
            margin-top: 5px;
        }
        .left-sidemenu > ul > li:hover,
        .left-sidemenu > ul > li:hover a {
            cursor: pointer;
            background-color: rgb(40, 90, 140);
            color: white;
            transition: 0.2s;
        }
        .left-sidemenu >h1 ,
        .left-sidemenu >h6{
        	align-self:center;
        	color:white;
        }
    </style>
    <script>
	$(document).ready(function() {
	  // 권한 번호를 지정하세요.
	  const authno =  '<%= session.getAttribute("authno") %>';
	
	  $.ajax({
	    url: "/left_side_menu",
	    type: "GET",
	    dataType: "json",
	    data: { authno: authno },
	    success: function(data) {
	      $("#left-side-menu").empty(); // 메뉴 목록을 비우기
	
	      // 권한에 따른 메뉴 항목 추가
	      $.each(data, function(index, menu) {
	        let menuItem = $("<li></li>").append($("<a></a>").attr("href", menu.menuurl).text(menu.menunm));
	        $("#left-side-menu").append(menuItem);
	      });
	    },
	    error: function(xhr, status, error) {
	      console.log("Error: " + error);
	    }
	  });
	});
	</script>
</head>
<body>
    <div class="left-sidemenu">
        <h1>INNOBL</h1>
        <h6>INNOVATION Better Life</h6>
        <hr/>
		<ul id="left-side-menu">
           
        </ul>
    </div>
</body>
</html>
