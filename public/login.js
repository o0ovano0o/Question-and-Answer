var correct_user="van005618@gmail.com";
var correct_pass="12345";

var input_user= document.getElementById(`user_email`);
var input_pass= document.getElementById(`user_password`);
var form_login= document.getElementById(`new_user`);

if(form_login.attachEvent){
  form_login.attachEvent('submit', onFormSubmit);
}else{
  form_login.addEventListener('submit', onFormSubmit);
}
function onFormSubmit(e){
  if(e.preventDefault) e.preventDefault();
  var username=input_user.value;
  var password= input_pass.value;
  if(username==correct_user && password== correct_pass){
    window.location='/home';
  }else{
    alert("Đăng nhập thất bại");
  }
  return false;
}
