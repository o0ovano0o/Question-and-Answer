var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.get('/', function (req, res) {
	if(req.session.user){
		ans_id = req.query.ans_id;
		id = req.query.question_id;
		type = req.query.type;
		if (ans_id) {
			var query = "UPDATE ans_quest SET ghim = ? WHERE ans_id = ?";
			conn.query(query, [type, ans_id], function(err, result) {	
				if (err) {
					throw(err);
				}
				else {
					var sql = "SELECT * FROM aquest join user on aquest.author = user.username  WHERE question_id =  ?;SELECT * FROM aquest  join section on section.section_id = aquest.sections_id join user on section.author = user.username WHERE question_id = ?;SELECT * FROM ans_quest join user on ans_quest.author = user.username  WHERE question_id =  ? order by ghim desc;SELECT * FROM cmt_ans join user on cmt_ans.author = user.username  WHERE question_id =  ?"
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

router.post('/', function (req, res) {
	var pass = req.body.QuestionPass;
	var id = req.query.id;
	var query = "SELECT * FROM section WHERE section_id = ?";
		conn.query(query, [id], function(err, result) {	
			if (err) {
				throw(err);
			}
			else {
				if (result[0].sec_pass == pass) {
					var sql = "SELECT * FROM section join user on section.author = user.username  WHERE  section_id = ?;SELECT * FROM section left join aquest on section.section_id = aquest.sections_id join user on aquest.author = user.username  WHERE section_id =  ?"
					conn.query(sql,[id,id], function(err, results) {	
						if(err) throw err;
						else{
							var sections = results;
							res.render('session_interface', {session:req.session.user, sections: sections});
						}
					});
				}
				else {
					var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by startdate DESC;SELECT * FROM section join user on user.username = section.author;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id",  (err, surveys) => {
					if(err) throw err;
					else{
						res.render('main',{session: req.session.user, surveys}); } 
					});
				}
			}
		});

});


module.exports = router;
