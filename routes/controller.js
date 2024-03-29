var express = require('express');
const passport = require('passport');
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
router.get('/auth/facebook', passport.authenticate('facebook',{scope:'email'}));

router.get('/auth/facebook/callback',
  passport.authenticate('facebook',
   { successRedirect : '/homefb', failureRedirect: '/login' }));


router.get('/homefb',isLoggedIn,function(req,res){

	user=req.user;
	id=req.query.id;
	users = {
		user_id:user.id,
		username: user.username,
		name: user.name,
		email: user.email,
		password: 'fb',
		date: '',
		isadmin: 0
	};
	var defer = q.defer();
		var query = conn.query("SELECT * FROM user WHERE ?", {email :user.email}, function(err,results) {
			if (err) {
				defer.reject(err);
			}
			else {
				defer.resolve(results);
			}
		});
		var dt = defer.promise;
		dt.then(function(usercheck){
		var userr = usercheck[0];

		if (userr != null) {
					var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by survey_id DESC;SELECT * FROM section join user on user.username = section.author Order by section_id DESC;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id  Order by section_id DESC",  (err, surveys) => {
				      if(err) throw err;
				      else{
				      	userscheck = {
							user_id:userr.user_id,
							username: user.username,
							name: user.name,
							email: user.email,
							password:user.photo,
							date: '',
							isadmin: 0
						};
						req.session.user=userscheck;
				        res.render('main',{session: req.session.user, surveys}); }
				      });
			}
		else  {

			if (users) {
				console.log(users);
				var query1 = conn.query("INSERT INTO user SET ?", users, function(err,results) {
					if (err) {
						throw(err);
					}
					else {
						var query = conn.query("SELECT * FROM survey JOIN user on user.username = survey.author Order by survey_id DESC;SELECT * FROM section join user on user.username = section.author Order by section_id DESC;SELECT * from section JOIN aquest on section.section_id = aquest.sections_id LEFT JOIN ans_quest on ans_quest.question_id = aquest.question_id LEFT join cmt_ans on cmt_ans.ans_id = ans_quest.ans_id  Order by section_id DESC",  (err, surveys) => {
				      if(err) throw err;
				      else{
				      	userscheck = {
							user_id:results.insertId,
							username: user.username,
							name: user.name,
							email: user.email,
							password:user.photo,
							date: '',
							isadmin: 0
						};
						req.session.user=userscheck;
				        res.render('main',{session: req.session.user, surveys}); }
				      });
					}
				});
			}
		}
	});
});
router.get(
  '/auth/google',
  passport.authenticate('google', {
    scope: ['profile', 'email']
  })
);
router.use('/sendmail', require(__dirname + '/sendmail.js'));
router.use('/oop', require(__dirname + '/oop.js'))
router.get('/auth/google/callback', passport.authenticate('google', { successRedirect : '/homefb', failureRedirect: '/login' }));
router.use('/login', require(__dirname + '/login.js'));
router.use('/home', require(__dirname + '/main.js'));
router.use('/thongbao', require(__dirname + '/thongbao.js'));
router.use('/signin', require(__dirname + '/signin.js'));
router.use('/deletesection', require(__dirname + '/deletesection.js'));
router.use('/addsurvey', require(__dirname + '/addsurvey.js'));
// router.use('/createsession', require(__dirname + '/new_session.js'));
router.use('/ghim', require(__dirname + '/ghim.js'));
router.use('/session', require(__dirname + '/session.js'));
router.use('/new_session', require(__dirname + '/new_session.js'));
router.use('/question', require(__dirname + '/question.js'));
router.use('/delete', require(__dirname + '/delete.js'));
router.use('/deletere', require(__dirname + '/deletere.js'));
router.use('/deletes', require(__dirname + '/deletes.js'));
router.use('/survey', require(__dirname + '/new_survey.js'));
router.use('/resultsurvey', require(__dirname + '/resultsurvey.js'));
router.use('/yourprofile', require(__dirname + '/yourprofile.js'));
router.use('/closesurvey', require(__dirname + '/closesurvey.js'));
router.use('/resurvey', require(__dirname + '/resurvey.js'));
router.use('/deletesurvey', require(__dirname + '/deletesurvey.js'));
router.use('/deleteqa', require(__dirname + '/deleteqa.js'));
router.use('/closeqa', require(__dirname + '/closeqa.js'));
router.use('/openqa', require(__dirname + '/openqa.js'));
router.use('/upsec', require(__dirname + '/upsec.js'));
router.use('/updatesurvey', require(__dirname + '/updatesurvey.js'));
router.use('/student_manage', require(__dirname + '/student_manage.js'));
router.use('/updatequestype', require(__dirname + '/updatequestype.js'));
router.use('/teacher_manage', require(__dirname + '/teacher_manage.js'));
router.use('/survey_list', require(__dirname + '/list_survey.js'));
router.use('/support', require(__dirname + '/support.js'));
router.use('/rules', require(__dirname + '/rules.js'));
router.use('/createsurvey', require(__dirname + '/survey_question.js'));
router.use('/createquestion', require(__dirname + '/createquestion.js'));
router.use('/createquestions', require(__dirname + '/createquestions.js'));
router.use('/logout', require(__dirname + '/logout.js'));

function isLoggedIn(req, res, next) {
	if(req.isAuthenticated()){
		return next();
	}

	res.redirect('/login');
}
module.exports = router;
