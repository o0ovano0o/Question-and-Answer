var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');
var id;

router.get('/', function (req, res) {
	if(req.session.user){
		id = req.query.id;
		var defer = q.defer();
		var query = conn.query("SELECT * FROM section left join aquest on section.section_id = aquest.sections_id WHERE  ? ",{section_id: id}, (err, results) => {
			if(err) {
				console.log("loi");
				defer.reject(err);
			}
			else{
				defer.resolve(results);
			}
		});

		var dt = defer.promise;
		dt.then(function(result){
			var sections = result;
			console.log(sections);
			res.render('session_interface', {session:req.session.user, sections: sections});
		});

	}
	else {

		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
	}

});
router.post('/', function (req, res) {
	var new_quest = req.body;
	var today = new Date();
	var date = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;
	sectionQuest = {
			sections_id: id,
			context: new_quest.context,
			author: req.session.user.username,
			date_posted: dateTime,
			view: 0
		};
	if(req.session.user){
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
			alert("Không thể tạo phiên");
		}
		else {
			res.render('rules', {session:req.session.user} );
		}
		
	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});

module.exports = router;
