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
      idq=req.query.id;
      text=req.body.text;
      var cau=text.split(";");
      s_ans=[];
      id=[];
      ans=[];
      n=0;
    var cau1=[];
    var cau2=[];
    var cau3=[];
    var cau4=[];
    for(var i=0;i<cau.length;i++){
      if(cau[i].search("(1)")!=-1){
          var tn=cau[i].split("{");
          var de=tn[0];
           de=de.replace(/(?:\r\n|\r|\n)/g, '');
          var dn=tn[1].split("}");
          var str = dn[0].replace(/(?:\r\n|\r|\n)/g, '');
          var dapan=str.split("/");
          cau1.push({
              "cauhoi":de,
              "dapan":dapan,
          }); 
      }
       else if(cau[i].search("(2)")!=-1){
         var tn=cau[i].split("{");
          var de=tn[0];
          de=de.replace(/(?:\r\n|\r|\n)/g, '')
          var dn=tn[1].split("}");
          var str = dn[0].replace(/(?:\r\n|\r|\n)/g, '');
          var dapan=str.split("/");
          cau2.push({
              "cauhoi":de,
              "dapan":dapan,
          }); 
      }
       else if(cau[i].search("(3)")!=-1){
         
           cau[i]=cau[i].replace(/(?:\r\n|\r|\n)/g, '');
           cau[i]=cau[i].replace("(3)","");
            cau3.push(cau[i]);
      }
       else if(cau[i].search("(4)")!=-1){
        cau[i]=cau[i].replace(/(?:\r\n|\r|\n)/g, '');
        cau[i]=cau[i].replace("(4)","");
          cau4.push(cau[i]);
      }
    }
    
   for (var i = 0; i < cau1.length; i++) {
      var squest = {
            surveysq_id: idq,
            squest_text: cau1[i].cauhoi,
            quest_type_id: 1
          }
           var defer = q.defer();
      var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else {
              setValue(result.insertId);
              defer.resolve(result.insertId);
            }
          });
   }
   for (var i = 0; i < cau2.length; i++) {
      var squest = {
            surveysq_id: idq,
            squest_text: cau2[i].cauhoi,
            quest_type_id: 2
          }
          var defer2 = q.defer();
      var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else {
              setValue(result.insertId);
              defer2.resolve(result.insertId);
            }
          });
   }
   for (var i = 0; i < cau3.length; i++) {
      var squest = {
            surveysq_id: idq,
            squest_text: cau3[i],
            quest_type_id: 3
          }

      var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else ;
          });
   }
   for (var i = 0; i < cau4.length; i++) {
      var squest = {
            surveysq_id: idq,
            squest_text: cau4[i],
            quest_type_id: 4
          }
      var que = conn.query("INSERT INTO squest SET ?", squest, function(err, result) {
            if (err) throw err;
            else ;
          });
   }
 var dt = defer.promise;
      dt.then(function(number) {
    for (var k = 0; k < cau1.length ; k++) {
      for(var j=0;j<cau1[k].dapan.length;j++){
      s_ans={
                question_id: number,
                ans_text: cau1[k].dapan[j]};
      var query = conn.query("INSERT INTO s_ans SET ?", s_ans, (err, ress) => {
                if (err) throw err;
                else;
              });
    
    }
    number++;
  }
  });
       var dt2 = defer2.promise;
      dt2.then(function(number) {
    for (var k = 0; k < cau2.length ; k++) {
      for(var j=0;j<cau2[k].dapan.length;j++){
      s_ans={
                question_id: number,
                ans_text: cau2[k].dapan[j]};
      var query = conn.query("INSERT INTO s_ans SET ?", s_ans, (err, ress) => {
                if (err) throw err;
                else;
              });
    
    }
    number++;
  }
  });


    if(req.session.user) {
      res.redirect('/createquestions?id=' + req.query.id );
    }
    function setValue(idd){
        id.push(idd);
  }
  }

});

module.exports = router;
