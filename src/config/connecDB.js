import configDB from "./configDB"
import mysql from "mysql"

var con = mysql.createConnection({
    host: configDB.host,
    user: configDB.user,
    password: configDB.password,
    port: configDB.port,
    database: configDB.database,
});
con.connect(function (err) {
    if (err) throw err;
    console.log("Connected!");
});

module.exports = con
