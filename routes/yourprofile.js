var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');


router.get('/', function (req, res) {
	if(req.session.user) {
		var id = req.query.id;
		var query1 = conn.query("SELECT * FROM user WHERE ?", {user_id: id}, function(err,results) {
			if (err) {
				throw(err);
			}
			else {
				var user = results[0];

				if (user.isadmin == 1) {
					var sql = "SELECT * FROM user WHERE user_id = ?;SELECT * FROM user join section on section.author = user.username WHERE user.user_id = ?;SELECT * FROM user join survey on survey.author = user.username WHERE user.user_id = ?;SELECT * FROM user join ans_quest on ans_quest.author = user.username WHERE user.user_id = ?;SELECT * FROM user join cmt_ans on cmt_ans.author = user.username WHERE user.user_id = ?;";
					conn.query(sql,[id, id, id, id, id], function(err, result) {	
						if(err) throw err;
						else{
							res.render('teacher_manage', {session: req.session.user, info: result});
						}
					});
				}
				else {
					var sql = "SELECT * FROM user WHERE user_id = ?;SELECT * FROM user join aquest on aquest.author = user.username WHERE user.user_id = ?;SELECT * FROM user join ans_quest on ans_quest.author = user.username WHERE user.user_id = ?;SELECT * FROM user join cmt_ans on cmt_ans.author = user.username WHERE user.user_id = ?;";
					conn.query(sql,[id, id, id, id], function(err, result) {	
						if(err) throw err;
						else{
							res.render('student_manage', {session: req.session.user, info: result});
						}
					});
				}
			}

		});
	}

	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

router.post('/', function (req, res) {
	var newname = req.body.newname;
	var newpass = req.body.newpass;
	var id = req.query.id;
	var query1 = "UPDATE user SET name = ?, password = ? WHERE user.user_id = ?";
	conn.query(query1,[newname, newpass, id], function(err, question) {	
		if (err) {
			throw(err);
		}
		else {
			req.session.user.name = newname;
			req.session.user.password = newpass;
			var query = conn.query("SELECT * FROM survey Order by startdate DESC;SELECT * FROM section",  (err, surveys) => {
				if(err) throw err;
				else{
					res.render('main',{session: req.session.user, surveys}); } 
				});
		}
	});
});

module.exports = router;
