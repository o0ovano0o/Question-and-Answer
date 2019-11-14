var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.post('/', function (req, res) {
	if(req.session.user){
		var cmt_id = req.query.cmt_id;
		var ans_id = req.query.ans_id;
		var id = req.query.question_id;
		if (cmt_id) {
			cmt = req.body.suacmt;
			var query = "UPDATE cmt_ans SET cmt = ? WHERE cmt_id = ?";
			conn.query(query, [cmt, cmt_id], function(err, result) {	
				if (err) {
					throw(err);
				}
				else {
					var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ? order by ans_quest.ghim desc,ans_quest.ans_id asc;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ? order by cmt_ans.cmt_id asc"
					conn.query(sql,[id, id, id, id], function(err, question) {	
						if(err) throw err;
						else{
							res.render('question_interface',{session: req.session.user, question}); } 
						});
				}
			});
		}
		else if (ans_id) {
			var content = req.body.suaans;
			var query = "UPDATE ans_quest SET content = ? WHERE ans_id = ?";
			conn.query(query, [content, ans_id], function(err, result) {	
				if (err) {
					throw(err);
				}
				else {
					var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ? order by ans_quest.ghim desc,ans_quest.ans_id asc;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ? order by cmt_ans.cmt_id asc"
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
