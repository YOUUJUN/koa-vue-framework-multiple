//上传文件处理
const Path = require("path");
const fs = require("fs");
const fsPromise = require("fs").promises;


const tools = new (require("./tools"))();

class Uploader{
    constructor(ctx){
        this.ctx = ctx;
    }

    saveAs(savePath,limitSize){
        const defaultSizeLimit = 5 * 1048576;
        let ctx = this.ctx;
        let file = ctx.request.files[0];

        let cacheFileState = fs.statSync(file.path);
        let size = cacheFileState.size;
        let sizeLimit = limitSize || defaultSizeLimit;
        if(size > sizeLimit){
            console.log("图片大小超过限制");
            return false;
        }

        let foarmatedSize = tools.formatBytes(size);


        let typeCache = file.mimetype.split("/");
        let fileType = typeCache[1];
        let randomFileName = Math.random().toString().concat(".",fileType);
        let finalPath = Path.join(savePath,randomFileName);

        let readStream = fs.createReadStream(file.path);
        let writeStream = fs.createWriteStream(finalPath);
        readStream.pipe(writeStream);

        return randomFileName;
    }


    /*
    * options : {
    *   path : "",
    *   name : "",
    *   content : ""
    * }
    *
    *
    * */
    saveDraft(options){
        const splitFixer = "@!@";
        let combineName = options.content.topic.concat(splitFixer,options.content.title,splitFixer,options.name);
        console.log("combineName======",combineName);
        let readStream = fs.createReadStream(options.content.content);
        let finalPath = Path.join(options.path,combineName);
        let writeStream = fs.createWriteStream(finalPath);
        console.log("writeStream-=-=-=-=",writeStream);
        readStream.pipe(writeStream);
        console.log("done");

        return finalPath;
    }

}

module.exports = Uploader;







