var express = require('express')
var router = express.Router();
var db = require('../model/database');
var conn = db.getConnection();
var q = require('q');
var id;

router.get('/', function (req, res) {
	cmt_id = req.query.cmt_id;
	ant_id = req.query.ans_id;
	console.log(cmt_id, ans_id);
});