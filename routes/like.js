var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection(); 

router.get('/', function (req, res) {
	var id = req.query.id;
	var type = req.query.type;
	
	console.log(id,type);
	
});
module.exports = router;
