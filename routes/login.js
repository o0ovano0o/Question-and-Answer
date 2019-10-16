var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function(req, res) {

  res.render('login', {
    data: {}
  });

});

router.post('/', function(req, res) {
  var signin = req.body;
  if (signin.username) {
    var defer = q.defer();
    var query = conn.query("SELECT * FROM user WHERE ?", {
      username: signin.username
    }, function(err, results) {
      if (err) {
        defer.reject(err);
      } else {
        defer.resolve(results);
      }
    });
    var dt = defer.promise;
  } else {
    var dt = false;
  }

  dt.then(function(users) {
    var user = users[0];
    if (user == null) {
      res.render('login', {
        data: {
          error: "Tài khoản hoặc mật khẩu không đúng"
        }
      });
    } else if (user.password == signin.userpassword) {
      req.session.user = user;
      var query = conn.query("SELECT * FROM survey", (err, surveys) => {
        if (err) throw err;
        else {
          res.render('main', {
            session: req.session.user,
            surveys: surveys
          });
        }
      });

    } else {
      res.render('login', {
        data: {
          error: "Tài khoản hoặc mật khẩu không đúng"
        }
      });
    }
  });
});

module.exports = router;
