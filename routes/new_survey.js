var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 


router.get('/', function (req, res) {
	
	 if(req.session.user){
		var id = req.query.id;
		var query = conn.query("SELECT * FROM survey WHERE ?",{survey_id:id}, (err, surveys) => {
	    if(err) throw err;
	    else{
	    survey=surveys[0];
	    res.render('new_survey', {session: req.session.user,survey:survey}); } 
	});
	
	}
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
