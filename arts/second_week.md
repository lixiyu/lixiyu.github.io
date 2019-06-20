---
short_name: second_week
create_date: 20190516
url: https://lixiyu.github.io/arts/second_week.html
id: arts/second_week
---


## AIgorithm
(至少1个算法题，剑指offer or leet_code)

[题目链接]()

### 题目描述：



### 解题:


## Review
(阅读并点评至少一篇英文技术文章)


## Tips
>
(这周分享两个技术技巧吧)

### Tip1 canvas-nets
>
介绍一下这个页面上 JS 特效和评论功能的技巧吧。第一次看到别人博客上的这种特效，感觉特别炫酷，找了好多资料后，最后选用了 canvas-nets。
>
因为它体积小，整个文件只有7k（官方宣传2k，但是在我本机上看到的是7k, 不过比起 particles 小多了），使用轻便，只需要添加一个 JS 文件，一行html代码, 比 particles 更清爽。
>
缺点就是比较费cpu, 多打开几个页面，风扇就开始呼呼响了。

>
附上 git hub 地址：
[canvas-nets 微粒子特效最佳工具包](https://github.com/hustcc/canvas-nest.js)


### Tip2 gitment
>
  粗略介绍一下这个页面上的评论模块是怎么实现的吧。因为这个网站是用 Jekyll 做的静态页面，没有数据库，没有数据管理的负担。
>
  但是评论是动态的内容，必须有个地方实时存储起来。
>
  比较了诸多评论工具以后，gitment 是最符合我的需求的。因为它完全免费，无广告，样式简洁，且可以自己修改CSS。评论数据是存储在 GitHub 的 issue 上的，访客只需要登录 github 就可以写评论了。

> 也调研了其他的评论系统，都有各种瑕疵，没有 gitment 这样适合本站的需求
  1. 畅言: 会展示广告，而且去广告费用超级贵，一个月99，一年1200...，比买云服务器的价钱都贵很多很多倍...
  1. 来必力: 会展示广告，长得丑，官网也丑，改CSS都要收费...
  1. valine: 它是一个用 JS 开发的工具，评论数据实际上存储在 Leancloud，无广告，样式简洁清爽。 Leancloud 文件存储服务有10G 的免费存储空间，30,000次请求/天。还有可以每天免费运行18h的云引擎，可以用来做垃圾品评论监控。还可以支持免登陆直接评论。对于对登陆极其反感的心态，这个无疑更有竞争力。(上次误以为每天会有6个小时无法提交评论，直接放弃了。不过免登陆也有缺点，会更容易产生各种垃圾评论)。
  1. gitalk: 原理、用法、外观和 gitment 基本上一模一样。只是项目的 commit 时间比 gitment 新一些。仔细对比了 gitalk 和 gitment 的 ReadMe.md 才明白，原来 gitalk 是 gitment 的升级版：应用了 Preact 技术、支持快捷键提交评论。Preact 是什么东西呢？Peract = performance + react，就是比原生 JS 更高性能、轻量级的 JS 技术。能让页面更流畅、响应更快。又是一个比 gitment 更好的工具。(刚开始可能没注意到这两个版本的存在，误打误撞用了 gitment 了，暂时不想再重新调一遍样式了，就不升级了)

> 想对比更多第三方评论系统工具的，可以看看这位大神整理的资料。数量非常多，流行的、停止服务的都有...
>
  [第三方评论系统推荐](也不是完全免费://blog.shuiba.co/comment-systems-recommendation)


## Share
>
(分享一大堆最近搜过的资料，和感觉以后会有用处的工具吧)

### 有用的友情链接...
>
  [静态博客工具对比,Jekyll、Hugo、Hexo](https://www.xxxlbox.com/posts/2018/whats-next-about-this-site/)
>
  [好用的图床工具](https://sm.ms)
>
  [稳定好用的idea 破解方法](http://idea.lanyus.com/)
>
  [XXL-Job 分布式任务调度平台](http://www.xuxueli.com/xxl-job/#/)
>
  [比较清晰的Hbase文档](https://www.ibm.com/developerworks/cn/analytics/library/ba-cn-bigdata-hbase/index.html)
>
  [Hbase 还不错的理解，但可能有谬误](https://blog.csdn.net/qq_25371579/article/details/50894145)
>
  [科学上网亲测可用资源](https://yizibi.github.io/2019/05/16/%E5%85%8D%E8%B4%B9%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91-%E6%97%A0%E9%9C%80%E9%85%8D%E7%BD%AEVPS-%E8%B5%84%E6%BA%90%E5%88%86%E4%BA%AB-%E4%B8%80%E9%94%AE%E4%B8%8A%E7%BD%91(%E6%94%B6%E8%97%8F)/)
>
  [Mac 高效开发工具集散地](http://www.sdifen.com/)

### mac 软件推荐

>  Alfred 提升办公效率神器，电脑操作效率++(一站式快捷键，自动记录操作流程，运行自动化脚本，自动化微信消息群发)


### 超牛的 JS 特效工具
>
  [particles 微粒子特效(博客上特别火的微粒子连线动效)](https://github.com/VincentGarreau/particles.js)
>
  [canvas-nets 更精简的微粒子特效](https://github.com/hustcc/canvas-nest.js)
>
  [AOS 滚动特效](http://michalsnik.github.io/aos/)
>
  [3D特效的 JS ](http://mathis-biabiany.fr/experiment)
>
  [vivus 动态画图效果](http://maxwellito.github.io/vivus/)
>
  [greensock 粒子、VR 、炫酷的宣页、](https://greensock.com/examples-showcases)

### AD 相关
>
  [spark-timeseries holt-winter 开源实现版](https://github.com/sryza/spark-timeseries)
>
  [小米人群广告](http://www.sohu.com/a/125591353_470008)
>
  [计算广告学配套视频&免费版](https://study.163.com/course/introduction.htm?courseId=321007&_trace_c_p_k2_=af0cc993fdd349819ed28daa85a8807b)



# 随便唠嗑一下
>
  上次 ARTS 打卡群里的小伙伴吐槽我的网站硬核，想了好久也没明白硬核的意思。
  可能是说这个页面太丑了。
  也可能是连目录都没有，让人感觉很不适、很不习惯。
  也可能是因为在手机上看真的太丑了
>
  本来是挑了一个自我感觉很不错的主题的。由于审美能力太差，也不擅长挑出美美的样式，最后被我弄着现在的惨状了。不过自己看还行，没啥太违和的地方。
>
  目录不会加了，因为刚开始写，质量基本上都很差，没必要把目录公开出来。

    
