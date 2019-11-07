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
       res.redirect('/survey?id=' + req.query.id );
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
