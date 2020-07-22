const mysql = require("mysql");
const MYSQL_CONFIG = require("../../config/mysql_config");

const pool = mysql.createPool(MYSQL_CONFIG);

console.log('---------------------连接池连接数:-------------------',pool._allConnections.length);

const query = (sql, val) => {
    return new Promise((resolve, reject) => {
        pool.getConnection(function (err, connection) {
            if(err){
                reject(err);
            }else{
                connection.query(sql, val, (err, fields) => {
                    if(err){
                        reject(err)
                    }else {
                        resolve(fields);
                        connection.release();
                    }
                })
            }
        })
    })
};

module.exports = query;



