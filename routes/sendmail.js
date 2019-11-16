var nodemailer = require('nodemailer');
var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
 
    res.render('forgetpass',{data:""});
  
});

router.post('/',function(req,res){
  userr=req.body.mail;
  var transporter = nodemailer.createTransport({
service: 'Gmail',
auth: {
    user: 'beminah1999@gmail.com',
    pass: 'min921999'
}});
  var query = conn.query("Select * from user WHERE ?", {email: userr}, (err, squests) => {
            if (err) throw err;
            else {
              var user = squests[0];
              if(user == null){
                res.render('forgetpass',{data:"Gmail này không kết nối tài khoản nào cả."});
              }
              else{
              var text="Chào bạn, Chúng tôi là QA. Đây là thứ bạn muốn: \n";
              for (var i = 0; i < squests.length; i++) {
                text+="Username: "+squests[i].username+"\n" + "Password:"+squests[i].password+"\n";
              }
              text+= "Cảm ơn vì đã truy cập hệ thống của chúng tôi!";
                let mailOptions = {
                  from: 'nhom05web@gmail.com',
                  to: userr,
                  subject: 'Mật khẩu QA của bạn',
                  text: text
                };
                transporter.sendMail(mailOptions, function(error, info){
                  if (error) {
                    console.log(error);
                  } else {
                    console.log('Email sent: ' + info.response);
                    res.redirect('/login');
                  }
                });
            }
          }
        });


});


module.exports = router;