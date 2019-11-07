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
					var query = conn.query("SELECT * FROM survey Order by startdate DESC;SELECT * FROM section",  (err, surveys) => {
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
						var query = conn.query("SELECT * FROM survey Order by startdate DESC;SELECT * FROM section",  (err, surveys) => {
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




