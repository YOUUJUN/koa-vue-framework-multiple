import Vue from 'vue'
import Home from './Developer.vue'
import store from '../../store/index'
import lib from '../../utils/lib'
import ElementUI from 'element-ui'
// import {Dropdown,DropdownMenu,DropdownItem,Button} from "element-ui"
import "element-ui/lib/theme-chalk/index.css"

/*---element-ui---*/
Vue.use(ElementUI);


let bus = new Vue;
Vue.prototype.$bus = bus;

Vue.prototype.$common = lib.common;

Vue.config.productionTip = false;

Vue.prototype.$axios = lib.axios;

new Vue({
  store,
  render: h => h(Home)
}).$mount('#app');



