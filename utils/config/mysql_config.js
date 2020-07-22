let password = process.env.NODE_ENV !== 'production' ? "" : "KHIS302.";

const config = {
    connectionLimit : 10,
    host : 'localhost',
    user :'root',
    password : password,
    port : '3306',
    database : 'ycsoft',
    multipleStatements: true
};
module.exports = config;
