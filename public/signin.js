window.onload = function(){
			 document.getElementById("user_name").focus();
			}
function chapnhan() {
		if(document.getElementById("user_password").value!=document.getElementById("user_repassword").value&&document.getElementById("password").value!=""
			&&document.getElementById("user_password").value!=""){
				document.getElementById("er_pass").style.visibility="visible";
		}
		
	}
function checkEmail() { 
    var email = document.getElementById('email'); 
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
    if (!filter.test(email.value)) { 
             document.getElementById("er_email").innerHTML='Địa chỉ email không hợp lệ.';
             email.value="";
             email.focus; 
             return false; 
    }
  
} 
function keyup(e,that,next){
				if(window.event){
					e=window.event;
				}
				if(e.keyCode==13){
					document.getElementById(next).focus();
				}
			}
			document.getElementById("hoten").onkeyup=function (e) {
				keyup(e,this,"diachi");
			}
			document.getElementById("diachi").onkeyup=function (e) {
				keyup(e,this,"nam");
			}
			document.getElementById("nam").onkeyup=function (e) {
				keyup(e,this,"nu");
			}
			document.getElementById("nu").onkeyup=function (e) {
				keyup(e,this,"date");
			}
			document.getElementById("date").onkeyup=function (e) {
				keyup(e,this,"email");
				var x=document.getElementById("date").value;
				if(e.keyCode==8){

				}
				else if(x.length==2||x.length==5){
					document.getElementById("date").value=x+"/";
				}
				 
				else{}
			}
	
			document.getElementById("email").onkeyup=function (e) {
				keyup(e,this,"dt");
			}
			document.getElementById("dt").onkeyup=function (e) {
				keyup(e,this,"ta");
			}
			document.getElementById("ta").onkeyup=function (e) {
				keyup(e,this,"qt");
			}
			document.getElementById("qt").onkeyup=function (e) {
				keyup(e,this,"cntt");
			}
			document.getElementById("cntt").onkeyup=function (e) {
				keyup(e,this,"username");
			}
			document.getElementById("username").onkeyup=function (e) {
				keyup(e,this,"password");
			}
			document.getElementById("password").onkeyup=function (e) {
				keyup(e,this,"repass");
			}
			document.getElementById("repass").onkeyup=function (e) {
				keyup(e,this,"gc");
			}
			document.getElementById("gc").onkeyup=function (e) {
				keyup(e,this,"cn");
			}
			document.getElementById("cn").onkeyup=function (e) {
				keyup(e,this,"bq");
			}
			
