var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.get('/', function (req, res) {
	if(req.session.user) {
		if (req.session.user.isadmin == 0) {
			res.render('student_manage', {session: req.session.user});
		}
		else {
			res.render('teacher_manage', {session: req.session.user});
		}
		
	}
	
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
