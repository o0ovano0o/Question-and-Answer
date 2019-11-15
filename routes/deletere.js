var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
router.get('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var sid = req.query.sid;
      var query = conn.query("delete from survey_section WHERE section_id=? and survey_id=?", [id,sid], (err, squests) => {
            if (err) throw err;
            else {
             res.redirect('/new_session?id='+id);
            }
        });
  }
  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
