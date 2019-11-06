var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
var quest_id;
router.get('/', function(req, res) {
  if (req.session.user) {
    var id = req.query.id;
    var ok = req.query.data;
    var query = conn.query("SELECT * FROM survey WHERE ?", {
      survey_id: id
    }, (err, surveys) => {
      survey = surveys[0];
      if (err) throw err;
      else {
          res.render('createquestions', {
            session: req.session.user,
            survey: survey,
          });
      }

    });

  } else
    res.render('login', {
      data: {
        error: "Mời bạn đăng nhập!"
      }
    });
});
router.post('/', function(req, res) {
  if (req.query.id) {
      id=req.query.id;
      text=req.body.text;
      var cau=text.split(";");
    for(var i=0;i<cau.length;i++){
      if(cau[i].search("(1)")!=-1){
          var tn=cau[i].split("{");
          var de=tn[0];
           de=de.replace(/(?:\r\n|\r|\n)/g, '');
          var dn=tn[1].split("}");
          var str = dn[0].replace(/(?:\r\n|\r|\n)/g, '');
          var dapan=str.split("/");
           squest = {
            surveysq_id: id,
            squest_text: de,
            quest_type_id: 1
          }
          var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else {
              for (var j = dapan.length - 1; j >= 0; j--) {
                s_ans = {
                question_id: result.insertId ,
                ans_text: dapan[j]
              }
                var query = conn.query("INSERT INTO s_ans SET ?", s_ans, (err, ress) => {
                if (err) throw err;
                else;
              });
            }
            }
          });
      }
       else if(cau[i].search("(2)")!=-1){
          var tn=cau[i].split("{");
          var de=tn[0];
           de=de.replace(/(?:\r\n|\r|\n)/g, '');
          var dn=tn[1].split("}");
          var str = dn[0].replace(/(?:\r\n|\r|\n)/g, '');
          var dapan=str.split("/");
           squest = {
            surveysq_id: id,
            squest_text: de,
            quest_type_id: 2
          }
          var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else {
              for (var j = dapan.length - 1; j >= 0; j--) {
                s_ans = {
                question_id: result.insertId ,
                ans_text: dapan[j]
              }
                var query = conn.query("INSERT INTO s_ans SET ?", s_ans, (err, ress) => {
                if (err) throw err;
                else;
              });
            }
            }
          });
      }
       else if(cau[i].search("(3)")!=-1){
         
           cau[i]=cau[i].replace(/(?:\r\n|\r|\n)/g, '');
           cau[i]=cau[i].replace("(3)","");
           squest = {
            surveysq_id: id,
            squest_text: cau[i],
            quest_type_id: 3
          }
          var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else;
          });
      }
       else if(cau[i].search("(4)")!=-1){
        cau[i]=cau[i].replace(/(?:\r\n|\r|\n)/g, '');
        cau[i]=cau[i].replace("(4)","");
           squest = {
            surveysq_id: id,
            squest_text: cau[i],
            quest_type_id: 4
          }
          var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else;
          });
      }
    }
  
    if(req.session.user) {
      res.redirect('/createquestions?id=' + req.query.id );
    }
  }

});

module.exports = router;
