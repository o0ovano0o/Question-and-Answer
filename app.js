const path = require('path');
const express = require('express');
const hbs = require('hbs');
const bodyParser = require('body-parser');
const mysql=require('mysql');
const app = express();
 var router = require('./routers/router.js');
const hostname = 'localhost';
const port = 3000;
const db = mysql.createConnection({
  hostname: hostname,
  user: 'root',
  password: '',
  database: 'questionandanswer'
});
db.connect((err)=> {
  if(err) throw err;
  console.log('Mysql connected');
});


app.set('views',path.join(__dirname,'views'));
app.set('view engine', 'hbs');

app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: false }));
router(app);



app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});