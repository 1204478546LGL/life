<template>
  <div class="container">
    <!-- <h3>轮播图</h3> -->
    <mt-swipe :auto="3000" class="p">
      <mt-swipe-item class="s1"><img src="../../assets/img/banner/banner1.jpg"></mt-swipe-item>
      <mt-swipe-item class="s1"><img src="../../assets/img/banner/banner2.jpg"></mt-swipe-item>
      <mt-swipe-item class="s1"><img src="../../assets/img/banner/banner3.jpg"></mt-swipe-item>
      <mt-swipe-item class="s1"><img src="../../assets/img/banner/banner4.jpg"></mt-swipe-item>
    </mt-swipe>
    <p class="text">小生活,欢迎你</p>
    <div class="menu" @mouseenter="load" >
      <div v-for="(item,i) of list" :key="i">
        <router-link :to="'/detail?xlid='+item.xlid">
          <img class="menu-item" :src="`http://127.0.0.1:3000/${item.pic}`" alt="">
        </router-link>
      </div>
    </div>
    <p class="text"><a href="">热销产品</a></p>
    <mt-swipe :auto="0" class="slide" :show-indicators="false" >
      <mt-swipe-item v-for="(item,i) of list" :key="i">
        <img :src="`http://127.0.0.1:3000/${item.pic}`" >
        <p class="text-decoration">生活秒杀</p>
      </mt-swipe-item>
    </mt-swipe>
    <div class="fontdiv"></div>
  </div>
</template>
<script>
export default {
  data(){
    return{
       topStatus: '',
       list:[]
    }
  },
  created(){
    this.load();
  },
  methods: {
      handleTopChange(status) {
        this.topStatus = status;
      },
      load(){
        var url="product";
        var obj={flid:10};
        this.axios.get(url,{params:obj})
        .then(result=>{
          // console.log(result.data.data);
          this.list.push(result.data.data[2],result.data.data[1],result.data.data[8],result.data.data[9],result.data.data[10],result.data.data[3]);
          // console.log(this.list);
        }) 
      }
    }
}
</script>
<style scoped>
.container{
  background-color:rgb(209, 236, 209);
  margin-top:55px;
}
.p{
  height:350px;
}
.s1{
  width: 100%;
  height: 100px;
}
.p img{
  width: 100%;
  height:300px;
  margin:0 auto;
}
.text{
  text-align: center;
  font-size:16px;
  color:grey; 
}
.slide{
  height:300px;
  width: 360px;
  margin:0 auto;
}
.slide img{
  width: 90%;
  height:75%;
  border-radius: 2rem;
}
.menu{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
.menu-item{
  width:100%;
  height: 100%;
  border-radius: 50%;
}
.menu div{
  width:30%;
  padding:5px;
}
.text-decoration,a{
  text-decoration: none;
  text-align: center;
  color:green;
}
</style>