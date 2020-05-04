<template>
    <div class="zc">
        <div class="zhuce">
            <img src="../../assets/img/iphone.png" alt="">
            <mt-field  v-model="uname" class="zhuce-mt" placeholder="用户名"></mt-field>
        </div>
        <div class="zhuce">
            <img src="../../assets/img/password.png" alt="">
            <mt-field v-model="upwd" class="zhuce-mt" placeholder="密码" type="password"></mt-field>
        </div>
        <!-- <mt-button class="zhuce-button" size="large">注册</mt-button> -->
        <div class="zhuce-tk">
            <input type="checkbox">
            <span>我已阅读</span>
            <a href="">《注册条款》</a>
        </div>
        <mt-button class="zhuce-button" @click="reg">下一步</mt-button>
        <!-- <mt-button class="zhuce-button">账号登陆</mt-button> -->
    </div>
</template>
<script>
export default {
    data(){
        return{
            uname:"",
            upwd:""
        }
    },
    methods:{
        reg(){
            var n=this.uname;
            var p=this.upwd;
            var obj1={uname:n};
            var obj={uname:n,upwd:p};
            var z=/^[a-z0-9]{3,12}$/i;
            if(!z.test(n)){
            this.$toast("用户名格式不正确");
            return;  
            }
            if(!z.test(p)){
            this.$toast("密码格式不正确");
            return;
            }
            var urlLogin="user";
            this.axios.get(urlLogin,{params:obj1})
            .then(res=>{
                // console.log(res.data.code==1);
                if(res.data.code==1){
                    this.$toast("用户名被占用")
                    return;
                }else{var url="reg";
                    var obj={uname:n,upwd:p};
                    this.axios.get(url,{params:obj})
                    .then(res=>{
                    // console.log(res);
                    if(res.data.code==1){
                    this.$messagebox('提示','注册成功');
                    // 注册成功跳转
                    this.$router.push('/');
                    }
                })
                }
            });
            
        }
    },
}
</script>
<style scoped>
.zc{
    padding-top: 150px;
}
.zhuce{
    display: flex;
    text-align: center;
    border:1px solid lightgreen;
    border-radius:5px; 
    margin: 20px 10px 5px 10px;
}
.zhuce img{
    width:5%;
    margin:10px 10px;
}
.zhuce-mt{
    font-size: 18px;
    width: 95%;
    border-radius:5px;
    
}
.zhuce-tk{
    text-align: center;
}
.zhuce-tk input{
    padding-bottom:7px; 
}
.zhuce-tk span,.zhuce-tk a{
    color: #666;
    font-size: 14px;
}
.zhuce-button,.zhuce-dl-bn{
     margin-left: 10px;
    margin-top: 20px; 
}
.zhuce-button{
    width: 95%;
    border-radius:5px;
    background-image:linear-gradient(top,
    rgba(12, 201, 12, 0.74) 0%,rgba(7, 155, 7, 0.5) 100%);
}
.zhuce-dl-bn{
    width: 95%;
    height: 41px;
}
</style>