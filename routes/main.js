var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');

router.get('/', function (req, res) {
	if(req.session.user) {
		var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by survey_id DESC;SELECT * FROM section join user on user.username = section.author Order by section_id DESC;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id",  (err, surveys) => {
			if(err) throw err;
			else{

				res.render('main',{session: req.session.user, surveys}); } 
			});
	}

	else{
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
	}
});
router.post('/', function (req, res) {
	var create = req.body;
	if(req.session.user){
		if(req.query.type==1){
			var now = new Date();
			sections = {
			sec_title: create.sec_title,
			sec_desc: create.sec_desc,
			author: req.session.user.username,
			sec_time: now,
			sec_pass: create.sec_pass,
			sec_isopen: 1
			};
			if (sections) {
				var query1 = conn.query("INSERT INTO section SET ?", sections, function(err,results) {
					if (err) {
						throw err; 
					}
					else {
						 res.redirect('/home');
					}
				});
			}
		}
		else
		{
			var now = new Date();
			survey = {
			title: create.title,
			description: create.description,
			startdate: now,
			isopen: 1,
			views: 0,
			author: req.session.user.username
			};
			var query = conn.query("INSERT INTO survey SET ?", survey, (err, surveys) => {
				if (err) throw err;
				else {

					res.redirect('/home');
				}
			});

		}

	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});


module.exports = router;