<template>
  <div>
    <!-- 顶部 -->
    <div class="head">
      <span class="head-left">LIFE</span>
      <img class="head-right" src="../assets/img/icon/kefu.png">
    </div>
    <!-- 子面板 -->
    <mt-tab-container v-model="active">
      <!-- 首页 -->
      <mt-tab-container-item id="shouye">
        <carousel></carousel>
      </mt-tab-container-item>
      <!-- 商品分类 -->
      <mt-tab-container-item id="menu">
       <product></product>
      </mt-tab-container-item>
      <!-- 购物车 -->
      <mt-tab-container-item id="gouwuche">
        <cart></cart>
      </mt-tab-container-item>
      <!-- 我的 -->
      <mt-tab-container-item id="me">
        <me></me>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 底部导航栏 -->
    <div class="fonterdiv"></div>
    <mt-tabbar fixed v-model="active">
      <mt-tab-item id="shouye">
        <img v-if="active=='shouye'" slot="icon" src="../assets/img/icon/s_shouye.png">
        <img v-else slot="icon" src="../assets/img/icon/shouye.png">
        首页
      </mt-tab-item>
      <mt-tab-item id="menu">
        <img v-if="active=='menu'" slot="icon" src="../assets/img/icon/s_menu-s.png">
        <img v-else slot="icon" src="../assets/img/icon/menu-s.png">
        商品分类
      </mt-tab-item>
      <mt-tab-item id="gouwuche">
        <img v-if="active=='gouwuche'" slot="icon" src="../assets/img/icon/s_gouwuche.png">
        <img v-else slot="icon" src="../assets/img/icon/gouwuche.png">
        购物车
      </mt-tab-item>
      <mt-tab-item id="me">
        <img v-if="active=='me'" slot="icon" src="../assets/img/icon/s_me.png">
        <img  v-else slot="icon" src="../assets/img/icon/me.png">
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
import {swiper,swiperSlide} from 'mint-ui'
import Cart from './common/Cart'
import Me from './common/Me'
import Product from './common/Product'
import Carousel from './common/Carousel'

export default {
  data(){
    return {
      active:'shouye',
    }
  },
  // 注册子组件 在模板中引入
  components:{Cart,Me,Product,Carousel}
}
</script>
<style scoped>
/* 顶部导航样式*/
  .head{
    background-image:linear-gradient(to top,#0cc90cbd 0%,rgba(7, 155, 7, 0.5) 100%);
    display:flex;
    justify-content:space-around; 
    padding:10px;
    position: fixed;
    z-index:10;
    width:100%;
  }
  .head-left{
    font-size:32px;
    color:#000;
    font-family:STLiti;
  }
  .head-right{
    height:32px;
  }
  /* 中间 */
  .p{
    width:100%;height:300px;
  }
  .p img{width:100%;height:100%;}
  /* 底部导航栏样式 */
  /* 选中颜色 */
  .mint-tabbar > .mint-tab-item.is-selected{
    background-color:transparent;
    color:#45c018;
  }
  /* 默认颜色 */
  .mint-tab-item{
    color:#999999;
    font-weight:bold;
  }
  .fonterdiv{height:40px;}
</style>