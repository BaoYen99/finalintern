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
		var regexDiaChi = /^[a-zA-Z0-9\/, ]{12,65}$/g;
		var check_sdt=/[0-9]{9}/;
		$("#btn-submit").click(function(){
			
			if(!regexName.test(removeAscent($("#ten").val()))){
				event.preventDefault();
				$("#err-ten").html("Ten co do dai 9 den 25 ky tu ");
			}
			if(check_sdt.test($("#sdt").val()) == false){
				event.preventDefault();
				$("#err-sdt").html("số điện thoại gồm 10  số");
			}
			if(!regexDiaChi.test(removeAscent($("#diachi").val()))){
				event.preventDefault();
				$("#err-dc").html("Địa chỉ từ 12 đến 65 ký tự");
			}
		});
		
});