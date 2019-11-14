var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');
var id;

router.get('/', function (req, res) {
	if(req.session.user){
		id = req.query.id;
		var sql = "SELECT * FROM section join user on section.author = user.username  WHERE  section_id = ?;SELECT * FROM section left join aquest on section.section_id = aquest.sections_id join user on aquest.author = user.username  WHERE section_id =  ? order by question_id DESC;SELECT * FROM `survey_section` INNER JOIN survey on survey.survey_id=survey_section.survey_id where section_id = ? ;"
		conn.query(sql,[id,id,id], function(err, results) {	
			if(err) throw err;
			else{
				var sections = results;
				res.render('session_interface', {session:req.session.user, sections: sections});
			}
		});
	}
	else {

		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
	}

});
router.post('/', function (req, res) {
	var new_quest = req.body;
	var today = new Date();
	var dateTime = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();
	
	var id=req.query.id;
	if(req.session.user){
		sectionQuest = {
		sections_id: id,
		context: new_quest.context,
		author: req.session.user.username,
		date_posted: dateTime,
		view: 0
	};
		if (sectionQuest) {
			var defer1 = q.defer();
			var query1 = conn.query("INSERT INTO aquest SET ?", sectionQuest, function(err,results) {
				if (err) {
					defer1.reject(err);
				}
				else {
					defer1.resolve(results);
				}
			});
			var checkInsert = defer1.promise;
		}
		else {
			var checkInsert = false;
		}

		if (!checkInsert) {
			alert("Không thể tạo câu hỏi");
		}
		else {
			 res.redirect('/new_session?id='+id);
		}
		
	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
