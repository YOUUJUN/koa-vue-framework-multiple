export default {

    getTimeDif (timer){
        var date = new Date(timer);
        var newDate = new Date();
        var str = '';

        var dif = newDate.getTime() - date.getTime();
        //计算出相差天数
        var days=Math.floor(dif/(24*3600*1000));

        //计算出小时数
        var leave1=dif%(24*3600*1000); //计算天数后剩余的毫秒数
        var hours=Math.floor(leave1/(3600*1000));
        //计算相差分钟数
        var leave2=leave1%(3600*1000); //计算小时数后剩余的毫秒数
        var minutes=Math.floor(leave2/(60*1000));
        //计算相差秒数
        var leave3=leave2%(60*1000); //计算分钟数后剩余的毫秒数
        var seconds=Math.round(leave3/1000);
        if(seconds == 0 && minutes == 0 && hours == 0 && days == 0){
            str = '刚刚';
        }else if(minutes == 0 && hours == 0 && days == 0){
            str = seconds + '秒前';
        }else if(hours == 0 && days == 0){
            str = minutes + '分钟前';
        }else if(days == 0){
            str = hours + '小时前';
        }else if(days > 0){
            str = days + '天前';
        }

        return str;
    },
    getHash (){
        let path = window.location.pathname.split("/");
        let postId = path.pop();
        return postId;
    },

    getHrefHead (){
        let path = window.location.pathname.split("/");
        console.log("path",path);
        let head = '/' + path[1];
        console.log("head ==>",head);
        return head;
    },

    getUserInfo (){
        let userData = window.localStorage.getItem("userData");
        userData = JSON.parse(userData);
        return userData;
    },

    setCookie (cname,cvalue,exdays){
        var d = new Date();
        d.setTime(d.getTime()+(exdays*24*60*60*1000));
        var expires = "expires="+d.toGMTString();
        document.cookie = cname+"="+cvalue+"; "+expires;
    },
    getCookie(cname){
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for(var i=0; i<ca.length; i++) {
            var c = ca[i].trim();
            if (c.indexOf(name)==0) { return c.substring(name.length,c.length); }
        }
        return "";
    },
    checkCookie(){
        var user=getCookie("username");
        if (user!=""){
            alert("欢迎 " + user + " 再次访问");
        }
        else {
            user = prompt("请输入你的名字:","");
            if (user!="" && user!=null){
                setCookie("username",user,30);
            }
        }
    },

    delCookie(cname) {
        var cvalue = this.getCookie(cname);
        document.cookie = 'marscript='+cvalue+';expires=Thu, 01 Jan 1970 00:00:00 GMT'
    },

    getLocalStorageMaxRoom() {
        if(!window.localStorage) {
            console.log('当前浏览器不支持localStorage!')
        }

        var test = '0123456789';

        var add = function(num) {
            num += num;
            if(num.length == 10240) {
                test = num;
                return;
            }
            add(num);
        }
        add(test);

        var sum = test;

        var show = setInterval(function(){
            sum += test;
            try {
                window.localStorage.removeItem('test');
                window.localStorage.setItem('test', sum);
                console.log(sum.length / 1024 + 'KB');
            } catch(e) {
                alert(sum.length / 1024 + 'KB超出最大限制');
                clearInterval(show);
            }

        }, 0.1)

    }

};