var express = require('express');
const passport = require('passport');
var app = express();
var port = process.env.PORT || 3000;
var path = require('path');
var bodyParser = require('body-parser');
var jsonParser = bodyParser.json();
var q = require('q');
var FacebookStrategy = require('passport-facebook').Strategy;
var session = require('express-session');
const config = require('./routes/config');
passport.serializeUser(function(user, done) {
  done(null, user);
});

passport.deserializeUser(function(obj, done) {
  done(null, obj);
});

// Sử dụng FacebookStrategy cùng Passport.
passport.use(new FacebookStrategy({
    clientID: config.facebook_key,
    clientSecret:config.facebook_secret ,
    callbackURL: config.callback_url,
     profileFields: ['id','displayName','email','first_name','last_name','middle_name']
  },
function(accessToken, refreshToken, profile, done) {
    process.nextTick(function () {
      
       user={
						user_id : profile.id,
                        name : profile.displayName,
                        username: profile.emails[0].value,
                        email : profile.emails[0].value, 
                        isadmin:0
}
console.log(user);
      return done(null, user);
    });
  }
));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.set('views', path.join(__dirname, 'views/pages'));
app.set('view engine', 'ejs');
app.set('trust proxy', 1);
app.use(express.static(__dirname + '/public'));

app.use(session({
    secret: "secret",
    resave: false,
    saveUninitialized: true,
    cookie: {secure: false}
}));
app.use(passport.initialize());
app.use(passport.session());
app.use(function(req, res, next) {
   res.locals.session = req.session;
  res.locals.user = req.user;
	next();
});
var survey;
var controllers = require(__dirname + '/routes/controller.js');
app.use(controllers);
app.listen(port,function(){
    console.log('Node server running')
});


