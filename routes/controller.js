var express = require('express');
var router = express.Router();

router.use('/login', require(__dirname + '/login.js'));
router.use('/home', require(__dirname + '/main.js'));
router.use('/signin', require(__dirname + '/signin.js'));
// router.use('/createsession', require(__dirname + '/new_session.js'));
router.use('/session', require(__dirname + '/session.js'));
router.use('/new_session', require(__dirname + '/new_session.js'));
router.use('/question', require(__dirname + '/question.js'));
router.use('/delete', require(__dirname + '/delete.js'));
router.use('/deletes', require(__dirname + '/deletes.js'));
router.use('/survey', require(__dirname + '/new_survey.js'));
router.use('/resultsurvey', require(__dirname + '/resultsurvey.js'));
router.use('/yourprofile', require(__dirname + '/yourprofile.js'));
router.use('/closesurvey', require(__dirname + '/closesurvey.js'));
router.use('/resurvey', require(__dirname + '/resurvey.js'));
router.use('/deletesurvey', require(__dirname + '/deletesurvey.js'));
router.use('/updatesurvey', require(__dirname + '/updatesurvey.js'));
router.use('/student_manage', require(__dirname + '/student_manage.js'));
router.use('/updatequestion', require(__dirname + '/updatequestion.js'));

router.use('/teacher_manage', require(__dirname + '/teacher_manage.js'));
router.use('/survey_list', require(__dirname + '/list_survey.js'));
router.use('/support', require(__dirname + '/support.js'));
router.use('/rules', require(__dirname + '/rules.js'));
router.use('/createsurvey', require(__dirname + '/survey_question.js'));
router.use('/createquestion', require(__dirname + '/createquestion.js'));
router.use('/createquestions', require(__dirname + '/createquestions.js'));
router.use('/logout', require(__dirname + '/logout.js'));

module.exports = router;
