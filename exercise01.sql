-- 练习2 查找练习
--
-- 1. 查找30多图书
select * from book where 价格>=30 and 价格<40;
-- 2. 查找中国教育出版社出版的图书
select * from book where 出版社='中国教育出版社';
-- 3. 查找老舍写的，中国文学出版社出版的
select * from book where 作者='老舍' and 出版社='中国文学出版社';
-- 4. 查找备注不为空的
select * from book where 备注 is not null;
-- 5. 查找价格查过60的，只看书名和价格
select 书名 ,  价 格 from book where 价格>60;
-- 7. 查找鲁迅写的 或者 矛盾写的
select * from book where 作者 in ('鲁迅','矛盾');

--练习3： 使用book表完成
--
--1. 将呐喊的价格改为45元
update book set 价格=45 where 书名='呐喊';
--2. 增加一个字段 出版日期 类型为 date 放在价格后面
alter table book add `出版日期` date after 价格;
--3. 修改所有老舍的作品出版日期为2016-10-1
update book set 出版日期='2016-10-1' where 作者='老舍';
--4. 修改所有中国文学出版社的图书作品出版日期为2018-1-1，但是老舍的不要改
update book set 出版日期='2018-1-1' where 作者!='老舍' and 出版社='中国文学出版社';
--5. 删除所有在60元以上的图书
delete from book where 价格>60;
--7. 修改价格字段的数据类型为 decimal(5,2)
alter table book modify 价格 decimal(5,2);
--8. 查找鲁迅写的 2017年以后出版的图书
select * from book where 作者="鲁迅" and 出版日期>'2017';



--1. 查找所有蜀国人的信息，按照攻击力排名
select * from sanguo where country='魏' order by attack desc;
--2. 将赵云的攻击力设置为360 防御力设置为70
update sanguo set attack=360,defense=70 where name='赵云';
--3. 吴国英雄攻击力超过300的改为300 （最多改2个）
update sanguo set attack=300 where attack>300 and country='吴' limit 2;
--4. 查找攻击力超过200的魏国英雄名字和攻击力 并显示为 （姓名，攻击力）
select name as 姓名,attack as 攻击力 from sanguo where attack>200 and country='魏';
--5. 所有英雄的攻击力按照降序排序，如果攻击力相同则按照防御力降序排序
select * from sanguo order by attack desc,defense desc;
--6. 查找所有名字为3个字的英雄
select * from sanguo where name like '___';
--7. 找到比魏国最高攻击力的英雄还要高的蜀国英雄
select * from sanguo where country='蜀'
and attack>(select attack from sanguo where country='魏'order by attack desc limit 1);
--8. 找到魏国防御力前2名的英雄
select * from sanguo where country='魏' order by defense desc limit 2;
--9. 查找所有女性角色英雄，同时查找所有男性角色英雄中攻击力少于250的
select * from sanguo where gender='女' union all select * from sanguo where gender='男' and attack<250;