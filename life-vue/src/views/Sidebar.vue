<template>
  <div class="Sidebar">
    <div>
      <div>top
        <a href="">返回顶部</a>
      </div>
      <a href="">购物车</a>
    </div>
  </div>
</template>

<script>
export default {
  
}
</script>

<style scoped>
  .Sidebar>div{
    position:fixed;
    width:40px;
    right:0;
    top:0;
    bottom:0;
    background-color: #444851;
    z-index:1000;
  }
  .Sidebar>div>div{
    width:40px;
    height:40px;
    position: fixed;
    position:relative;
    top:400px;
    text-align: center;
    line-height: 40px;
    font-size: 22px;
    font-weight: 700;
    color:white;
    background:#30343d;
  }
  .Sidebar>div>div:hover{
    background:#e4004f;
    cursor: pointer;
  }
  .Sidebar>div>div>a{
    width:150px;
    height:40px;
    /* display: none; */
    opacity:0;
    transition:all .5s linear;
    color:white;
    background:#e4004f;
    position:absolute;
    right:40px;
    top:0px;

  }
  .Sidebar>div>div:hover>a{
    left:35px;
    opacity:1;
    display: block;
    padding-left: 0;
  }
  /* ***** */
  .Sidebar>div>a{
    display: block;
    width:40px;
    height:100px;
    position:absolute;
    top:440px;
    font-size: 22px;
    font-weight: 700;
    color:white;
    text-decoration: none;
    text-align: center;
    background-image: url("../../public/photo/Login/cart.png");
    background-position: center top;
    background-repeat: no-repeat;
    padding-top:32px;
  }
  .Sidebar>div>a:hover{
    background:#e4004f;
  }
</style>