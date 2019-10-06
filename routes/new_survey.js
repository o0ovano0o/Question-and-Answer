var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 


router.get('/', function (req, res) {
	
	 if(req.session.user)
	res.render('new_survey', {session: req.session.user});
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});
router.get('/:id', function (req, res) {
	if(req.session.user)
	{	var id=req.pramas.id;
		 var query = conn.query("SELECT * FROM survey WHERE  ?",survey_id:id, (err, surveys) => {
	    if(err) throw err;
	    else{
	    res.render('list_survey',{session: req.session.user,surveys:surveys}); } 
	});
	}
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});
module.exports = router;
