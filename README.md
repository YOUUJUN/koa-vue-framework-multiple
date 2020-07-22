# Vue-Koa-Multiple-development
## 项目目录：
    .
    |-ycsoft_koa_new
      |-bin
      |-controler #Koa控制层，json接口返回数据，页面跳转 
      |-database #数据存储层，储存服务器运行和报错log、用户图片
      |  |-.pm2#服务器log
      |  |-cache
      |  |-expose
      |  |  |-user-images
      |  |  |-users
      |  |  |  |-9271af90-a4a3-11ea-9ee1-d525ae67413d
      |  |  |  |  |-drafts
      |  |  |  |  |  |-article
      |  |  |  |  |  |-doc
      |  |  |  |  |-images
      |  |  |  |  |  |-articles
      |  |  |  |  |  |-portraits
      |-middlewares #路由层 控制路由
      |-service #业务层 实现操作层controller的耦合封装、（被我转移到utils里，包括可能有的数据层model）
      |-utils #真实业务层
      |  |-config #后台配置文件(数据库配置，爬虫登录状态配置)
      |  |-db #数据库
      |  |-lib #工具类
      |  |-pages #多页面应用，基于页面的业务处理
      |-views #后台渲染页面（404页面）可有可无
      |-vue-pages #Vue打包后的html文件
      |-vue-public #Vue打包后的静态目录
      |-web #Vue前端开发目录
      |  |-public #不参与打包
      |  |-src
      |  |  |-assets
      |  |  |-components #基于应用的组件封装
      |  |  |-pages
      |  |  |  |-article
      |  |  |  |  |-private #基于页面的组件封装
      |  |  |  |-community
      |  |  |  |  |-private
      |  |  |-router
      |  |  |-store
      |  |  |-utils
	  |  |  |  |-config.js #前台配置文件（ajax地址）
	  |  |  |  |-http.js #axios
	  |  |  |  |-lib.js # 前台js库
      |  |-babel.config.js
      |  |-package-lock.json
      |  |-package.json
	  |  |-.env.devbuild #前台环境变量配置文件
      |  |-vue.config.js #Vue 打包配置文件
      |-.gitattributes #修改项目内容展示
      |-.gitignore
      |-app.js #Koa起始文件
      |-ecosystem.config.js #PM2配置文件
      |-nginx.conf #Nginx服务器配置文件（Nginx反向代理 3000端口到80端口，开启gzip）
      |-package-lock.json
      |-package.json
      |-README.md


## 项目指令：
项目初始化：
`cd ./`

`npm install`

`cd web`

`npm install`

开启本地webpack dev server,运行端口8080
`npm run serve`

本地模拟生产环境打包：
`npm run dev-build`

生产环境打包：
`npm run build`

`cd ..`

开启本地测试接口koa服务,运行端口3000
`npm run dev`

开启服务器生产服务器
`npm run prd`


## 项目示例[>>项目链接戳我<<](http://106.13.63.236/community ">>项目链接戳我<<")


