var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');


router.get('/', function (req, res) {
	if(req.session.user) {
		if (req.session.user.isadmin == 1) {
			
			var id = req.query.id;
			var defer = q.defer();
			var query = conn.query("SELECT * FROM user WHERE ?", { user_id: id}, function(err, results) {
				if(err) {
					defer.reject(err);
				}
				else{
					defer.resolve(results);
				}
			});
			var dt = defer.promise;
			dt.then(function(result){
				var sections = result;
				res.render('teacher_manage', {session: req.session.user, info: sections});
			});
		}
		else {
			var id = req.query.id;
			var defer = q.defer();
			var query = conn.query("SELECT * FROM user WHERE ?", { user_id: id}, function(err, results) {
				if(err) {
					defer.reject(err);
				}
				else{
					defer.resolve(results);
				}
			});
			var dt = defer.promise;
			dt.then(function(result){
				var sections = result;
				res.render('student_manage', {session: req.session.user, info: sections});
			});
		}
		
	}
	
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

router.post('/', function (req, res) {
	var newname = req.body.newname;
	var newpass = req.body.newpass;
	var id = req.query.id;
	console.log(newpass, newname, id);
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
