module.exports = {
    apps : [
        {
            name : "ycsoft_koa",
            script : "./bin/www",
            watch: true,
            error_file : "./database/.pm2/err.log",
            out_file : "./database/.pm2/out.log",
            ignore_watch : ['node_modules','database','web'],
            env : {
                "NODE_ENV" : "development",
            },
            env_production : {
                "NODE_ENV" : "production"
            }
        }
    ]
};