var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();


router.get('/', function (req, res) {

	 if(req.session.user){
				var id = req.query.id;
				var query = conn.query("SELECT * FROM survey join squest on survey.survey_id=squest.surveysq_id WHERE ? ",{survey_id:id}, (err, surveys) => {
		    		if(err) throw err;
		    		else{
		    				survey=surveys[0];
								squest=surveys;
								s_ans=surveys;
		    				res.render('new_survey', {session: req.session.user,survey:survey, squest:squest}); }
				});
		}else res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
