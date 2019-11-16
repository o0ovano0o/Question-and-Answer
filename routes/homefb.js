var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
const passport = require('passport');

router.get('/',function(req,res){
	req.session.user=req.user;
	user=req.user;
	users = {
		username: user.username,
		name: user.username,
		email: user.useremail,
		password: 'fb',
		date: '',
		isadmin: 0
	};
	var defer = q.defer();
		var query = conn.query("SELECT * FROM user WHERE ?", {username: user.username}, function(err,results) {
			if (err) {
				defer.reject(err);
			}
			else {
				defer.resolve(results);
			}
		});
		var dt = defer.promise;
		dt.then(function(usercheck){
		var userr = usercheck[0];

		if (userr != null) {
					var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by survey_id DESC;SELECT * FROM section join user on user.username = section.author Order by section_id DESC;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id  Order by section_id DESC",  (err, surveys) => {
				      if(err) throw err;
				      else{
				        res.render('main',{session: req.session.user, surveys}); } 
				      });
			}
		else  {

			if (users) {
				console.log(users);
				var query1 = conn.query("INSERT INTO user SET ?", users, function(err,results) {
					if (err) {
						throw(err);
					}
					else {
						var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by survey_id DESC;SELECT * FROM section join user on user.username = section.author Order by section_id DESC;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id  Order by section_id DESC",  (err, surveys) => {
				      if(err) throw err;
				      else{
				        res.render('main',{session: req.session.user, surveys}); } 
				      });
					}
				});
			}
		}
	});
});

module.exports = router;




