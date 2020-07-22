// const fsPromises = require("fs").promises;
const fs = require("fs");
const path = require("path");
const webpack = require("webpack");
const CompressionWebpackPlugin = require('compression-webpack-plugin');
const productionGzipExtensions = ['js', 'css'];
// const util = require('util');
// const events = require('events');

// module.exports = new events();

// const buildPageConfig = async () => {
//
//     let pages = {};
//     let pagesPath = path.join(__dirname,"/src/pages");
//
//     let files = await fsPromises.readdir(pagesPath);
//
//     for(let file of files){
//         let filePath = path.join(pagesPath,file);
//         let page = {};
//         await fsPromises.stat(filePath).then(
//             stats => {
//                 if (stats.isDirectory()) {
//                     let entry = path.posix.join("src/pages", file,file.concat('.js'));
//                     page.entry = entry;
//                     page.template = path.posix.join("src/pages", file,file.concat('.html'));
//                     page.filename = file.concat('.html');
//                     pages[file] = page;
//                 }
//             }
//         )
//
//     }
//
//     await new Promise((resolve, reject) => {
//         let obj = {
//             publicPath : '/',
//             outputDir : './../vue-dist',
//             pages : pages
//         };
//         module.exports.emit('trigger',obj);
//     });
//
// };


// buildPageConfig();

const buildPageSync = () => {
    let pages = {};
    let pagesPath = path.join(__dirname,"/src/pages");

    let files = fs.readdirSync(pagesPath);

    for(let file of files){
        let filePath = path.join(pagesPath,file);
        let page = {};
        let stat = fs.statSync(filePath);
        if (stat.isDirectory()) {
            let entry = path.posix.join("src/pages", file,file.concat('.js'));
            page.entry = entry;
            page.template = path.posix.join("src/pages", file,file.concat('.html'));
            console.log("env--------------------------------------",process.env.NODE_ENV);
            if(process.env.NODE_ENV === "development"){
                page.filename = file.concat('.html');
            }else{
                page.filename = "../vue-pages/".concat(file,'.html');
            }
            // page.filename = file.concat('.html');
            pages[file] = page;
        }

    }

    return pages;
};

delete require.cache[module.id];

module.exports = function(){
    return {
        publicPath : '/',
        outputDir : './../vue-public',
        assetsDir : "static",
        filenameHashing : false,
        pages : buildPageSync(),
        devServer : {
            port : 8080,
            hot : true,
            open: false //是否自动打开浏览器
        },
        productionSourceMap : true, //开启后出错的时候，除错工具将直接显示原始代码，而不是转换后的代码。关闭可以减少打包体积
        configureWebpack : {
            plugins : [
                new webpack.ProvidePlugin({
                    $ : "jquery",
                    jquery : "jquery"
                }),
                new webpack.IgnorePlugin(/^\.\/locale$/, /moment$/),
                // 配置compression-webpack-plugin压缩
                new CompressionWebpackPlugin({
                    algorithm: 'gzip',
                    test: new RegExp('\\.(' + productionGzipExtensions.join('|') + ')$'),
                    threshold: 10240,
                    minRatio: 0.8
                })
            ],

            externals :{
                'vue': 'Vue',
                'vue-router': 'VueRouter',
                'vuex': 'Vuex',
                'axios': 'axios',
                'element-ui': 'ELEMENT',
                'jquery' : 'window.jQuery',
                'echarts' : 'echarts'
            }
        },
        chainWebpack: config => {
            if(process.env.NODE_ENV === 'production'){
                config
                    .plugin('webpack-bundle-analyzer')
                    .use(require('webpack-bundle-analyzer').BundleAnalyzerPlugin)
            }
        }
    }
};





