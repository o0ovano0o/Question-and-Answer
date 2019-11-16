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
					  res.redirect('/new_session?id='+id);
				}
				else {
					 res.redirect('/home');
				}
			}
		});

});


module.exports = router;
