var express = require('express');
var router = express.Router();

router.use('/login', require(__dirname + '/login.js'));
router.use('/home', require(__dirname + '/main.js'));
router.use('/signin', require(__dirname + '/signin.js'));
router.use('/createsession', require(__dirname + '/new_session.js'));
router.use('/session', require(__dirname + '/new_session+.js'));
router.use('/question', require(__dirname + '/new_session_plus.js'));
router.use('/createsurvey', require(__dirname + '/new_survey.js'));
router.use('/yourprofile', require(__dirname + '/student_manage.js'));
router.use('/teacher_manage', require(__dirname + '/teacher_manage.js'));
router.use('/survey', require(__dirname + '/list_survey.js'));
router.use('/support', require(__dirname + '/support.js'));
router.use('/rules', require(__dirname + '/rules.js'));
router.use('/survey_question', require(__dirname + '/survey_question.js'));

module.exports = router;

