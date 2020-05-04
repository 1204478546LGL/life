import Vue from 'vue'
import App from './App.vue'
import router from './router'
// import store from './store'
import axios from 'axios'
// import VueAwesomeSwiper from 'vue-awesome-swiper'
// Vue.use(VueAwesomeSwiper)
Vue.config.productionTip = false

// 引入第三方组件库 mint-ui
import MintUi from 'mint-ui';
// 引入mint-ui的样式文件
import 'mint-ui/lib/style.css'
// 注册
Vue.use(MintUi)

import {Swipe, SwipeItem} from 'mint-ui';

Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);

axios.defaults.baseURL="http://127.0.0.1:3000/"
axios.defaults.withCredentials=true;
// 将axios注册vue
Vue.prototype.axios=axios;

new Vue({
  router,
  // store,
  render: h => h(App)
}).$mount('#app')
                                                                                            