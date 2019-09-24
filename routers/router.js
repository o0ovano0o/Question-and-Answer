module.exports = function(app) {  
    app.get('/signin', function (req, res) {
            res.sendfile('./views/signin.html');
        })
    app.get('/login', function (req, res) {
      res.sendfile("./views/login.html");
    });
     app.get('/yourprofile', function (req, res) {
      res.sendfile("./views/student_manage.html");
    });
      app.get('/createsession', function (req, res) {
      res.sendfile("./views/new_session.html");
    });
       app.get('/session', function (req, res) {
      res.sendfile("./views/new_session++.html");
    });
        app.get('/home', function (req, res) {
      res.sendfile("./views/main.html");
    });
         app.get('/createsurvey', function (req, res) {
      res.sendfile("./views/new_survey.html");
    });
          app.get('/question', function (req, res) {
      res.sendfile("./views/new_session_plus.html");
    });
      
}