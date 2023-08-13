	$(document).ready(function() {
		  // 페이지 로드 시 Ajax 요청 보내기
		  getMarriageTypeOptions();
		  getSkillLevelOptions();
		  getGenderTypeOptions();
          getPayTypeOptions();
          getWishPosOptions();
          getEmplTypeOptions();
		});


	  
	  function validateDates() {
		    var joinDate = new Date(document.getElementsByName("joinDate")[0].value);
		    var exitDate = new Date(document.getElementsByName("exitDate")[0].value);
		    var dateAlert = document.getElementById("dateAlert");
		    
		    if (joinDate > exitDate) {
		      dateAlert.style.display = "inline";
		    } else {
		      dateAlert.style.display = "none";
		    }
		  }
	  
	  

	  function getMarriageTypeOptions() {
		  var codeParam = "M001";

		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: codeParam },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr id='marriagetr'>";
		      options += "<th colspan='2'>*결혼유무</th>";
		      $.each(response, function(index, option) {
		        options += "<td colspan='1'>";
		        options += "<input type='radio' name='marriage' value='" + option.dtlcode + "' id='marriage_" + index + "' />";
		        options += "<label for='marriage_" + index + "'>" + option.dtlcodenm + "</label>";
		        options += "</td>";
		      });
		      options += "</tr>";
		      $("#marriagetr").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}

          
	  function getPayTypeOptions() {
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M002" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<th colspan='2'>*급여지급유형</th>";
		      options += "<td colspan='2'>";
		      options += "<select name='payType'>";
		      $.each(response, function(index, option) {
		        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
		      });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#payTypetr").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}
		
		
         function getEmplTypeOptions() {
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M003" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<td colspan='2'>*입사유형</td>";
		      options += "<td colspan='2'>";
		      options += "<select name='emplType'>";
		      $.each(response, function(index, option) {
		        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
		      });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#emplTypetr").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}

         function getWishPosOptions() {
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M004" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<td colspan='2'>*희망직무</td>";
		      options += "<td colspan='2'>";
		      options += "<select name='wishPos'>";
		      $.each(response, function(index, option) {
		        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
		      });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#wishTypetr").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}
	  
	  function getSkillLevelOptions() {
		  $.ajax({
		    type: "GET",
		    url: "/code/codeVal",
		    data: { codeVal: "M005" },
		    dataType: "json",
		    success: function(response) {
		      var options = "<tr>";
		      options += "<th colspan='2'>*기술등급</th>";
		      options += "<td colspan='2'>";
		      options += "<select name='skillLevel'>";
		      $.each(response, function(index, option) {
		        options += "<option value='" + option.dtlcode + "'>" + option.dtlcodenm + "</option>";
		      });
		      options += "</select>";
		      options += "</td>";
		      options += "</tr>";
		      $("#skillLevelRow").replaceWith(options);
		    },
		    error: function(xhr, status, error) {
		      console.log(error);
		    }
		  });
		}

        function getGenderTypeOptions() {
        var codeParam = "M006";

        $.ajax({
            type: "GET",
            url: "/code/codeVal",
            data: { codeVal: codeParam },
            dataType: "json",
            success: function(response) {
            var options = "<tr id='gendertr'>";
            options += "<td colspan='2'>*성별유무</td>";
            $.each(response, function(index, option) {
                options += "<td colspan='1'>";
                options += "<input type='radio' name='gender' value='" + option.dtlcode + "' id='gender_" + index + "' />";
                options += "<label for='gender_" + index + "'>" + option.dtlcodenm + "</label>";
                options += "</td>";
            });
            options += "</tr>";
            $("#gendertr").replaceWith(options);
            },
	            error: function(xhr, status, error) {
	            console.log(error);
            }
          });
        }
        
      
