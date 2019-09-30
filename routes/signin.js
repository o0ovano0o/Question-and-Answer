var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');


router.get('/', function (req, res) {
	res.render('signin', {data: {}});
});

router.post('/', function(req, res) {
	var signup = req.body;
	
	if (true) {
		users = {
		username: signup.usernickname,
		name: signup.username,
		email: signup.useremail,
		password: signup.userpassword,
		isadmin: 0
	};

		if (users) {

			var defer = q.defer();
			var query = conn.query("INSERT INTO user SET ?", users, function(err,results) {
				if (err) {
					defer.reject(err);
				}
				else {
					defer.resolve(results);
				}
			});
			var check = defer.promise;
		}
		else {
			var check = false;
		}

		if (!check) {
			res.render('signin', {data: {error:  "Không thể tạo tài khoản"}});
		}
		else {
			res.render('login', {data: {}});
		}
	}
});

module.exports = router;