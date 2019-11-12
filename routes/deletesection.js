var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.get('/', function (req, res) {
	if(req.session.user){
		var cmt_id = req.query.cmt_id;
		var ans_id = req.query.ans_id;
		var id = req.query.question_id;
		var section_id = req.query.section_id;
		if (!cmt_id && !ans_id && id) {
			var query = "DELETE FROM aquest WHERE question_id = ?;DELETE FROM ans_quest WHERE question_id = ?;DELETE FROM cmt_ans WHERE question_id = ?";
			conn.query(query, [id,id,id], function(err, result) {	
				if (err) {
					throw(err);
				}
				else {
					var sql = "SELECT * FROM section join user on section.author = user.username  WHERE  section_id = ?;SELECT * FROM section left join aquest on section.section_id = aquest.sections_id join user on aquest.author = user.username  WHERE section_id =  ?"
					conn.query(sql,[section_id,section_id], function(err, results) {	
						if(err) throw err;
						else{
							var sections = results;
							res.render('session_interface', {session:req.session.user, sections: sections});
						}
					});
				}
			});
		}
		else if (cmt_id) {
			var query = "DELETE FROM cmt_ans WHERE cmt_id = ?";
			conn.query(query, [cmt_id], function(err, result) {	
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
		else if (ans_id) {
			var query = "DELETE FROM ans_quest WHERE ans_id = ?;DELETE FROM cmt_ans WHERE ans_id = ?";
			conn.query(query, [ans_id,ans_id], function(err, result) {	
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