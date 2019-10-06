var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');

router.get('/', function (req, res) {


    if(req.session.user) 
{ 	 var query = conn.query("SELECT * FROM survey", (err, surveys) => {
    if(err) throw err;
    else{
    res.render('main',{session: req.session.user,surveys:surveys}); } 
});
    }
	
	else{
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
}
});

module.exports = router;