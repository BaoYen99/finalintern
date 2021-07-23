$(document).ready(function(){
    var check_soluong_kho=/^[1-9][0-9]*$/;
    var check_don_gia= /^[1-9][0-9]+$/;
console.log($("#don_gia").val());
    $("#btn-submit").click(function(){
        if(check_don_gia.test($("#don_gia").val()) == false){
            event.preventDefault();
            $("#err-dongia").html("gia san pham phai lon hon 1$");   
        }
        if(check_soluong_kho.test($("#so_luong_kho").val()) ==false){
            event.preventDefault();
            $("#err-slkho").html("số Luong hàng trong kho  phải lớn hơn 1");
        }
    });
});