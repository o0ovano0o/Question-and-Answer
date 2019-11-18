var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function(req, res) {
  if (req.session.user) {
    var id = req.query.id;
    var defer = q.defer();
    var query = conn.query("SELECT * FROM survey left join squest on survey.survey_id=squest.surveysq_id WHERE ? ", {survey_id: id}, (err, num) => {
      if (err) {defer.reject(err);}
			else {
        survey = num[0];
        if(!survey){
          res.redirect('oop');
        }
        else{
        squest = num;
        defer.resolve(num);
      }
      }
    });

    var dt = defer.promise;
    dt.then(function(num) {
	      var query = conn.query("UPDATE survey SET views=views+1 WHERE ?", {survey_id: id}, (err, squests) => {
		        if (err) throw err;
		        else {}
	      });
       var numb=0
        var query = conn.query("SELECT * from user_reponse where surveyid=? and user_id=?", [id,req.session.user.user_id], (err, ress) => {
            if (err) throw err;
            else {
              if(ress.length<=0||req.session.user.isadmin){
                var querysq = conn.query("SELECT squest.*, s_ans.* FROM squest left join s_ans on squest.squest_id=s_ans.question_id where ?;SELECT count(*) as total FROM `squest` GROUP BY `surveysq_id` having ?", [{surveysq_id: id},{surveysq_id: id}], (err, squests) => {
                    if (err) throw err;
                    else {
                      s_ans = squests[0];
                      numb=squests[1];
                      res.render('test', {
                        session: req.session.user,
                        s_ans: s_ans,
                        check:0,
                        numb:numb,
                      });}
                });
              }
              else {
                res.render('test', {
                        session: req.session.user,
                        check:1,
                        numb:0,
                      });
              }
            }
        });
	      
    });
  }
	else {
    res.render('login', {
      data: {error: "Mời bạn đăng nhập!"}
    });
  }
});


router.post('/', function(req, res) {
  if (req.session.user) {
    var defer = q.defer();
    var id = req.query.id;
    var answers = req.body;
    var query = conn.query("SELECT * FROM squest WHERE ? ", {surveysq_id: id,}, (err, quests) => {
	      if (err) {defer.reject(err);}
				else {defer.resolve(quests);}
    });
    var dt = defer.promise;
    dt.then(function(squest) {
      var now = new Date();
      ureponse = {
	        surveyid: id,
	        user_id: req.session.user.user_id,
	        reponse_date: now
      }
      var query = conn.query("INSERT INTO  user_reponse SET ? ", ureponse, (err, resp) => {
        if (err) {
          throw err;
        } else {
          for (var i = 0; i < squest.length; i++) {
            var name = squest[i].quest_type_id + "_" + squest[i].squest_id;
            var type = squest[i].quest_type_id;
            if (type == 4) {
	              console.log(i);
	              text = answers[name];
	              textreponse = {
		                reponse_id: resp.insertId,
		                quest_id: squest[i].squest_id,
		                textreponse: text
	              }
	              var query = conn.query("INSERT INTO  textreponse SET ?", textreponse, (err, quests) => {
		                if (err) {throw err;}
										else {console.log("4-insert sucesss");}
	              });
            }
            if (type == 3) {
	              truefalse = answers[name];
	              yesnoreponse = {
		                reponse_id: resp.insertId,
		                quest_id: squest[i].squest_id,
		                yesnovalue: truefalse
	              }
	              var query = conn.query("INSERT INTO  yesnoreponse SET ?", yesnoreponse, (err, quests) => {
	                if (err) {throw err;} else {console.log("3-insert sucesss");}
	              });
            }
            if (type == 1) {
              ans_id = answers[name];
              reponse = {
                reponse_id: resp.insertId,
                quest_id: squest[i].squest_id,
                choice_id: ans_id
              }
              var query = conn.query("INSERT INTO  singlechoicereponse SET ?", reponse, (err, quests) => {
                if (err) {
                  throw err;
                } else {
                  console.log("1-insert sucess");
                }
              });
            }
            if (type == 2) {
              ans_idd = answers[name];
              reponse = {
                reponse_id: resp.insertId,
                quest_id: squest[i].squest_id
              }
              var query = conn.query("INSERT INTO  multichoices SET ?", reponse, (err, quests) => {
                if (err) {
                  throw err;
                } else {
                  console.log("21-insert sucesss");
                }
              });
              if(ans_idd[0]>10){
              for (var j = 0; j < ans_idd.length; j++) {
                ans = {
                  response_id: resp.insertId,
                  quest_id: squest[i].squest_id,
                  ans_id: ans_idd[j]
                }
                console.log(ans_idd);
                var query = conn.query("INSERT INTO  choice_multichoices SET ?", ans, (err, resss) => {
                  if (err) {
                    throw err;
                  } else {
                    console.log("22-insert sucesss");
                    console.log(ans_idd[j]);
                  }
                });

              }
            }
            else{
               ans = {
                  response_id: resp.insertId,
                  quest_id: squest[i].squest_id,
                  ans_id: ans_idd
                }
                console.log(ans_idd);
                var query = conn.query("INSERT INTO  choice_multichoices SET ?", ans, (err, resss) => {
                  if (err) {
                    throw err;
                  } else {
                    console.log("22-insert sucesss");
                    console.log(ans_idd);
                  }
                });
            }
            }
          }
        }
      });
    });
    res.redirect('/survey?id=' + req.query.id );
  }
	else {
    res.render('login', {data: {error: "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
