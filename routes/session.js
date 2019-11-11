var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.post('/', function (req, res) {
	if(req.session.user){
		cmt_id = req.query.cmt_id;
		ans_id = req.query.ans_id;
		console.log(cmt_id, ans_id);
	}
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
