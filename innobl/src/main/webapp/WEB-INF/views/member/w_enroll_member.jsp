<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
   
  </script>
<meta charset="UTF-8">
<title>인원 목록</title>
   <style>
		 @font-face {
		    font-family: 'SEBANG_Gothic_Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		body{
		    font-family: 'SEBANG_Gothic_Bold';
			background-color:#eeeeee;
		}
        table,
        tr,
        td {
           font-family: 'SEBANG_Gothic_Bold';
           	background-color:white;
            border: 1px solid black;
            border-collapse: collapse;
        }
        input,select,button{
            font-family: 'SEBANG_Gothic_Bold';
        	font-size:20px;
        }
        /* 추가된 부분 */
        body {
            margin: 0;
        }

        table {
           font-family: 'SEBANG_Gothic_Bold';
            width: 100%;
        }

      	th{
      		background-color:rgb(40,90,140);
      		color:white;
      	}

        td {
            text-align: center;
            padding: 8px;
        }
    </style>
   	
    
</head>
<body>
<form method="post" action="/member/w_enroll_member" >
<table>
	<tr>
		<th colspan="6">프로젝트 명</th>
	</tr>
	
	<tr>
		<td colspan="6">
			<select name ="prjno">
				<option value="">프로젝트를 선택해 주세요!</option>
				<c:forEach var="prj" items="${project }">
					<option value="${prj.PRJNO }">${prj.PRJNAME }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
	  <tr>
	    <th colspan="1">시작일</th>
	    <td colspan="2" id="start-date">-</td>
	  
	    <th colspan="1">종료일</th>
	    <td colspan="2" id="end-date">-</td>
	  </tr>
	  
	  <tr>
	    <th colspan="2">프로젝트 진행상황</th>
	    <td colspan="4" class="project-status">-</td>
	  </tr>
	  <tr>
	    <th colspan="2">프로젝트 상세</th>
	    <td colspan="4" class="project-details">-</td>
	  </tr>
	  
	  
	  
	  </table>
	  <table>
	  <tbody id="tableBody">
		  <tr>
		    <th>투입 인원 현황</th>
		    <td id="prjMemberName">이름</td>
		    <th>투입일</th>
		    <td id="startDate" >날짜</td>
		    <th>직책</th>
		    <td id="projectRole">-</td>
		  </tr>
		</tbody>
	  </table>
	  <table>
	<tr>
		<th>
			이름
		</th>
		<th>
			투입일
		</th>
		<th>
			철수일
		</th>
		<th>
			역할
		</th>
		<th>
			비고
		</th>
	</tr>
		<c:forEach var="member" items="${mlist}">
			<tr>
				<td  id="prjMemberInput${status.index}">
					<input type="text"  id="prjMemberList${status.index}" value="${member.name}" readonly/>
					<input type="hidden"   name = "mno[]" value="${member.mno}"/>
				</td>
				<td>
					<input type="text" id="start-date" name="prjmng_st[]"   maxlength="8"/>
					
				</td>
				<td>
					<input type="text" id="end-date"name="prjmng_end[]" maxlength="8"/>
				</td>
				
				 <td id="projectRoletd" >
					<select name = "prjmng_role[]">
						<option >직책</option>
					</select>
				</td>
			
				<td><button style="border-radius:50%; cursor:pointer;" class="remove-btn">-</button></td>
			</tr>
		</c:forEach>
	<tr>
		<td colspan="5"> 
			<button>투입하기</button>
		</td>
	</tr>
</table>
</form>
  <script>
    $(document).ready(function() {
        <c:forEach var="member" items="${mlist}" varStatus="status">
            getRoleTypeOptions(${status.index});
        </c:forEach> 
       
      
     // 제거 버튼 클릭 시 해당 행을 제거하는 이벤트 리스너
        $('button.remove-btn').on('click', function () {
          // 삭제할 행 및 mno 값 찾기
          const row = $(this).closest("tr"); // Use closest() instead of parent().parent()
          const mnoInput = row.find("input[name='mno[]']");

          // selectedItems에서 해당 mno 제거
          const currentURL = window.location.href;
          const urlParts = currentURL.split("?");
          const queryParams = urlParts[1].split("&");
          const updatedParams = queryParams.map(param => {
            if (param.startsWith("selectedItems")) {
              const selectedItems = param.split("=")[1].split(",").filter(item => item !== mnoInput.val()).join(",");
              return "selectedItems=" + selectedItems;
            } else {
              return param;
            }
          });
          // URL 업데이트
          const updatedURL = urlParts[0] + "?" + updatedParams.join("&");
          window.history.replaceState(null, null, updatedURL);

          // mno input 및 행 삭제
          mnoInput.remove();
          row.remove();
          
        
       	  const prjNo = $('select[name="prjno"]').val();
       	  console.log(prjNo);
       	  updateProjectDetails(prjNo);
       	  updateProjectMembers(prjNo);
       	  
       	
      
        });
        
        $("form").on("submit", function(event) {
        	const prjNo = $('select[name="prjno"]').val()
            event.preventDefault();
        	
            var formData = $(this).serialize();
            $.ajax({
                type: "POST",
                url: "/member/w_enroll_member", 
                data: formData,
                success: function(response) {
                    alert("인원이 배정되었습니다.^^");
                    window.close(); 
                },
                error: function(response) {
                	if (response.status === 409) {
                        alert("등록된 회원이 존재합니다");
                    }
                	if (response.status === 400 && prjNo == '') {
                        alert("프로젝트를 선택하지 않으셨습니다.");
                    }else if(response.status === 400){
                        alert("투입하려는 회원이 존재하지 않습니다.");
                		
                	}
                	if (response.status === 500) {
                        alert("관리자에게 문의 부탁드립니다.");
                    }
                	
                }
            });
        });
    });
    /* document.ready end  */
    
    function getRoleTypeOptions(i) {
        $.ajax({
            type: "GET",
            url: "/code/codeVal",
            data: { codeVal: 'PM001' },
            dataType: "json",
            success: function(response) {
                var options = "<td>";
                options += "<select name='prjmng_role[]'>";
                $.each(response, function(index, option) {
                    options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
                });
                options += "</select>";
                options += "</td>";
                $("#projectRoletd").replaceWith(options);
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }
    
    function updateProjectDetails(prjNo) {

  	 
    	 function formatDate(dateString) {
             if (!dateString) {
               return "";
             }
             const date = dateString.toString();
             return date;
           }
    	  // Ajax 호출
    	  $.ajax({
    	    type: "GET",
    	    url: "/project/w_project_detail",
    	    data: { PRJNO: prjNo },
    	    dataType: "json",
    	    success: function (response) {
    	      const startDate = $("#start-date");
    	      const endDate = $("#end-date");
    	      const projectStatus = $(".project-status");
    	      const projectDetails = $(".project-details");

    	      startDate.text(formatDate(response.prjst));
    	      endDate.text(formatDate(response.prjend));

    	      projectStatus.text(response.prjstatus);
    	      projectDetails.text(response.prjdesc);
    	      $("input[name='prjmng_st[]']").val(formatDate(response.prjst)); // min 속성 설정;
    	      $("input[name='prjmng_end[]']").val(formatDate(response.prjend));
    	      

    	    },
    	    error: function (xhr, status, error) {
    	      console.error("Failed to fetch project details", error);
    	    },
    	  });

    	}
   		function updateProjectMembers(prjNo) {
   			function formatDate(dateString) {
                if (!dateString) {
                  return "";
                }
                const date = dateString.toString();
                return date.substr(0, 4) + "-" + date.substr(4, 2) + "-" + date.substr(6, 2);
              }
    	  // Ajax 호출
    	  $.ajax({
    	    type: "GET",
    	    url: "/project/w_project_members",
    	    data: { PRJNO: prjNo },
    	    dataType: "json",
    	    success: function (response) {
    	        // 투입 인원 현황 작성
    	        const pmList = response;
    	        const tableBody = $("#tableBody");
    	        tableBody.empty();

    	        // 이름에 있는 회원 이름 가져오기
    	         const prjMemberNameList = $("input[id^='prjMemberList']").map(function () {
		            return $(this).val().trim();
		        }).get();

    	        if (pmList.length === 0) {
    	            const noDataMessage = "<tr><td colspan='6'>현재 투입된 인원이 없습니다.^^</td></tr>";
    	            tableBody.append(noDataMessage);
    	        } else {
    	            for (let i = 0; i < pmList.length; i++) {
    	                // 배경색 변경 여부
    	                let changeBgColor = prjMemberNameList.includes(pmList[i].name);
    	                const newRow = "<tr>" +
    	                    "<th>투입 인원 현황</th>" +
    	                    (changeBgColor ? "<td style='color:rgb(40,90,140);'> (등록된인원)" : "<td>") +
    	                    pmList[i].name + "</td>" +
    	                    "<th>투입일</th>" +
    	                    "<td>" + formatDate(pmList[i].prjmng_ST) + "</td>" +
    	                    "<th>직책</th>" +
    	                    "<td>" + pmList[i].prjmng_ROLE + "</td>" +
    	                    "</tr>";

    	                tableBody.append(newRow);
    	            }
    	        }
    	    },
    	    error: function (xhr, status, error) {
    	      console.error("Failed to fetch project details", error);
    	    },
    	  });
    	}
    	   // 이벤트 리스너
    	$("select[name='prjno']").on("change", function (event) {
    	  const prjNo = event.target.value;
    	  
    	  updateProjectDetails(prjNo);
    	  updateProjectMembers(prjNo);
    	});
    	
    	function checkNumbersOnly(input) {
		    const nonNumberRegex = /[^0-9]/g;
		    if (input.value.match(nonNumberRegex)) {
		        alert("숫자만 입력 가능합니다.");
		    }
		
		    input.value = input.value.replace(nonNumberRegex, "");
		}
    	

		
    	
    </script>
</body>
</html>