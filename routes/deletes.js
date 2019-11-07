var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
router.post('/', function(req, res) {
  if (req.session.user) {
    var id = req.query.id;
    var ids=req.body.del;
    for (var i = 0; i < ids.length; i++) {
      ids[i]
       var query = conn.query("DELETE FROM squest WHERE ? ", {squest_id: ids[i]}, (err, num) => {
      if (err) {throw err;}
      else;});
    }
   res.redirect('/survey?id=' + req.query.id );
  }
	else {
    res.render('login', {
      data: {error: "Mời bạn đăng nhập!"}
    });
  }
});
module.exports = router;
