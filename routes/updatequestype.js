var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.post('/', function (req, res) {
  if(req.session.user) {

     var id = req.query.id;
     var ids= req.query.ids;
     var type = req.query.type;
     var num = req.body.numans;
     var sql="update squest set `squest_text`='"+req.body.title+"' where `squest_id`="+ids;
     var query = conn.query(sql, (err, squests) => {
        if (err) throw err;
        else {
        }
     });

     if(type==1 ||type ==2){
   	   var query = conn.query("DELETE from s_ans where ?", {question_id: ids}, (err, sans) => {
   		    if (err) throw err;
   		    else {

          }
   	   });


        for (var j = 1; j <= num; j++) {
             var ans = "answer" + type + "_" +ids+"_"+ j;

             s_ans = {
               question_id: ids ,
               ans_text: req.body[ans],
               number: type
             }
             if(s_ans.ans_text!=""){
               var query = conn.query("INSERT INTO s_ans SET ?", s_ans, (err, ress) => {
                 if (err) throw err;
                 else{}
               });
             }
        }
      }
      res.redirect('/survey?id=' + req.query.id );


  }
  else
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});

});




module.exports = router;
