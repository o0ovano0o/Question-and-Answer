var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
	if(req.session.user){
		var id = req.query.id;
		var defer = q.defer();
		var query = conn.query("SELECT * FROM user left join survey on user.username= survey.author WHERE ?", { user_id: id}, function(err, results) {
			if(err) {
				throw err;
			}
			else{
				sections = results;
				res.render('teacher_manage', {session: req.session.user, info: sections});
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
