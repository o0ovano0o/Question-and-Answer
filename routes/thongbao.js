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
		    					var query = conn.query("UPDATE `tbao` SET `seen`=1 WHERE ?",{user:req.session.user.username}, (err, num) => {
							    		if(err) {
										
												defer.reject(err);

											}
							    		else;
									});
								req.session.user.tbao=0;
								res.render('thongbao', {session: req.session.user,tbao:num});
					  }
				});
	
}
	else
	res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
