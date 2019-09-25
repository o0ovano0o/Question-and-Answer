var express = require('express');
var app = express();
var port = process.env.PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', './views/pages');
app.set('trust proxy', 1);
app.use(express.static(__dirname + '/public'));


var controllers = require(__dirname + '/routes/controller.js');
app.use(controllers);

app.listen(port,function(){
    console.log('Node server running')
});


