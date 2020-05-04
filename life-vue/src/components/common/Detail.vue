<template>
  <div>
    <!-- 详情页添加购物车 -->
    <mt-swipe :auto="0" class="page"  >
      <mt-swipe-item v-for="(item,i) of listDetail" :key="i"><img class="detail" :src="`http://127.0.0.1:3000/${item.pic}`" alt=""></mt-swipe-item>
    </mt-swipe>
    <div class="desc-title">
      <h3>{{titleDetail}} 300g/盒</h3>
      <p>每日采摘，空运到店，新鲜美味</p>
      <p ><mt-badge size="small" color="orange">迎新价</mt-badge>￥{{priceDetail.toFixed(2)}}</p>
      <div class="desc-text">
        <span class="detail">--详情·DETAIL--</span>
        <p>产地<span>四川成都</span></p>
        <p>净重<span>1kg</span></p>
        <p>储存<span>冷藏</span></p>
      </div>
    </div>
    <p class="recommond">--推荐·RECOMMEND--</p>
    <div class="list">
      <div class="group" v-for="(items,i) of listDets" :key="i" @click="changes">
        <router-link :to="'/detail?xlid='+items.xlid">
          <img :src="`http://127.0.0.1:3000/${items.pic}`" alt="">
          <p>{{items.title}}</p>
          <p class="price">欢迎选购</p>
        </router-link>
      </div>
    </div>
    <div class="btns">
      <img class="houtui" @click="houtuiclick" src="../../assets/img/houtui.png" alt="">
      <mt-button @click="addCart">加入购物车</mt-button>
      <mt-button @click="chang">查看购物车</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      xlid:this.$route.query.xlid,
      listDetail:[],
      titleDetail:'',
      priceDetail:0,
      listDets:[],   //下面详情页的
    }
  },
  created() {
    this.loadDetail();
  },
  methods:{
    chang(){
      var url='cart';
      this.axios.get(url)
      .then(result=>{
        if(result.data.code==-2){
          this.$toast('请登录');
          this.$router.push('/Login');
        }else{
          this.$router.push('/Cart');
        }
      }) 
    },
    // 添加购物车
    addCart(){
      var xlid=this.xlid;
      var title=this.titleDetail;
      var price=this.priceDetail;
      var pic=this.listDetail[1].pic;
      var url="addcart";  
      var obj={xlid,title,price,pic}
      this.axios.get(url,{params:obj})
      .then(result=>{
        // console.log(result.data);
        if(result.data.code==-2){
          this.$messagebox("提示","请登录");
          this.$router.push('/Login');
        }else{
          this.$toast('添加成功');
        }
      })
    },
    houtuiclick(){
      this.$router.push('/'); //首页
    },
    changes(){
      this.$router.go('/Detail');
    },
    loadDetail(){
      // console.log(this.xlid);
      // console.log(1);
      var url="detail";
      var obj={xlid:this.xlid};
      this.axios.get(url,{params:obj})
      .then(result=>{
        // console.log(result.data.data);
        this.listDetail=result.data.data;
        // console.log(this.listDetail[0].title);
        this.titleDetail=this.listDetail[0].title;
        this.priceDetail=this.listDetail[0].price;
        // 下面详情页的
        var urls="product";
        var objs={flid:this.listDetail[0].flid}
        this.axios.get(urls,{params:objs})
        .then(result=>{
          // console.log(result.data.data);
          this.listDets=result.data.data.splice(5);
          // console.log(this.listDets);
        })
      })
    },
  }
}
</script>
<style scoped>
  .houtui{
    width:20%; height:100%;
    margin:0 15px;
  }
  .page{
    width:100%;
    height:350px;
  }
  .mint-swipe-items-wrap div.is-active[data-v-6b7ffeb5]{
    background:#e7eef05b;
  }
  .detail{
    width:100%;
    display: block;
    margin: 0 auto;
  }
  .desc>h3{
    margin-top:0;
    margin-bottom:0;
  }
  .price{
    color: darkslategrey;
  }
  .s1{
    display: inline-block;
  }
  .desc-title{
    padding: 10px;
  }
  h3{
    margin:0;
  }
  .desc-text{
    background-color:#e7eef05b;
    border-radius: 3px;
    padding: 5px;
  }
  .desc-text>p{
    color:darkgray;
  }
   .desc-title>p{
     color:orangered
   }
  span.detail,.recommond{
    font-weight:bold;
    text-align: center
  }  
  .desc-text>p>span{
    color: initial;
    margin-left: 45px;
  }
  .group img{
    width: 48%;
    height: 50%;
  }
  .group a{
    text-decoration: none;
    color: initial
  }
  .group span{
    margin-top: 0;
    text-align: left;
    color:initial
  }
.group{
  width: 49%;
  text-align: center;
}
.list{
    display: flex;
    flex-wrap: wrap;
    margin-bottom:50px;
  }
.group .price{
    color: orangered
  }
.mint-button{
  color:orangered;
  width:45%;
  margin-right:25px;
  background:#eeffee;
}
.btns{
  display: flex; 
  position:fixed;
  bottom:1px;
}
</style>