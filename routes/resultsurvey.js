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
								survey=num[0];
								squest=num;
								defer.resolve(num);
					  }
				});
				
					var dt = defer.promise;
						dt.then(function(num){
							var querysq=conn.query("SELECT * FROM textreponse inner join user_reponse on textreponse.reponse_id=user_reponse.reponse_id where ?",{surveyid:id}, (err, texts)=>{
								if(err) throw err;
								else{
									
									res.render('resultsurvey', {session:req.session.user, texts,squest:num});
								}
							});
						});
					
		}
		else {

			res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
		}
});
module.exports = router;
