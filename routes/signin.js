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
	var check = true;


	users = {
		username: signup.usernickname,
		name: signup.username,
		email: signup.useremail,
		password: signup.userpassword,
		date: signup.date,
		isadmin: 0,
		tbao:0,
	};

	if (signup.mauser=='123456') users.isadmin=1;
	if (signup.usernickname) {
		var defer = q.defer();
		var query = conn.query("SELECT * FROM user WHERE ?", {username: signup.usernickname}, function(err,results) {
			if (err) {
				defer.reject(err);
			}
			else {
				defer.resolve(results);
			}
		});
		var dt = defer.promise;
	}
	else {
		var dt = false;
	}

	dt.then(function(usercheck){
		var user = usercheck[0];

		if (user != null) {
				res.render('signin', {data: {error:  "Tài khoản đã tồn tại"}});
			}
		else  {

			if (users) {
				console.log(users);
				var query1 = conn.query("INSERT INTO user SET ?", users, function(err,results) {
					if (err) {
						throw(err);
					}
					else {
						res.render('login', {data: {message: "Tạo tài khoản thành công"}});
					}
				});
			}
		}
	});
});

module.exports = router;
