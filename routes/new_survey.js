var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {

	 if(req.session.user){
				var id = req.query.id;
				var defer = q.defer();
				var query = conn.query("SELECT * FROM survey join squest on survey.survey_id=squest.surveysq_id WHERE ? ",{survey_id:id}, (err, num) => {
		    		if(err) {
							defer.reject(err);
						}
		    		else{
								survey=num[0];
								squest=num;
								defer.resolve(num);
					  }
				});

				if(req.query.qtype==3 ||req.query.qtype==4){
					var dt = false;
				}
				else{
					var dt = defer.promise;
						dt.then(function(num){
							var querysq=conn.query("SELECT * FROM s_ans ", (err, squests)=>{
								if(err) throw err;
								else{
									s_ans=squests;
									res.render('new_survey', {session:req.session.user, s_ans:s_ans});
								}
							});
						});
					}
		}
		else {

			res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
		}
});

module.exports = router;
