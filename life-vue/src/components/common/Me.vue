<template>
  <div class="meMess">
    <div class="frist">
      <img src="../../assets/img/touxiang.png">
      <span @click="loginLife">{{nic}}</span>
    </div>
    <p class="dingdan">我的订单</p>
    <div class="myorder">
      <div>
        <img src="../../assets/img/daifu.png">
        <span>待付款</span>
      </div>
      <div>
        <img src="../../assets/img/daipei.png">
        <span>待配送</span>
      </div>
      <div>
        <img src="../../assets/img/daishou.png">
        <span>待收获</span>
      </div>
      <div>
        <img src="../../assets/img/pingjia.png">
        <span>待评价</span>
      </div>
    </div>
    <div class="shouc">
      <img src="../../assets/img/cang.png">
      <span>收藏</span>
    </div>
    <div class="youhui">
      <img src="../../assets/img/you.png">
      <span>优惠券</span>
    </div>
    <div class="huiyuan">
      <div>
        <img src="../../assets/img/huiyuan.png">
        <span>LIFE会员</span>
      </div>
      <div>
        <img src="../../assets/img/hongbao.png">
        <span>邀请有礼</span>
      </div>
    </div>
    <div class="mytool">
      <p>联系我们</p>
      <p>在线客服: 24小时在线</p>
      <p>邮箱:764518208@qq.com</p>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      nic:"登录| 注册",
    }
  },
  created(){
    this.loadName();
  },
  methods:{
    loginLife(){
      this.$router.push('/Login');
    },
    loadName(){
      var url="username";
      this.axios.get(url)
      .then(result=>{
        // console.log(result.data);
        if(result.data.code==-1){
          this.$toast('请登录');
        }else{
          // console.log(result.data.result);
          this.nic=result.data.result[0].uname;
        }
      })
    }
  }
}
</script>
<style scoped>
  .meMess{
    padding:10px;
    margin-top:55px;
  }
  .frist,.shouc,.youhui{
    display: flex;
    padding:10px;
    align-items: center;
    font-size:20px;
    font-family:STLiti;
    background-color:#eee;
  }
  .frist span{
    font-size:40px;
  }
  .youhui{margin:10px 0;}
  .dingdan{border-bottom:1px solid #ddd;
    padding-bottom:5px;
    text-align: left;
    margin-left:10px;
  }
  .myorder{
    display:flex;
    margin:15px 0;
    justify-content: space-around;
   
  }
  .myorder div{
    display:flex;
    flex-direction: column; 
    align-items: center;
  }
  .myorder div img{
    width:30px;margin-bottom:5px;
  }
  .myorder div span{font-size:15px;}
  .frist img,.youhui img,.shouc img{
    margin:0 20px;
    width:40px;
  }
  .huiyuan{
    display:flex;
    justify-content: space-around;
    border-bottom:1px solid #ddd;
    padding-bottom:10px;
    margin-bottom:10px;
    font-size:15px;
  }
  .huiyuan div{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .huiyuan div img{
    width:40px;
    margin:10px 0;
  }
  .mytool{
    display: flex;
    flex-direction: column;
    font-size:15px;
  }
  .mytool p{margin:10px;}
</style>