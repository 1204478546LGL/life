var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');


// 引入express-session cors 
const session=require("express-session");
const cors=require("cors");
// 创建mysql连接池
const mysql=require('mysql');
var pool=mysql.createPool({
  host:'127.0.0.1',
  user:'root',
  password:'',
  port:3306,
  database:'life',
  connectionLimit:15
});
var app = express();
// 配置跨越 允许跨域程序端口
app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  // 每次请求验证
  credentials:true
}));
// 配置session对象
app.use(session({
  secret:'128位安全字符串',
  cookie:{maxAge:60*1000*30},//过期时间ms
  resave:true,
  saveUninitialized:true
}))
//指定静态目录  public
app.use(express.static("public")); 
//启动监听端口  3000
app.listen(3000);


// view engine setup
/*app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
*/
// app.use('/', index);
// app.use('/users', users);
// app.use('/details',details);
// app.use('/products',products);

// catch 404 and forward to error handler
/*app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  // res.render('error');
});
*/
// module.exports = app;

// 功能一:用户登录验证
app.get("/login",(req,res)=>{
  var n=req.query.uname;
  var p=req.query.upwd;
  // 创建sql
  var sql="SELECT uid FROM life_user WHERE uname=? AND upwd = md5(?)";
  pool.query(sql,[n,p],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或者密码有误"})
    }else{
      //登录成功的id保存session对象 保存用户登录的凭证
      req.session.uid=result[0].uid;
      res.send({code:1,msg:"登录成功",result:result})
    }
  })
})

// 功能二:用户注册
app.get("/reg",(req,res)=>{
  var $uname=req.query.uname;
  var $upwd=req.query.upwd;
  var $phone=req.query.phone;
  // 创建SQL  都进行加密 密码才能一致
  var sql="INSERT INTO life_user VALUES(null,?,md5(?),?)";
  pool.query(sql,[$uname,$upwd,$phone],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"注册成功",result:result});
    }else{
      res.send({code:-1,msg:"未注册成功"})
    }
  })
})
// 功能三:查询是否有这个用户名
app.get("/user",(req,res)=>{
  var uname=req.query.uname;
  // var upwd=req.query.upwd
  var sql="SELECT * FROM life_user WHERE uname=?";
  pool.query(sql,[uname],(err,result)=>{
    if(err) throw err;
      // console.log(result)
    if(result.length==0){
        res.send({code:-1,msg:"用户不存在"})
    }else{
      res.send({code:1,msg:'查询成功',data:result})
    }
  })
})
// 功能四:获取用户昵称 
app.get("/username",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-1,msg:'请登录'});
    return; 
  }
  var sql="SELECT uname FROM life_user WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:'查询成功',result:result});
  })
})

//商品列表分页显示 没有写
app.get("/list",(req,res)=>{
  var pno=req.query.pno;
  var ps=req.query.pageSize;
  // 如果没写给默认值
  if(!pno){pno=1;}
  if(!ps){ps=10;}
  ps=parseInt(ps);
  var offset=(pno-1)*ps;
  var sql="SELECT lid,flid,title,pic,price FROM life_product LIMIT ?,?";
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:'查询成功',data:result})
  })
})
//功能五:商品列表
app.get("/product",(req,res)=>{
  var flid=req.query.flid;
  var sql="SELECT xlid,title,pic FROM life_fenlei WHERE flid=?";
  pool.query(sql,[flid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:'查询成功',data:result})
  })
})
// 功能六:商品详情页
app.get("/detail",(req,res)=>{
  var xlid=req.query.xlid;
  var sql="SELECT lid,flid,title,pic,price FROM life_product WHERE xlid=?";
  pool.query(sql,[xlid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:'查询成功',data:result})
  })
})

// 功能七：添加购物车
app.get('/addcart',(req,res)=>{
  // 获取用户当前登录的uid
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-2,msg:"请登录"});
    return;
  }
  // 获取参数  price价格 
  var title=req.query.title;
  var price=req.query.price;
  var xlid=req.query.xlid;
  var pic=req.query.pic;
  // 查询此用户是否购买过此商品
  var sql="SELECT id FROM life_shopcar WHERE xlid=? AND uid=?";
  pool.query(sql,[xlid,uid],(err,result)=>{
    if(err) throw err;
    if(result.length==0){ //没有购买就添加
      var sql=`INSERT INTO life_shopcar VALUES(null,${xlid},${price},1,'${title}','${pic}',${uid})`;
    }else{ //如果购买过此商品
      var sql=`UPDATE life_shopcar SET count=count+1 WHERE xlid=${xlid} AND uid=${uid}`;
    }
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,msg:"添加成功",result:result});
    })
  })
})

// 功能八：查询当前用户购物车信息
app.get('/cart',(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-2,msg:'请登录',data:[]});
    return;
  }
  var sql="SELECT xlid,price,count,pic,title FROM life_shopcar where uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,msg:"查询成功",data:result});
  })
})

// 功能九：删除指定商品
app.get('/delcart',(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-2,msg:'请登录'});
    return;
  }
  var xlid=req.query.xlid;
  var sql='DELETE FROM life_shopcar WHERE xlid=?';
  pool.query(sql,[xlid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:'删除成功'});
    }else{
      res.send({code:-1,msg:'删除失败'});
    }
  })
})

// 功能十：删除多个商品记录
app.get('/dels',(req,res)=>{
  // 1.获取uid判断是否赋值登录成功
  var uid=req.session.uid;
  if(!uid){
    res.send({code:-2,msg:'请登录'});
    return;
  }
  // 2.获取参数ids 删除id列表 脚手架传过来也是这样的格式
  var ids=req.query.ids;
  var sql = `DELETE FROM life_shopcar WHERE xlid IN (${ids})`;
  // 3.删除
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:'删除成功'});
    }else{
      res.send({code:-1,msg:"删除失败"})
    }
  })
})