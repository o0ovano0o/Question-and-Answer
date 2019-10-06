var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.get('/', function (req, res) {
    if(req.session.user) 
   { 
   signinUser=req.session.user;	
   var defer = q.defer();
	var query = conn.query("SELECT * FROM surveys ", {username: signin.username}, function(err,results) {
		if (err) {
			defer.reject(err);
		}
		else {
			defer.resolve(results);
		}
	});
	var dt = defer.promise;
	dt.then(function(surveys){
		var user = users[0];
		res.render('main',{signinUser:signinUser,surveys:surveys});
	});
	}else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;