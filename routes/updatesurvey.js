var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.post('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var sql="update survey set `title`='"+req.body.title+"', `description`='"+ req.body.des+"' where `survey_id`="+id;
     
      var query = conn.query(sql, (err, squests) => {
            if (err) throw err;
            else {
             res.redirect('/survey?id='+id );
            }
        });
  }

  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
