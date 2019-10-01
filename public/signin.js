document.getElementById("InputName").focus();

document.getElementById("InputName").onkeyup = function(e) {
  KeyUp(e, this, "InputNName");
}
document.getElementById("InputNName").onkeyup = function(e) {
  KeyUp(e, this, "InputEmail");
}
document.getElementById("InputEmail").onkeyup = function(e) {
  KeyUp(e, this, "InputPhoneNum");
}
document.getElementById("InputPhoneNum").onkeyup = function(e) {
  KeyUp(e, this, "InputPassword");
}
document.getElementById("InputPassword").onkeyup = function(e) {
  KeyUp(e, this, "InputRePassW");
}
document.getElementById("InputRePassW").onkeyup = function(e) {
  KeyUp(e, this, "exampleRadios1");
}
document.getElementById("exampleRadios1").onkeyup = function(e) {
  KeyUp(e, this, "submit");
}

function KeyUp(e, that, nextAction) {
  if (window.event) {
    e = window.event;
  }
  if (e.keyCode == 13) {
    document.getElementById(nextAction).focus();
  }
}

function titleCase(str) {
  str = str.toLowerCase().split(' ');
  var convertToArray = '';
  for (var i = 0; i < str.length; i++) {
    if (str[i] != '') convertToArray += str[i] + ' ';
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

function Email_() {
  var email = document.getElementById("InputEmail").value;
  var aCong = email.indexOf('@');
  var dauCham = email.lastIndexOf('.');
  if (email == '') {
    return false;
  } else if ((aCong < 1) || (dauCham < aCong + 2) || (dauCham + 2 > email.length)) {
    alert("Email khong chinh xác");
    return false;
  } else {
    return true;
  }
}

function checkpass() {
  var pass = document.getElementById("InputPassword").value;
  var repass = document.getElementById("InputRePassW").value;
  if (repass != pass) {
    alert("Mật khẩu không khớp");
  }
}

function checkPhone() {
  var phone = document.getElementById("InputPhoneNum").value;
  var phoneNum = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
  if (phone == '') return false;
  if (phone.match(phoneNum)) {
    return true;
  } else {
    alert("số điện thoại không hợp lệ");
    return false;
  }
}
