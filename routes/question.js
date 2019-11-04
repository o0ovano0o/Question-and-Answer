var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
var id;


router.get('/', function (req, res) {
	id = req.query.question_id;
	if(req.session.user){
		var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ?;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ?"
		conn.query(sql,[id, id, id, id], function(err, question) {	
			if(err) throw err;
			else{
				res.render('question_interface',{session: req.session.user, question}); } 
		});
	}
	else{
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
	}
	
});

router.post('/', function (req, res) {
	var data = req.body;
	var today = new Date();
	var dateTime = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();

	if(req.session.user){
		if (req.query.cmt == 0) {
			cmt = {
			question_id: id,
			author: req.session.user.username,
			content: data.cmt,
			ans_time: dateTime	
			};
			var query1 = conn.query("INSERT INTO ans_quest SET ?", cmt, function(err,results) {
				if (err) {
					throw(err);
				}
				else {
					var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ?;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ?"
					conn.query(sql,[id, id, id, id], function(err, question) {	
						if(err) throw err;
						else{
							res.render('question_interface',{session: req.session.user, question}); } 
					});
				}
			});
		}
		else if (req.query.cmt > 0) {
			ans_cmt = {
				question_id: id,
				ans_id: req.query.cmt,
				author: req.session.user.username,
				cmt: data.cmt_ans,
				cmt_time: dateTime
			};
			var query1 = conn.query("INSERT INTO cmt_ans SET ?", ans_cmt, function(err,results) {
				if (err) {
					throw(err); 
				}
				else {
					var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ?;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ?"
					conn.query(sql,[id, id, id, id], function(err, question) {	
						if(err) throw err;
						else{
							res.render('question_interface',{session: req.session.user, question}); } 
					});
				}
			});
		}
	}
	else{
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
	}
});


module.exports = router;
