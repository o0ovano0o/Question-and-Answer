var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');

router.get('/', function (req, res) {
	if(req.session.user) {
		var query = conn.query("SELECT * FROM survey;SELECT * FROM section",  (err, surveys) => {
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
			sections = {
			sec_title: create.sec_title,
			sec_desc: create.sec_desc,
			author: req.session.user.username,
			sec_time: create.date_begin,
			sec_pass: create.sec_pass,
			sec_isopen: 1
			};
			if (sections) {
				var defer1 = q.defer();
				var query1 = conn.query("INSERT INTO section SET ?", sections, function(err,results) {
					if (err) {
						defer1.reject(err);
					}
					else {
						defer1.resolve(results);
					}
				});
				var checkInsert = defer1.promise;
			}
			else {
				var checkInsert = false;
			}

			if (!checkInsert) {
				alert("Không thể tạo phiên");
			}
			else {
				var query = conn.query("SELECT * FROM survey;SELECT * FROM section",  (err, surveys) => {
					if(err) throw err;
					else{
						res.render('main',{session: req.session.user, surveys}); } 
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
			enddate: create.date_end,
			isopen: 1,
			views: 0,
			author: req.session.user.username
			};
			var query = conn.query("INSERT INTO survey SET ?", survey, (err, surveys) => {
				if (err) throw err;
				else {

					var query = conn.query("SELECT * FROM survey;SELECT * FROM section", (err, surveys) => {
						if (err) throw err;
						else {
							res.render('main', {
								session: req.session.user,
								surveys: surveys
							});
						}
					});
				}
			});

		}

	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});


module.exports = router;