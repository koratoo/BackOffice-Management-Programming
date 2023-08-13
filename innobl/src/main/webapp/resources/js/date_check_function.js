
			 
$("#start-date").datepicker({
       dateFormat: "yymmdd",
       onClose: function (dateText) {
           var startDate = dateText;
          
       },
   }).on("input", function () {
       var currentValue = $(this).val();
       
       if(currentValue.length == 4){
           var year = parseInt(currentValue.substr(0,4));
           
           if(year > 2050){
               alert(year+'년은 유효하지 않습니다.(max : 2050년)');
               var newValue =  2023;
               $(this).val(newValue);
           }
           if(year<1980){
               alert(year+'년은 유효하지 않습니다.(min : 1980년)');
               var newValue =  1980;
               $(this).val(newValue);
           }
       }
       
       if (currentValue.length == 6) {
           var month = parseInt(currentValue.substr(4, 2));
           var year = parseInt(currentValue.substr(0,4));
          
          	
           if (month > 12 || month==0) {
               
               alert(month+ '월, 범위를 벗어난 값입니다.(1~12월 사이 값을 입력해주세요)')
               var newValue =  year;
               $(this).val(newValue);
           }
           
       }/* if end */
       
       if(currentValue.length == 8){
            var month = parseInt(currentValue.substr(4, 2));
            var year = parseInt(currentValue.substr(0,4));
            var day = parseInt(currentValue.substr(6, 2));
            var currentMonthLength = new Date(year, month, 0).getDate();
            console.log(currentMonthLength)
             if (day > currentMonthLength || day==0) {
                 alert(day + '일, 범위를 벗어난 값입니다. (' + month + '월은 ' + currentMonthLength + '일까지 있습니다)');
                   var newValue = year.toString() + (month < 10 ? "0" : "") + month.toString() + "01";
                   $(this).val(newValue);
               }
       }
   });
$("#end-date").datepicker({  
    dateFormat: "yymmdd",
       onClose: function (dateText) {
           var startDate = dateText;
          
       },
   }).on("input", function () {
       var currentValue = $(this).val();
       
       if(currentValue.length == 4){
           var year = parseInt(currentValue.substr(0,4));
           
           if(year > 2050){
               alert(year+'년은 유효하지 않습니다.(max : 2050년)');
               var newValue =  2023;
               $(this).val(newValue);
           }
           if(year<1980 ){
               alert(year+'년은 유효하지 않습니다.(min : 1980년)');
               var newValue =  1980;
               $(this).val(newValue);
           }
       }
       
       if (currentValue.length == 6) {
           var month = parseInt(currentValue.substr(4, 2));
           var year = parseInt(currentValue.substr(0,4));
          
           
           if (month > 12 || month==0) {
               
               alert(month+ '월, 범위를 벗어난 값입니다.(1~12월 사이 값을 입력해주세요)')
               var newValue =  year;
               $(this).val(newValue);
           }
           
       }/* if end */
       
       if(currentValue.length == 8){
            var month = parseInt(currentValue.substr(4, 2));
            var year = parseInt(currentValue.substr(0,4));
            var day = parseInt(currentValue.substr(6, 2));
            var currentMonthLength = new Date(year, month, 0).getDate();
            console.log(currentMonthLength)
             if (day > currentMonthLength || day==0) {
                 alert(day + '일, 범위를 벗어난 값입니다. (' + month + '월은 ' + currentMonthLength + '일까지 있습니다)');
                   var newValue = year.toString() + (month < 10 ? "0" : "") + month.toString() + "01";
                   $(this).val(newValue);
               }
       }
});

				
 