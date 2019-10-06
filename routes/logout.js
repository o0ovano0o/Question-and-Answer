var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 
var q = require('q');


router.get('/', function (req, res) {
	
	req.session.destroy(function(err) {
		if(err) {
			console.log(err);
		} else {
			res.render('login', {data:{}});
		}
	});
	

});



module.exports = router;
