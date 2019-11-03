var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {

	 if(req.session.user){
				var id = req.query.id;
				var defer = q.defer();
				var query = conn.query("SELECT * FROM survey left join squest on survey.survey_id=squest.surveysq_id WHERE ? ",{survey_id:id}, (err, num) => {
		    		if(err) {
							defer.reject(err);
						}
		    		else{
								squest=num;
								defer.resolve(num);
					  }
				});
				
					var dt = defer.promise;
						dt
						.then(function(num){
							var querysq=conn.query("SELECT * FROM textreponse inner join user_reponse on textreponse.reponse_id=user_reponse.reponse_id where ?;SELECT * FROM yesno;SELECT * from single;SELECT * from multi",{surveyid:id}, (err, ans)=>{
								if(err) throw err;
								else{
								res.render("resultsurvey",{session:req.session.user,survey:num[0],texts:ans[0],yesno:ans[1],single:ans[2],multi:ans[3]});
								}
							});
						});
					
		}
		else {
					res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
		}
});

module.exports = router;
