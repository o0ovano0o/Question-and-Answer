var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var query = conn.query("update survey set isopen=0 WHERE ?", {survey_id: id}, (err, squests) => {
            if (err) throw err;
            else {
            }
        });
    var query = conn.query("SELECT * FROM survey Order by startdate DESC;SELECT * FROM section;",  (err, surveys) => {
      if(err) throw err;
      else{
      res.render('main',{session: req.session.user, surveys});
      }
      });
  }

  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
