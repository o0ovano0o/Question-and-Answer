var express = require('express');
var app = express();
var port = process.env.PORT || 3000;
var path = require('path');
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
var q = require('q');
var session = require('express-session');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.set('views', path.join(__dirname, 'views/pages'));
app.set('view engine', 'ejs');
app.set('trust proxy', 1);
app.use(express.static(__dirname + '/public'));

var signinUser;
app.use(session({
    secret: "secret",
    resave: false,
    saveUninitialized: true,
}));
app.use(function(req, res, next) {
   res.locals.session = req.session;
  res.locals.user = req.user;

  next();
});
var controllers = require(__dirname + '/routes/controller.js');
app.use(controllers);

app.listen(port,function(){
    console.log('Node server running')
});


