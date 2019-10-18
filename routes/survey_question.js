var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();

router.get('/', function(req, res) {
  if (req.session.user)
    res.render('survey_question', {
      session: req.session.user
    });
  else
    res.render('login', {
      data: {
        error: "Mời bạn đăng nhập!"
      }
    });
});
router.post('/', function(req, res) {
  if (req.session.user) {
    var create = req.body;
    var check = true;
    var now = Date();
    survey = {
      title: create.title,
      description: create.description,
      startdate: create.date_begin,
      enddate: create.date_end,
      isopen: 1,
      views: 0,
      author: req.session.user.username
    };
    var query = conn.query("INSERT INTO survey SET ?", survey, (err, surveys) => {
      if (err) throw err;
      else {

        var query = conn.query("SELECT * FROM survey", (err, surveys) => {
          if (err) throw err;
          else {
            res.render('main', {
              session: req.session.user,
              surveys: surveys
            });
          }
        });
      }
    });

  } else
    res.render('login', {
      data: {
        error: "Mời bạn đăng nhập!"
      }
    });
});


module.exports = router;
