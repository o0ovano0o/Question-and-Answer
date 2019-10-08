var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');
var quest_id;
router.get('/', function (req, res) {
	if(req.session.user){
		var id = req.query.id;
		var ok = req.query.data;
		var query = conn.query("SELECT * FROM survey WHERE ?", {survey_id : id},(err, surveys) => {
			survey=surveys[0];
			if(err) throw err;
			else{
				if(ok=="success")
				 res.render('createquestion', {session: req.session.user,survey:survey,success:"Tạo thành công câu hỏi!!!"});
				else 
				res.render('createquestion', {session: req.session.user,survey:survey,success:""});
				 }
			
			});	

	}
	else
		res.render('login',{data: {error:  "Mời bạn đăng nhập!"}});
});
router.post('/', function (req, res) {
	if(req.query.id&&req.query.qtype){

		var id = req.query.id;
		var qtype = req.query.qtype;
		var n=req.body.number;
		for(var i=1;i<=n;i++)
		{	
			var quest="question" + i;
			squest = {
				survey_id : id,
				squest_text: req.body[quest],
				quest_type_id: qtype
			}
			var defer = q.defer();
			var que = conn.query("INSERT INTO squest SET ?",squest,function (err, result) {
				if(err) throw err;
				else
				{
					defer.resolve(result.insertId);
				}

			});}
			if(qtype==3||qtype==4)
				var dt=false;
			else
			{var dt = defer.promise;
			dt.then(function(number){
				if(qtype==1||qtype==2){
					for(var k=1;k<=n;k++){
						var an = req.body["ans"+k];
					for(var j=1;j<=an;j++){
						var ans="answer"+k+"_"+j;
						s_ans = {
							question_id :number,
							ans_text : req.body[ans]
						}
						var query = conn.query("INSERT INTO s_ans SET ?",s_ans, (err, ress) => {
							if(err) throw err;
							else;
						});

					}  
						number+=1;

				}
				}
				else;
			});}

		


		if(req.session.user){
			res.redirect( '/createquestion/?id='+req.query.id+"&data=success");
		}
	}

});

			module.exports = router;
