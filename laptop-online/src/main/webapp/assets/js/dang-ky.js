
$(document).ready(function(){
    function removeAscent (str) {
        if (str === null || str === undefined) return str;
         str = str.toLowerCase();
         str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
         str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
         str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
         str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
         str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
         str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
         str = str.replace(/đ/g, "d");
         return str;
     }
     var regexName = /^[a-zA-Z ]{9,25}$/g;
     var regexDiaChi = /^[a-zA-Z0-9\/\. ]{12,65}$/g;
    var check_sdt=/[0-9]{9}/;
    var check_pass=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/;
    var check_uername=/[a-zA-Z0-9]{6,12}/;
    console.log(sdt);
    $("#submit").click(function() {
        if(check_uername.test($("#ten").val()) == false){
        	 event.preventDefault();
            $("#err-username").html("Username gồm 6 đến 12 ký tự chữ số và chữ cái không có khoảng trắng")   
        }
        if(!regexName.test(removeAscent($("#fullname").val()))){
            event.preventDefault();
            $("#err-fullname").html("Ten co do dai 9 den 25 ky tu ");
        }
        
        if(!regexDiaChi.test(removeAscent($("#diachi").val()))){
            event.preventDefault();
            $("#err-dc").html("Địa chỉ từ 12 đến 65 ký tự");
        }
        if(check_sdt.test($("#sdt").val()) == false){
            event.preventDefault();
            $("#err-sdt").html("số điện thoại gồm 10  số");
   
        } 
        if(check_pass.test($("#pass").val()) == false) {
            event.preventDefault();
            $("#err-pass").html("mật khẩu lớn hơn 8 ký tự gồm 1 chữ số 1 chữ cái thường 1 chữ cái hoa và 1 ký tự đặc biệt");
            
        }
        if($("#pass").val() != $("#pass-confirm").val()){
            event.preventDefault();
            $("#err-pass-confirm").html("mật khẩu xác nhận không trùng khớp");
        }
        
    }); 
});