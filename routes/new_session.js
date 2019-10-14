var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');

router.get('/', function (req, res) {
	if(req.session.user){
				var id = req.query.id;
				var defer = q.defer();
				var query = conn.query("SELECT * FROM section left join aquest on section.section_id = aquest.section_id WHERE ? ",{section_id:id}, (err, num) => {
		    		if(err) {
							defer.reject(err);
						}
		    		else{
								section=num[0];
								aquest=num;
								defer.resolve(num);
					  }
				});
				
					var dt = defer.promise;
						dt.then(function(num){
							var querysq=conn.query("SELECT squest.*, s_ans.* FROM squest left join s_ans on squest.squest_id=s_ans.question_id where ?",{surveysq_id:id}, (err, squests)=>{
								if(err) throw err;
								else{
									s_ans=squests;
									res.render('test', {session:req.session.user, s_ans:s_ans});
								}
							});
						});
					
		}
		else {

			res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
		}

});
router.post('/', function (req, res) {
	var new_section = req.body;
	if(req.session.user){
		sections = {
			sec_title: new_section.sec_title,
			sec_desc: new_section.sec_desc,
			author: req.session.user.username,
			sec_time: new_section.date_begin,
			sec_pass: new_section.sec_pass,
			sec_isopen: 1
		};
		if (sections) {
				var defer1 = q.defer();
				var query1 = conn.query("INSERT INTO section SET ?", sections, function(err,results) {
					if (err) {
						defer1.reject(err);
					}
					else {
						defer1.resolve(results);
					}
				});
				var checkInsert = defer1.promise;
			}
			else {
				var checkInsert = false;
			}
			
			if (!checkInsert) {
				alert("Không thể tạo phiên");
			}
			else {
				res.render('session_interface', {session: req.session.user, sections: sections});
			}
	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
