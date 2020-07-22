import Vue from 'vue'
import Vuex from 'vuex'

import lib from '../utils/lib';
Vue.use(Vuex);

Vue.prototype.$axios = lib.axios;

let vm = new Vue;


export default new Vuex.Store({
  state: {
    logged : false,

    navigationList : [
      {
        name : "首页",
        href : "/",
      },
      {
        name : "产品与服务",
        href : "/products",
      },
      {
        name : "开发文档",
        href : "/guide",
      },
      {
        name : "联系我们",
        href : "/contact",
      },
      {
        name : "开发平台",
        href : "http://erp.bfcgj.com/login.html",
        target : "_blank"
      },
      {
        name : "社区",
        href : "/community"
      }
    ]


  },

  getters : {


  },

  mutations: {
    changeLogStatus(state, status){
      vm.$set(state,"logged",status);
    },

    upDateNavigationIndex (state,payload){
      let naviArr = state.navigationList;
      if(payload == "/personal" || payload == "/topics" || payload == "/users" || payload == "/topicList" || payload == "/editor"){
        payload = "/community";
      }

      for(let item of naviArr){
        if(payload == item.href){
          item.active = "nav-current";
        }
      }

      state.navigationList = naviArr;

    },

  },
  actions: {

    getUserLogStatus (){
      vm.$axios({
        method : "post",
        url : "verifyToken"
      }).then(value =>{
        console.log("value ====-====",value);
        this.commit("changeLogStatus",value.data.logged);
      }).catch(err => {
        console.log(err);
      })
    }

  },
  modules: {




  }
})
