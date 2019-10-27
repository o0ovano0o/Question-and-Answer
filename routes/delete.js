var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
router.get('/', function(req, res) {
  if (req.session.user) {
    var ids = req.query.ids;
    var query = conn.query("DELETE FROM squest WHERE ? ", {squest_id: ids}, (err, num) => {
      if (err) {throw err;}
			else {
        //  res.header("Location: ");
        res.render('test', {session:req.session.user, squest});
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
