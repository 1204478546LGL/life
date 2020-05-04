import Vue from 'vue'
import Router from 'vue-router'

import Login from './components/common/Login'
import Index from './components/Index'
import Reg from './components/common/Reg'
import Detail from './components/common/Detail'
import Cart from './components/common/Cart'

Vue.use(Router)
export default new Router({
  routes:[
    {path:'/Cart',component:Cart},
    {path:'/Detail',component:Detail},
    {path:'/Reg',component:Reg},
    {path:'/',component:Index},
    {path:'/Login',component:Login}
  ]
})