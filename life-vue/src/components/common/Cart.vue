<template>
  <div class="gwcbg">
    <div class="headcart">
      <span class="head-left">LIFE</span>
      <img class="head-right" src="../../assets/img/icon/kefu.png">
    </div>
    <!-- 顶部位置 ：全选复选框 -->
    <div class="headTitle">
      <div>
        全选
        <input type="checkbox" v-model="alls" @change="selectAll">
      </div>
      <mt-button @click="dels">删除</mt-button>
    </div>
    <!-- 中间购物车商品 -->
    <div class="cart-item" v-for="(item,i) of clist" :key="i">
      <div class="leftitem">
        <input type="checkbox" v-model="item.cb" @change="isSelect">
        <img :src="`http://127.0.0.1:3000/${item.pic}`">
        <p @click="jumpdet" :data-xlid="item.xlid">{{item.title}}</p>
        <p @click="jumpdet" :data-xlid="item.xlid">¥{{item.price.toFixed(2)}}</p>
        <input :value="item.count" type="text" class="leftitem-input">
      </div>
      <p class="btns">
        <button @click='cartAdd(i)'>＋</button>
        <button @click="cartSub(i)">－</button>
      </p>
      <mt-button @click="del" :data-xlid="item.xlid">删除</mt-button>
    </div>
    <p class="cartfoot">总价:￥{{getTotal()}}</p>
  </div>
</template>
<script>
export default {
  data(){
    return {
      clist:[],
      alls:false, //全选按钮的状态
    }
  },
  created() {
    this.add();
  },
  methods:{
    getTotal(){ //计算总价
      var total=0;
      var rows=this.clist;
      for(var i=0;i<rows.length;i++){
        // console.log(rows[i]);
        // console.log(this.clist[i].price);
        // console.log(this.clist[i].count);
        if(this.clist[i].cb){
          total+=this.clist[i].price*this.clist[i].count;
        }
      }
      // console.log(total.toFixed(2));
      return total.toFixed(2);
    },
    cartSub(i){  //数量减少
      if(this.clist[i].count>1){
        this.clist[i].count--;
      }
    },
    cartAdd(i){  //数量增加
      this.clist[i].count++;
    },
    dels(){ //选中删除 删除多个
      this.$messagebox.confirm('确定要删除选中的商品吗？')
      .then(result=>{
        var str='';
        for(var item of this.clist){
          if(item.cb){  //如果是选中的商品
            str+=item.xlid+",";
          }
        }
        // 如果没有选中商品，提示请选择要删除的商品
        if(str.length==0){
          this.$messagebox("提示","请选择要删除的商品")
          return;
        }
        // 截取到倒数第一位 不要最后一个逗号
        str=str.slice(0,-1);
        // console.log(str);
        var url="dels";
        var obj={ids:str};
        this.axios.get(url,{params:obj})
        .then(result=>{
          if(result.data.code==1){
            this.$toast("删除成功");
            this.add();
          }
        })
      })
    },
    del(e){
      // 删除指定的商品 先获xlid
      var xlid=e.target.dataset.xlid;
      // console.log(xlid)
      if(confirm("确定要删除吗？")){
        var url="delcart";
        var obj={xlid};
        // console.log(obj);
        this.axios.get(url,{params:obj})
        .then(result=>{
          console.log(result);
          if(result.data.code==1){
            this.$toast("删除成功");
            this.add();
          }
        })
      }
    },
    isSelect(){
      // 当所有商品状态为true 全选为true
      // 一个商品为false 全选为false
      this.alls=this.clist.every(function(elem,i,arr){
        return elem.cb;
      })
    },
    selectAll(){  //全选状态
      for(var item of this.clist){
        item.cb=this.alls;
      }
    },
    jumpdet(e){
      // 获取自定义属性值
      var xlid=e.target.dataset.xlid;
      this.$router.push(`/Detail?xlid=${xlid}`);
    },
    add(){
      var url='cart'
      this.axios.get(url)
      .then(result=>{
        // console.log(result.data.data);
        var rows=result.data.data;
        for(var item of rows){
          item.cb=false;
        }
        this.clist=rows;
      })
    }
  }
}
</script>
<style scoped>
  .headcart{
    background-image:linear-gradient(to top,#0cc90cbd 0%,rgba(7, 155, 7, 0.5) 100%);
    display:flex;
    justify-content:space-around; 
    padding:10px;
    width:100%;
    height:40px;
    margin:0;
  }
  .head-left{
    font-size:32px;
    color:#000;
    font-family:STLiti;
  }
  .head-right{
    height:32px;
  }
  .headTitle{
    padding:5px 0;
    display: flex;
    justify-content: space-between;
    align-items:center;
    margin: 10px;
  }
  .cart-item{
    display:flex;
    height:60px;
    justify-content: space-around;
    text-align: center;
    align-items: center;
    padding:10px;
    border-bottom:1px solid #ddd;
    border-radius:10px;
    background-color:#eeffee;
    margin: 10px;
  }
  .leftitem{
    display:flex;
    align-items: center;
  }
  .leftitem img{
    width:20%;
    margin:0 10px;
  }
  .leftitem p{
    font-size:15px;
    margin:0 7px;
  }
  .mint-button{
    font-size:15px;
    background-color:#eeffee;
    box-shadow: 2px 2px 5px 2px;
  }
  .btns{
    display: flex;
    flex-direction: column;
    margin-right: 10px;
  }
  .btns button{
    padding:0;
    margin-top:7px;
  }
  .leftitem-input{
    width:20px;
    background: #eeffee;
  }
  .cartfoot{
    /* display: flex; */
    /* justify-content: space-between; */
    /* text-align: center; */
    /* margin:0; */
    margin-right:20px;
    font-size:28px;
    font-family:STLiti;
  }
  /* .cartfoot button{
    margin-bottom:20px;
    background: #eeffee;
    border-radius: 3px;
    height:30px;
  } */
</style>