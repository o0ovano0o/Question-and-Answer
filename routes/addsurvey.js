var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');

router.get('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
      var query = conn.query("select * from survey WHERE ? ", {author: req.session.user.username}, (err, result) => {
            if (err) throw err;
            else {
             res.render('addsurvey',{session: req.session.user, result,id:id}); } 
            
        });
  }

  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});
router.post('/', function (req, res) {
  if(req.session.user) {
     var id = req.query.id;
     var sid= req.body.ids;
     if(Array.isArray(sid)){
     for (var i = 0; i < sid.length; i++) {
      ss = {
        section_id:id,
        survey_id:sid[i]
      };
        
      var query = conn.query("insert into survey_section set ?",ss, (err, squests) => {
            if (err) throw err;
            else;
        });
     }
   }
   else{
     ss = {
        section_id:id,
        survey_id:sid
      };
     
     var query = conn.query("insert into survey_section set ?",ss, (err, squests) => {
            if (err) throw err;
            else;
        });
     }
   res.redirect('/new_session?id='+id );
  }

  else{
    res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
  }
});


module.exports = router;
