<template>
    <div class="fl">
        <div class="ceyList">
            <div @click="shucai">
                <span>蔬菜</span>
            </div>
            <div @click="shuiguo">
                <span>水果</span></div>
            <div @click="jiushui">
                <span>酒水</span>
                </div>
            <div @click="richang">
                <span>日常用品</span>
                </div>
            </div>
        <div class="cezList">
            <div v-if="shuc==true"  class="shucai">
                <div class="cezList_a">
                    <img src="../../assets/img/shucai/baicai1.jpg" alt="">
                </div>
                <div class="cezList_b1" v-for="(item,i) of list" :key="i" >
                    <router-link :to="'/detail?xlid='+item.xlid">
                        <img :src="`http://127.0.0.1:3000/${item.pic}`" alt="">
                    </router-link>
                    <p>{{item.title}}</p>
                </div>
            </div>
            <div v-else-if="shuig==true" class="shuiguo">
                <div class="cezList_a">
                    <img src="../../assets/img/fruits/cherry2.jpg" alt="">
                </div>
                <div class="cezList_b1"
                v-for="(item,i) of list" :key="i">
                    <router-link :to="'/detail?xlid='+item.xlid">
                    <img :src="`http://127.0.0.1:3000/${item.pic}`" alt="">
                    </router-link> 
                    <p>{{item.title}}</p>
                </div>
            </div>
            <div v-else-if="jius==true" class="js">
                <div class="cezList_a">
                    <img src="../../assets/img/banner/banner3.jpg" alt="">
                </div>
                <div class="cezList_b1" v-for="(item,i) of list" :key="i">
                    <router-link :to="'/detail?xlid='+item.xlid">
                        <img :src="`http://127.0.0.1:3000/${item.pic}`" alt=""> 
                    </router-link> 
                    <p>{{item.title}}</p>
                </div>
            </div>
            <div v-else class="rc">
                <div class="cezList_a">
                    <img src="../../assets/img/daliyuse/huazhuanghe1.jpg" alt="">
                </div>
                <div class="cezList_b1" v-for="(item,i) of list" :key="i">
                    <router-link :to="'/detail?xlid='+item.xlid">
                        <img :src="`http://127.0.0.1:3000/${item.pic}`" alt=""> 
                    </router-link> 
                    <p>{{item.title}}</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    created(){ //组件创建成功后加载
        this.shucai();
    },
    data(){
        return {
            shuc:true,
            shuig:false,
            jius:false,
            list:[],
        }
    },
    methods:{
        shucai(){
            this.shuc=true;
            var url="product";
            var obj={flid:20};
            this.axios.get(url,{params:obj})
            .then(result=>{
                // console.log(result.data.data);
                this.list=result.data.data;
            })
        },
        shuiguo(){
            this.shuig=true;
            this.shuc=false;
            var url="product";
            var obj={flid:10};
            this.axios.get(url,{params:obj})
            .then(result=>{
                // console.log(result.data.data);
                this.list=result.data.data;
            })
        },
        jiushui(){
            this.jius=true;
            this.shuc=false;
            this.shuig=false;
            var url="product";
            var obj={flid:30};
            this.axios.get(url,{params:obj})
            .then(result=>{
                // console.log(result.data.data);
                this.list=result.data.data;
            })
        },
        richang(){
            this.jius=false;
            this.shuc=false;
            this.shuig=false;
            var url="product";
            var obj={flid:40};
            this.axios.get(url,{params:obj})
            .then(result=>{
                // console.log(result.data.data);
                this.list=result.data.data;
            })
        }
    }
}
</script>
<style scoped>
.fl{
    display: flex;
    padding-top:10px;
    margin-top:55px;
}
.ceyList{
    width: 25%;
}
.ceyList div{
    box-sizing: content-box;
    text-align: center;
     height: 30px;
    margin-top: 5px;
    margin-bottom: 5px;
}
.ceyList div:nth-child(1){
    margin-top:15px ;
}
.ceyList div{
    padding:7px;
}
.cezList{
    width:75%;
    padding-left: 12px;
}
.cezList_a{
    width: 100%;
    height: 180px;
    padding-right: 12px;
}
.cezList div div+div{
    display: flex;
    flex-wrap: wrap;
    width:33%;
}
.cezList_a img{
    width: 100%;
    height: 180px;
}
.cezList_b1{
    display: flex;
    height: 120px;
    margin-top: 10px;
    padding-right:0px ;
    text-align: center; 
    justify-content: space-between
}
.cezList_b1 img{
    width:90%;
    height: 80px;
    box-sizing:border-box; 
    border-radius:5px; 
}
.cezList_b1 p{
    font-size: 12px;
    line-height: 10px;
    box-sizing: content-box;
    padding:5px;
    margin: 0 auto;
}
.cezList .shucai,.cezList .shuiguo,.cezList .rl,.cezList .js,.cezList .rc{
    display: flex;
    flex-wrap: wrap;
}
</style>