SET NAMES UTF8;
DROP  DATABASE  IF  EXISTS  life;
CREATE DATABASE life CHARSET=UTF8;
USE life; #创建数据库
#创建用户登录表
CREATE TABLE life_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd  VARCHAR(32),
  phone VARCHAR(11)
);
#添加用户
INSERT INTO life_user VALUES(null,'tom',md5('12345'),13345678912);
INSERT INTO life_user VALUES(null,'jerry',md5('12345'),13345678912);
INSERT INTO life_user VALUES(null,'jack',md5('12345'),13345678912);
INSERT INTO life_user VALUES(null,'jimmy',md5('12345'),13345678912);

#创建商品分类信息表
CREATE TABLE life_class(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(128),  #商品分类名称
  pic VARCHAR(128)  #商品各类图片
);
#添加商品分类信息
INSERT INTO life_class VALUES(null,'蔬菜','img/class/...');
INSERT INTO life_class VALUES(null,'水果','img/class/...');
INSERT INTO life_class VALUES(null,'酒水饮料','img/class/...');
INSERT INTO life_class VALUES(null,'日用百货','img/class/...');

#创建商品分类列表
CREATE TABLE life_fenlei(
  fnid INT PRIMARY KEY AUTO_INCREMENT, 
  flid INT,
  xlid INT,
  title VARCHAR(128), #商品信息
  pic VARCHAR(128)  #图片路径
);
#添加商品信息
INSERT INTO life_fenlei VALUES(NULL,10,100,'牛油果','img/fruits/avocado.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,101,'草莓','img/fruits/caomei.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,102,'车厘子','img/fruits/cherry.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,103,'火龙果','img/fruits/huolongguo.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,104,'猕猴桃','img/fruits/kiwi.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,105,'柠檬','img/fruits/lemo.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,106,'龙眼','img/fruits/longyan.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,107,'芒果','img/fruits/mangou.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,108,'哈密瓜','img/fruits/melon.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,109,'蓝莓','img/fruits/nanmei.jpg');
INSERT INTO life_fenlei VALUES(NULL,10,110,'红提','img/fruits/putao.jpg');

INSERT INTO life_fenlei VALUES(NULL,20,200,'白菜','img/vegetables/baicai.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,201,'冬瓜','img/vegetables/donggua.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,202,'木耳','img/vegetables/muer.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,203,'藕','img/vegetables/ou.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,204,'螃蟹','img/vegetables/pangxie.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,205,'三文鱼','img/vegetables/sanwenyu.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,206,'生菜','img/vegetables/shengcai.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,207,'圣女果','img/vegetables/tomato.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,208,'龙虾','img/vegetables/xia.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,209,'西红柿','img/vegetables/xihonghsi.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,210,'西葫芦','img/vegetables/xihulu.jpg');
INSERT INTO life_fenlei VALUES(NULL,20,211,'花菜','img/vegetables/xilanhua2.jpg');


INSERT INTO life_fenlei VALUES(NULL,30,300,'choya梅酒','img/drinks/choy.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,301,'初心酸奶','img/drinks/chuxin.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,302,'freschello','img/drinks/freschello.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,303,'红酒','img/drinks/hongjiu.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,304,'泸州老窖','img/drinks/luzhoulaojiao2.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,305,'oro红酒','img/drinks/oro.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,306,'雪花啤酒','img/drinks/pijiu1.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,307,'玫瑰酒','img/drinks/rosewine.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,308,'如实酸奶','img/drinks/rushi.jpg');
INSERT INTO life_fenlei VALUES(NULL,30,309,'安慕希','img/drinks/suannai1.jpg');


INSERT INTO life_fenlei VALUES(NULL,40,400,'面膜','img/daliyuse/angel.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,401,'洗面奶','img/daliyuse/cleanser.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,402,'唇膏','img/daliyuse/DHC.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,403,'电饭锅','img/daliyuse/dianfanguo2.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,404,'储物盒','img/daliyuse/huazhuanghe2.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,405,'爽肤水','img/daliyuse/lotion2.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,406,'海飞丝','img/daliyuse/haifeisi.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,407,'干洗剂','img/daliyuse/qingjieji.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,408,'收纳箱','img/daliyuse/shounaxiang2.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,409,'云南白药牙膏','img/daliyuse/yagao.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,410,'抽纸*20包','img/daliyuse/zhijin.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,411,'九阳果汁机','img/daliyuse/zhazhiji.jpg');
INSERT INTO life_fenlei VALUES(NULL,40,412,'简易储物架','img/daliyuse/zhiwujia2.jpg');

#创建商品信息列表
CREATE TABLE life_product(
  lid INT PRIMARY KEY AUTO_INCREMENT, #商品编号
  flid INT,
  xlid INT,
  title VARCHAR(128), #商品信息
  pic VARCHAR(128),  #图片路径
  price DECIMAL(8,2) #商品价格
);
#添加商品信息
INSERT INTO life_product VALUES(NULL,10,100,'牛油果','img/fruits/avocado.jpg','12.50');
INSERT INTO life_product VALUES(NULL,10,100,'牛油果','img/fruits/avocado1.jpg','12.50');
INSERT INTO life_product VALUES(NULL,10,100,'牛油果','img/fruits/avocado2.jpg','12.50');

INSERT INTO life_product VALUES(NULL,10,101,'草莓','img/fruits/caomei.jpg','25.60');
INSERT INTO life_product VALUES(NULL,10,101,'草莓','img/fruits/caomei1.jpg','25.60');
INSERT INTO life_product VALUES(NULL,10,101,'草莓','img/fruits/caomei2.jpg','25.60');
INSERT INTO life_product VALUES(NULL,10,102,'车厘子','img/fruits/cherry.jpg','29.90');
INSERT INTO life_product VALUES(NULL,10,102,'车厘子','img/fruits/cherry1.jpg','29.90');
INSERT INTO life_product VALUES(NULL,10,102,'车厘子','img/fruits/cherry2.jpg','29.90');
INSERT INTO life_product VALUES(NULL,10,102,'车厘子','img/fruits/cherry3.jpg','29.90');

INSERT INTO life_product VALUES(NULL,10,103,'火龙果','img/fruits/huolongguo.jpg','15.20');
INSERT INTO life_product VALUES(NULL,10,103,'火龙果','img/fruits/huolongguo1.jpg','15.20');
INSERT INTO life_product VALUES(NULL,10,103,'火龙果','img/fruits/huolongguo2.jpg','15.20');
INSERT INTO life_product VALUES(NULL,10,104,'猕猴桃','img/fruits/kiwi.jpg','11.80');
INSERT INTO life_product VALUES(NULL,10,104,'猕猴桃','img/fruits/kiwi1.jpg','11.80');
INSERT INTO life_product VALUES(NULL,10,104,'猕猴桃','img/fruits/kiwi2.jpg','11.80');
INSERT INTO life_product VALUES(NULL,10,105,'柠檬','img/fruits/lemo.jpg','16.00');
INSERT INTO life_product VALUES(NULL,10,105,'柠檬','img/fruits/lemo1.jpg','16.00');
INSERT INTO life_product VALUES(NULL,10,105,'柠檬','img/fruits/lemo2.jpg','16.00');
INSERT INTO life_product VALUES(NULL,10,106,'龙眼','img/fruits/longyan.jpg','15.00');
INSERT INTO life_product VALUES(NULL,10,106,'龙眼','img/fruits/longyan1.jpg','15.00');
INSERT INTO life_product VALUES(NULL,10,106,'龙眼','img/fruits/longyan2.jpg','15.00');
INSERT INTO life_product VALUES(NULL,10,107,'芒果','img/fruits/mangou.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,107,'芒果','img/fruits/mangou1.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,107,'芒果','img/fruits/mangou2.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,108,'哈密瓜','img/fruits/melon.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,108,'哈密瓜','img/fruits/melon1.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,108,'哈密瓜','img/fruits/melon2.jpg','12.00');
INSERT INTO life_product VALUES(NULL,10,109,'蓝莓','img/fruits/nanmei.jpg','26.00');
INSERT INTO life_product VALUES(NULL,10,109,'蓝莓','img/fruits/nanmei1.jpg','26.00');
INSERT INTO life_product VALUES(NULL,10,109,'蓝莓','img/fruits/nanmei2.jpg','26.00');
INSERT INTO life_product VALUES(NULL,10,110,'红提','img/fruits/putao.jpg','26.00');
INSERT INTO life_product VALUES(NULL,10,110,'红提','img/fruits/putao1.jpg','26.00');
INSERT INTO life_product VALUES(NULL,10,110,'红提','img/fruits/putao2.jpg','26.00');
INSERT INTO life_product VALUES(NULL,20,200,'白菜','img/vegetables/baicai.jpg','2.90');
INSERT INTO life_product VALUES(NULL,20,200,'白菜','img/vegetables/baicai1.jpg','2.90');
INSERT INTO life_product VALUES(NULL,20,200,'白菜','img/vegetables/baicai2.jpg','2.90');

INSERT INTO life_product VALUES(NULL,20,201,'冬瓜','img/vegetables/donggua.jpg','5.60');
INSERT INTO life_product VALUES(NULL,20,201,'冬瓜','img/vegetables/donggua1.jpg','5.60');
INSERT INTO life_product VALUES(NULL,20,201,'冬瓜','img/vegetables/donggua2.jpg','5.60');
INSERT INTO life_product VALUES(NULL,20,202,'木耳','img/vegetables/muer.jpg','9.80');
INSERT INTO life_product VALUES(NULL,20,202,'木耳','img/vegetables/muer1.jpg','9.80');
INSERT INTO life_product VALUES(NULL,20,202,'木耳','img/vegetables/muer2.jpg','9.80');
INSERT INTO life_product VALUES(NULL,20,203,'藕','img/vegetables/ou.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,203,'藕','img/vegetables/ou1.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,203,'藕','img/vegetables/ou2.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,204,'螃蟹','img/vegetables/pangxie.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,204,'螃蟹','img/vegetables/pangxie1.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,204,'螃蟹','img/vegetables/pangxie2.jpg','26.50');

INSERT INTO life_product VALUES(NULL,20,205,'三文鱼','img/vegetables/sanwenyu.jpg','22.80');
INSERT INTO life_product VALUES(NULL,20,205,'三文鱼','img/vegetables/sanwenyu1.jpg','22.80');
INSERT INTO life_product VALUES(NULL,20,205,'三文鱼','img/vegetables/sanwenyu2.jpg','22.80');
INSERT INTO life_product VALUES(NULL,20,206,'生菜','img/vegetables/shengcai.jpg','4.50');
INSERT INTO life_product VALUES(NULL,20,206,'生菜','img/vegetables/shengcai1.jpg','4.50');
INSERT INTO life_product VALUES(NULL,20,206,'生菜','img/vegetables/shengcai2.jpg','4.50');
INSERT INTO life_product VALUES(NULL,20,207,'圣女果','img/vegetables/tomato.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,207,'圣女果','img/vegetables/tomato1.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,207,'圣女果','img/vegetables/tomato2.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,208,'龙虾','img/vegetables/xia.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,208,'龙虾','img/vegetables/xia1.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,208,'龙虾','img/vegetables/xia2.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,209,'西红柿','img/vegetables/xihonghsi.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,209,'西红柿','img/vegetables/xihonghsi1.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,209,'西红柿','img/vegetables/xihonghsi2.jpg','26.50');
INSERT INTO life_product VALUES(NULL,20,210,'西葫芦','img/vegetables/xihulu.jpg','7.50');
INSERT INTO life_product VALUES(NULL,20,210,'西葫芦','img/vegetables/xihulu1.jpg','7.50');
INSERT INTO life_product VALUES(NULL,20,210,'西葫芦','img/vegetables/xihulu2.jpg','7.50');
INSERT INTO life_product VALUES(NULL,20,211,'花菜','img/vegetables/xilanhua1.jpg','6.50');
INSERT INTO life_product VALUES(NULL,20,211,'花菜','img/vegetables/xilanhua2.jpg','6.50');

INSERT INTO life_product VALUES(NULL,30,300,'choya梅酒','img/drinks/choy.jpg','35.80');
INSERT INTO life_product VALUES(NULL,30,300,'choya梅酒','img/drinks/choy1.jpg','35.80');
INSERT INTO life_product VALUES(NULL,30,300,'choya梅酒','img/drinks/choy2.jpg','35.80');
INSERT INTO life_product VALUES(NULL,30,301,'初心酸奶','img/drinks/chuxin1.jpg','7.80');
INSERT INTO life_product VALUES(NULL,30,301,'初心酸奶','img/drinks/chuxin.jpg','7.80');
INSERT INTO life_product VALUES(NULL,30,301,'初心酸奶','img/drinks/chuxin2.jpg','7.80');
INSERT INTO life_product VALUES(NULL,30,302,'freschello','img/drinks/freschello.jpg','168.80');
INSERT INTO life_product VALUES(NULL,30,302,'freschello','img/drinks/freschello1.jpg','168.80');
INSERT INTO life_product VALUES(NULL,30,302,'freschello','img/drinks/freschello2.jpg','168.80');

INSERT INTO life_product VALUES(NULL,30,303,'红酒','img/drinks/hongjiu.jpg','182.00');
INSERT INTO life_product VALUES(NULL,30,303,'红酒','img/drinks/hongjiu1.jpg','182.00');
INSERT INTO life_product VALUES(NULL,30,303,'红酒','img/drinks/hongjiu2.jpg','182.00');
INSERT INTO life_product VALUES(NULL,30,304,'泸州老窖','img/drinks/luzhoulaojiao.jpg','256.00');
INSERT INTO life_product VALUES(NULL,30,304,'泸州老窖','img/drinks/luzhoulaojiao1.jpg','256.00');
INSERT INTO life_product VALUES(NULL,30,304,'泸州老窖','img/drinks/luzhoulaojiao2.jpg','256.00');
INSERT INTO life_product VALUES(NULL,30,305,'oro红酒','img/drinks/oro.jpg','156.00');
INSERT INTO life_product VALUES(NULL,30,305,'oro红酒','img/drinks/oro1.jpg','156.00');
INSERT INTO life_product VALUES(NULL,30,305,'oro红酒','img/drinks/oro2.jpg','156.00');
INSERT INTO life_product VALUES(NULL,30,306,'雪花啤酒','img/drinks/pijiu.jpg','15.00');
INSERT INTO life_product VALUES(NULL,30,306,'雪花啤酒','img/drinks/pijiu1.jpg','15.00');
INSERT INTO life_product VALUES(NULL,30,307,'玫瑰酒','img/drinks/rosewine.jpg','99.00');
INSERT INTO life_product VALUES(NULL,30,307,'玫瑰酒','img/drinks/rosewine1.jpg','99.00');
INSERT INTO life_product VALUES(NULL,30,307,'玫瑰酒','img/drinks/rosewine2.jpg','99.00');
INSERT INTO life_product VALUES(NULL,30,308,'如实酸奶','img/drinks/rushi.jpg','6.00');
INSERT INTO life_product VALUES(NULL,30,308,'如实酸奶','img/drinks/rushi1.jpg','6.00');
INSERT INTO life_product VALUES(NULL,30,308,'如实酸奶','img/drinks/rushi2.jpg','6.00');
INSERT INTO life_product VALUES(NULL,30,309,'安慕希','img/drinks/suannai1.jpg','2.00');
INSERT INTO life_product VALUES(NULL,30,309,'安慕希','img/drinks/suannai2.jpg','2.00');

INSERT INTO life_product VALUES(NULL,40,400,'面膜','img/daliyuse/angel.jpg','49');
INSERT INTO life_product VALUES(NULL,40,400,'面膜','img/daliyuse/angel1.jpg','49');
INSERT INTO life_product VALUES(NULL,40,400,'面膜','img/daliyuse/angel2.jpg','49');
INSERT INTO life_product VALUES(NULL,40,401,'洗面奶','img/daliyuse/cleanser.jpg','30.00');
INSERT INTO life_product VALUES(NULL,40,401,'洗面奶','img/daliyuse/cleanser1.jpg','30.00');
INSERT INTO life_product VALUES(NULL,40,401,'洗面奶','img/daliyuse/cleanser2.jpg','30.00');
INSERT INTO life_product VALUES(NULL,40,402,'唇膏','img/daliyuse/DHC.jpg','80.00');
INSERT INTO life_product VALUES(NULL,40,402,'唇膏','img/daliyuse/DHC1.jpg','80.00');
INSERT INTO life_product VALUES(NULL,40,402,'唇膏','img/daliyuse/DHC2.jpg','80.00');
INSERT INTO life_product VALUES(NULL,40,403,'电饭锅','img/daliyuse/dianfanguo.jpg','289');
INSERT INTO life_product VALUES(NULL,40,403,'电饭锅','img/daliyuse/dianfanguo1.jpg','289');
INSERT INTO life_product VALUES(NULL,40,403,'电饭锅','img/daliyuse/dianfanguo2.jpg','289');
INSERT INTO life_product VALUES(NULL,40,404,'储物盒','img/daliyuse/huazhuanghe.jpg','45');
INSERT INTO life_product VALUES(NULL,40,404,'储物盒','img/daliyuse/huazhuanghe1.jpg','45');
INSERT INTO life_product VALUES(NULL,40,404,'储物盒','img/daliyuse/huazhuanghe2.jpg','45');
INSERT INTO life_product VALUES(NULL,40,405,'爽肤水','img/daliyuse/lotion.jpg','66');
INSERT INTO life_product VALUES(NULL,40,405,'爽肤水','img/daliyuse/lotion1.jpg','66');
INSERT INTO life_product VALUES(NULL,40,405,'爽肤水','img/daliyuse/lotion2.jpg','66');
INSERT INTO life_product VALUES(NULL,40,406,'海飞丝','img/daliyuse/haifeisi.jpg','58');
INSERT INTO life_product VALUES(NULL,40,406,'海飞丝','img/daliyuse/haifeisi1.jpg','58');
INSERT INTO life_product VALUES(NULL,40,406,'海飞丝','img/daliyuse/haifeisi2.jpg','58');
INSERT INTO life_product VALUES(NULL,40,407,'干洗剂','img/daliyuse/qingjieji.jpg','166');
INSERT INTO life_product VALUES(NULL,40,407,'干洗剂','img/daliyuse/qingjieji1.jpg','166');
INSERT INTO life_product VALUES(NULL,40,407,'干洗剂','img/daliyuse/qingjieji2.jpg','166');
INSERT INTO life_product VALUES(NULL,40,408,'收纳箱','img/daliyuse/shounaxiang.jpg','25.50');
INSERT INTO life_product VALUES(NULL,40,408,'收纳箱','img/daliyuse/shounaxiang1.jpg','25.50');
INSERT INTO life_product VALUES(NULL,40,408,'收纳箱','img/daliyuse/shounaxiang2.jpg','25.50');

INSERT INTO life_product VALUES(NULL,40,409,'云南白药牙膏','img/daliyuse/yagao.jpg','37');
INSERT INTO life_product VALUES(NULL,40,409,'云南白药牙膏','img/daliyuse/yagao1.jpg','37');
INSERT INTO life_product VALUES(NULL,40,409,'云南白药牙膏','img/daliyuse/yagao2.jpg','37');

INSERT INTO life_product VALUES(NULL,40,410,'抽纸*20包','img/daliyuse/zhijin.jpg','80');
INSERT INTO life_product VALUES(NULL,40,410,'抽纸*20包','img/daliyuse/zhijin1.jpg','80');
INSERT INTO life_product VALUES(NULL,40,410,'抽纸*20包','img/daliyuse/zhijin2.jpg','80');
INSERT INTO life_product VALUES(NULL,40,411,'九阳果汁机','img/daliyuse/zhazhiji.jpg','428');
INSERT INTO life_product VALUES(NULL,40,411,'九阳果汁机','img/daliyuse/zhazhiji1.jpg','428');
INSERT INTO life_product VALUES(NULL,40,411,'九阳果汁机','img/daliyuse/zhazhiji2.jpg','428');
INSERT INTO life_product VALUES(NULL,40,412,'简易储物架','img/daliyuse/zhiwujia.jpg','68');
INSERT INTO life_product VALUES(NULL,40,412,'支架','img/daliyuse/zhiwujia1.jpg','68');
INSERT INTO life_product VALUES(NULL,40,412,'简易储物架','img/daliyuse/zhiwujia2.jpg','68');

#轮播图列表
CREATE TABLE life_banner(
  pic VARCHAR(128)
);
#添加轮播图图片
INSERT into life_banner VALUES('img/banner/banner1');
INSERT into life_banner VALUES('img/banner/banner2');
INSERT into life_banner VALUES('img/banner/banner3');
INSERT into life_banner VALUES('img/banner/banner4');
INSERT into life_banner VALUES('img/banner/banner5');
INSERT into life_banner VALUES('img/banner/banner6');

#添加购物车列表
CREATE TABLE life_shopcar(
  id INT(11) PRIMARY KEY AUTO_INCREMENT, 
  xlid INT(11), 
  #FOREIGN KEY(lid) REFERENCES life_product(lid), #外键引入life_product表的lid
  price DECIMAL(8,2),  #价格
  count INT(11),    #购买单品数量
  title VARCHAR(255), #商品信息
  pic VARCHAR(128),
  uid INT(11),
  FOREIGN KEY(uid) REFERENCES life_user(uid) #外键引入life_user表的uid
);