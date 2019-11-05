var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
	if(req.session.user){
		var id = req.query.id;
		var query = conn.query("SELECT * FROM survey join user on user.username= survey.author WHERE ?", { user_id: id}, function(err, results) {
			if(err) {
				throw err;
			}
			else{
				console.log(results);
				res.render('teacher_manage', {session: req.session.user, info: results});
			}
		});
		// var dt = defer.promise;
		// dt.then(function(results){
		// 	var sections = results;
		// 	res.render('teacher_manage', {session: req.session.user, info: sections});
		// });
	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
