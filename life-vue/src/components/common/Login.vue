<template>
  <div class="app-login">
    <div class="loginLift">
      <span>LIFE</span>
      <img src="../../assets/img/login_life.png">
    </div>
    <div class="frist">
      <img src="../../assets/img/iphone.png">
      <mt-field class="" placeholder="请输入用户名" v-model="uname">
    </mt-field>
    </div>
    <div class="frist">
      <img src="../../assets/img/password.png">
      <mt-field  placeholder="请输入密码" v-model="upwd" type="password"></mt-field>
    </div>
    <mt-button @click="login" class="btn" size="large">登录</mt-button>
    <div class="dibu">
      <router-link class="dibu_a" to="/Reg">注册</router-link>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      uname:'',
      upwd:''
    }
  },
  methods:{
    login(){
      var uname=this.uname;
      var upwd=this.upwd;
      var reg=/^[a-z0-9]{3,15}$/i;
      if(!reg.test(uname)){
        this.$toast("用户名格式不正确");
        return;
      }
      if(!reg.test(upwd)){
        this.$toast("密码格式不正确");
        return;
      }
      var url="login";
      var obj={uname,upwd};
      this.axios.get(url,{params:obj})
      .then(res=>{
        // console.log(res);
        if(res.data.code==-1){
          this.$toast("用户名或密码错误");
        }else{
          this.$messagebox('提示','登录成功');
      // 登录成功跳转首页
        this.$router.push('/');
        }
      })
    
    }
  }
}
</script>
<style scoped>
  .loginLift{
    display:flex;
    flex-direction: column;
    align-items: center;
    padding:50px;
  }
  .loginLift img{
    width:50%;
  }
  .loginLift span{
    font-family:STLiti;
    font-size:45px;
  }
  .frist{
    display:flex;
    text-align: center;
    border:2px solid lightgreen;
    border-radius: 5px;
    margin:10px 10px 20px 10px;
  }
  .frist img{
    width:5%; margin:10px 10px;
  }
  .btn{
    background-image:linear-gradient(top,rgba(12, 201, 12, 0.74) 0%,rgba(7, 155, 7, 0.5) 100%);
    font-size:18px;
    width:95%;
    margin-left:10px;
    margin-top:10px;
  }
  .dibu .dibu_a{
    text-decoration: none;
    color:#444444;
    font-size:18px;
  }
  .dibu{
    margin-top:10px;
    text-align: right;
    padding:15px;
  }
</style>
