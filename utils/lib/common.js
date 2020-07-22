const fs = require("fs");
const fsPromises = require('fs').promises;
const Path = require("path");

class Common{
    constructor(){

    }

    async readPages (fileName){
        let readPath = Path.join(__dirname,"../../vue-pages/",fileName);
        let content = await fsPromises.readFile(readPath);
        return content.toString("utf-8");
    }
}


let common = new Common;

module.exports = common;