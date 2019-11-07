var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.post('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var ids= req.query.ids;
     var sql="update squest set `squest_text`='"+req.body.title+"' where `squest_id`="+ids;

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
