var express = require('express');
var router = express.Router();

router.use('/login', require(__dirname + '/login.js'));
router.use('/', require(__dirname + '/main.js'));
router.use('/signin', require(__dirname + '/signin.js'));
router.use('/new_session', require(__dirname + '/new_session.js'));
router.use('/new_session+', require(__dirname + '/new_session+.js'));
router.use('/new_session_plus', require(__dirname + '/new_session_plus.js'));
router.use('/new_survey', require(__dirname + '/new_survey.js'));
router.use('/student_manage', require(__dirname + '/student_manage.js'));
router.use('/teacher_manage', require(__dirname + '/teacher_manage.js'));


module.exports = router;

