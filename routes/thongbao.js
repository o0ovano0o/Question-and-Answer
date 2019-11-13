var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 


router.get('/', function (req, res) {
	
	 if(req.session.user){
	 	var query = conn.query("SELECT * FROM tbao WHERE ? order by date DESC;",{user:req.session.user.username}, (err, num) => {
		    		if(err) {
					
							defer.reject(err);

						}
		    		else{
		    	
								res.render('thongbao', {session: req.session.user,tbao:num});
					  }
				});
	
}
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
