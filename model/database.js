var mysql = require('mysql');

var connection = mysql.createConnection({
	multipleStatements: true,
	host: "localhost",
	user: "root",
	password: "",
	database: "questionandanswer"
});
connection.connect();

function getConnection() {
	if (!connection) {
		connection.connect();
	}
	return connection;
}
function getSurvey() {
	var query = connection.query("SELECT * FROM survey", (err, surveys) => {
    if(err) throw err;
    else{
    return surveys; }
});
}
module.exports = {
	getConnection: getConnection,
	getSurvey: getSurvey
}