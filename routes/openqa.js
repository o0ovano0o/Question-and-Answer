var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var query = conn.query("update section set sec_isopen=1 WHERE ?", {section_id: id}, (err, squests) => {
            if (err) throw err;
            else {
            }
        });
      res.redirect('/home');
  }

  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
