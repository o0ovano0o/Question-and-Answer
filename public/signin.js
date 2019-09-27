document.getElementById("user_name").focus();

document.getElementById("user_name").onkeyup=function (e){
KeyUp(e,this,"user_nickname");
}
document.getElementById("user_nickname").onkeyup=function (e){
KeyUp(e,this,"user_email");
}
document.getElementById("user_email").onkeyup=function (e){
KeyUp(e,this,"user_password");
}
document.getElementById("user_password").onkeyup=function (e){
KeyUp(e,this,"user_repassword");
}
document.getElementById("user_repassword").onkeyup=function (e){
KeyUp(e,this,"license");
}
document.getElementById("license").onkeyup=function (e){
KeyUp(e,this,"signin_");
}
function KeyUp(e, that, nextAction) {
    if(window.event) { e = window.event;}
    if(e.keyCode ==13) {
        document.getElementById(nextAction).focus();
    }
}
function titleCase(str) {
  str= str.toLowerCase().split(' ');
  var convertToArray = "";
  for(var i =0; i<str.length;i++){
      if(str[i] != "") convertToArray += str[i]+" ";
 }
 convertToArray = convertToArray.toLowerCase().split(' ');
  var result = convertToArray.map(function(val) {
    return val.replace(val.charAt(0), val.charAt(0).toUpperCase());
  });
  return result.join(' ');
}
function titleCase2(str) {
  var convertToArray = str.split(' ');
  var result = convertToArray.map(function(val) {
    return val.replace(val.charAt(0), val.charAt(0));
  });

  return result.join('');
}
function SubmitClick(){

  var check=true;
  if(document.getElementById("user_name").value==""){
      document.getElementById("user_name").style.borderColor = "red";
      check=false;
  }
  if(document.getElementById("user_nickname").value==""){
      document.getElementById("user_nickname").style.borderColor = "red";
      check=false;
  }
  if(document.getElementById("user_password").value==""){
      document.getElementById("user_password").style.borderColor = "red";
      check=false;
  }
  if(document.getElementById("user_repassword").value==""){
      document.getElementById("user_repassword").style.borderColor = "red";
      check=false;
  }
  else if(document.getElementById("user_password").value!=document.getElementById("user_repassword").value){
    document.getElementById("user_password").style.borderColor = "red";
    document.getElementById("user_repassword").style.borderColor = "red";
    document.getElementById("er_pass").style.visibility="visible";
    check=false;
  }
  if(document.getElementById("user_email").value==""){
      document.getElementById("user_email").style.borderColor = "red";
      check=false;
  }

  if(check==false ){
    alert("Đăng kí không thành công !");
  }
  else {
    alert("Đăng kí thành công!")
    document.getElementById("user_name").value="";
    document.getElementById("user_nickname").value="";
    document.getElementById("user_password").value="";
    document.getElementById("user_repassword").value="";
    document.getElementById("user_email").value="";
  }

}
function col_uname(){
  document.getElementById("user_name").style.borderColor="blue";
}
function col_unname(){
  document.getElementById("user_nickname").style.borderColor="blue";
}
function col_email(){
  document.getElementById("user_email").style.borderColor="blue";
}
function col_pass(){
  document.getElementById("user_password").style.borderColor="blue";
}
function col_repass(){
  document.getElementById("user_repassword").style.borderColor="blue";
}

function Buttonclick(){
  document.getElementById("er_pass").style.visibility="hidden";
}
