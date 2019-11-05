var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
router.get('/', function(req, res) {
  if (req.session.user) {
    var ids = req.query.ids;
    var id = req.query.id;
    var query = conn.query("DELETE FROM squest WHERE ? ", {squest_id: ids}, (err, num) => {
      if (err) {throw err;}
			else {
        //  res.header("Location: ");
        var defer = q.defer();
        var query = conn.query("SELECT * FROM survey left join squest on survey.survey_id=squest.surveysq_id WHERE ? ", {survey_id: id}, (err, num) => {
          if (err) {defer.reject(err);}
    			else {
            survey = num[0];
            squest = num;
            defer.resolve(num);
          }
        });

        var dt = defer.promise;
        dt.then(function(num) {
    	      var query = conn.query("UPDATE survey SET views=views+1 WHERE ?", {survey_id: id}, (err, squests) => {
    		        if (err) throw err;
    		        else {}
    	      });
    	      var querysq = conn.query("SELECT squest.*, s_ans.* FROM squest left join s_ans on squest.squest_id=s_ans.question_id where ?", {surveysq_id: id}, (err, squests) => {
    		        if (err) throw err;
    		        else {
    		          s_ans = squests;
    		          res.render('test', {
    		            session: req.session.user,
    		            s_ans: s_ans,
                    survey: num[0],
                    squest : num,
    		          });}
    	      });
        });
      }
    });
  }
	else {
    res.render('login', {
      data: {error: "Mời bạn đăng nhập!"}
    });
  }
});
module.exports = router;
