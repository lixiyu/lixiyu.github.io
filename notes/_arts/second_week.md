---

title: second_week
create_date: 20190516

---


## AIgorithm
(至少1个算法题，剑指offer or leet_code)

[题目链接]()

### 题目描述：



### 解题:


## Review
>
> (这周继续阅读 Mastering Markdown 官方文档和 Jekyll 官方文档)


### [Mastering Markdown 官方文档](https://guides.github.com/features/mastering-markdown/)
> 按 Mastering Markdown 的规则优化了这篇文章的格式和视觉效果。
> 翻了几遍之后，发现支持的 style 实在是太少了。<br/>
> 我想把一段文字放到一个块里，像代码块一样，能同时支持按自动换行+手动换行都不可以。<br/>
> 想给代码块添加一些缩进，已保持和页面整体风格一致也不可以(页面的代码块是我单独写样式搞定的)。<br/>
> 手动换行就只能分段，段与段之间有很宽的行间距。除非自己在每一行结尾写 \<br/><br/>
> 看来还得探索探索更高度定制化的工具，比如能在 markdown 里写 css 样式的。<br/>
> Mastering Markdown 文档里的内容没啥好分享的，直接看这个博客页面的效果更直观。<br/>
> 基本上就是这些样式的写法:
> 
>   * 标题(1级到6级)
>   * 下划线、加粗、删除线
>   * 列表(有序、无序)
>   * 链接、图片
>   * 内容分块(类似 代码块，弄一个小框把文字框起来，代码块展示的时候不会自动换行，这个会自动换行)
>   * 代码块、行内代码块
>   * 任务清单(可以在每条任务前标记是否已完成)
>   * 表格
>   * git hub 上的 commit、Issue 直接引用
>   * 直接 @ github 上的人 (测试一下效果: @lixiyu )
>   * url 自动识别，自动把 url 转换成可以点击的(demo: http://www.github.com/ )
>   * emoji (表情符, 和安卓手机上原生的表情符一样丑 :sweat_smile: )
>    <br/> [实验失败的也许能在评论框里用]
>   
>


### [Jekylly 官方文档](https://jekyllrb.com/docs/collections/)

> 重新学习了 Jekylly 的 Collections，Permalinks，Pages 的概念和用法，把本站的目录结构重新整理了下，终于找到了同时给项目下多类文件使用不同样式模板的方案。<br/>
> 我们可以用集合来对文章进行分类，把不同类型的文章放到不同的集合里，方便管理。一个集合对应一个文件夹。<br/>
> 首先，你需要为集合创建对应的文件夹，比如在跟目录下的 `_your_dir_name` (必须下划线开头，集合的名字会去掉下划线) <br/>
> 然后，在 _config.yml 里告诉 Jekylly 你有哪些集合，要给他添加什么特性,比如要不要展示、要不要自定义url路径。（这里，集合的名字要去掉下划线）<br/>
> 自定义了 url 路径后，_site 里生成的静态文件的路径就不会和文件路径一样了。 用 permalink 去设置 url 规则，里面的知识点挺多的，就不展开讲了。<br/>
> 最后设置一下默认的样式，就可以和其他类型的文件用不一样的风格了。<br/>
> ps: 如果不想直接仍在根目录下，可以在 _config.yml 文件里设置 `collections_dir` ，然后把所有集合的文件夹都放到这个目录下。 <br/>
> 贴一下我的 _config.yml 的设置吧:

```yml
########### 集合, 分组管理文件 #################
collections_dir: notes
collections:
  arts:
    output: true
    permalink: /:collection/:title
defaults:
  - scope:
      path: ""
      type: "arts"
    values:
      layout: arts
```



## Tips
> 
> (这周分享两个技术技巧吧)

### Tip1 canvas-nets
>
> 介绍一下这个页面上 JS 特效和评论功能的技巧吧。第一次看到别人博客上的这种特效，感觉特别炫酷，找了好多资料后，最后选用了 canvas-nets。
>
> 因为它体积小，整个文件只有7k（官方宣传2k，但是在我本机上看到的是7k, 不过比起 particles 小多了），使用轻便，只需要添加一个 JS 文件，一行html代码, 比 particles 更清爽。
>
> 缺点就是比较费cpu, 多打开几个页面，风扇就开始呼呼响了。

>
> 附上 git hub 地址：
> [canvas-nets 微粒子特效最佳工具包](https://github.com/hustcc/canvas-nest.js)


### Tip2 gitment
>
> 粗略介绍一下这个页面上的评论模块是怎么实现的吧。因为这个网站是用 Jekyll 做的静态页面，没有数据库，没有数据管理的负担。
>
> 但是评论是动态的内容，必须有个地方实时存储起来。
>
> 比较了诸多评论工具以后，gitment 是最符合我的需求的。因为它完全免费，无广告，样式简洁，且可以自己修改CSS。评论数据是存储在 GitHub 的 issue 上的，访客只需要登录 github 就可以写评论了。

> 也调研了其他的评论系统，都有各种瑕疵，没有 gitment 这样适合本站的需求
>   1. 畅言: 会展示广告，而且去广告费用超级贵，一个月99，一年1200...，比买云服务器的价钱都贵很多很多倍...
>   1. 来必力: 会展示广告，长得丑，官网也丑，改CSS都要收费...
>   1. valine: 它是一个用 JS 开发的工具，评论数据实际上存储在 Leancloud，无广告，样式简洁清爽。 Leancloud 文件存储服务有10G 的免费存储空间，30,000次请求/天。还有可以每天免费运行18h的云引擎，可以用来做垃圾品评论监控。还可以支持免登陆直接评论。对于对登陆极其反感的心态，这个无疑更有竞争力。(上次误以为每天会有6个小时无法提交评论，直接放弃了。不过免登陆也有缺点，会更容易产生各种垃圾评论)。
>   1. gitalk: 原理、用法、外观和 gitment 基本上一模一样。只是项目的 commit 时间比 gitment 新一些。仔细对比了 gitalk 和 gitment 的 ReadMe.md 才明白，原来 gitalk 是 gitment 的升级版：应用了 Preact 技术、支持快捷键提交评论。Preact 是什么东西呢？Peract = performance + react，就是比原生 JS 更高性能、轻量级的 JS 技术。能让页面更流畅、响应更快。又是一个比 gitment 更好的工具。(刚开始可能没注意到这两个版本的存在，误打误撞用了 gitment 了，暂时不想再重新调一遍样式了，就不升级了)

> 想对比更多第三方评论系统工具的，可以看看这位大神整理的资料。数量非常多，流行的、停止服务的都有...
>
>  [第三方评论系统推荐](也不是完全免费://blog.shuiba.co/comment-systems-recommendation)


## Share
>
> (分享一大堆最近搜过的资料，和感觉以后会有用处的工具吧)

### 有用的友情链接...
>
>   [静态博客工具对比,Jekyll、Hugo、Hexo](https://www.xxxlbox.com/posts/2018/whats-next-about-this-site/)
>
>   [好用的图床工具](https://sm.ms)
>
>   [稳定好用的idea 破解方法](http://idea.lanyus.com/)
>
>   [XXL-Job 分布式任务调度平台](http://www.xuxueli.com/xxl-job/#/)
>
>   [比较清晰的Hbase文档](https://www.ibm.com/developerworks/cn/analytics/library/ba-cn-bigdata-hbase/index.html)
>
>   [Hbase 还不错的理解，但可能有谬误](https://blog.csdn.net/qq_25371579/article/details/50894145)
>
>   [科学上网亲测可用资源](https://yizibi.github.io/2019/05/16/%E5%85%8D%E8%B4%B9%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91-%E6%97%A0%E9%9C%80%E9%85%8D%E7%BD%AEVPS-%E8%B5%84%E6%BA%90%E5%88%86%E4%BA%AB-%E4%B8%80%E9%94%AE%E4%B8%8A%E7%BD%91(%E6%94%B6%E8%97%8F)/)
>
>   [Mac 高效开发工具集散地](http://www.sdifen.com/)

### mac 软件推荐

>  Alfred 提升办公效率神器，电脑操作效率++(一站式快捷键，自动记录操作流程，运行自动化脚本，自动化微信消息群发)


### 超牛的 JS 特效工具
>
>   [particles 微粒子特效(博客上特别火的微粒子连线动效)](https://github.com/VincentGarreau/particles.js)
>
>   [canvas-nets 更精简的微粒子特效](https://github.com/hustcc/canvas-nest.js)
>
>   [AOS 滚动特效](http://michalsnik.github.io/aos/)
>
>   [3D特效的 JS ](http://mathis-biabiany.fr/experiment)
>
>   [vivus 动态画图效果](http://maxwellito.github.io/vivus/)
>
>   [greensock 粒子、VR 、炫酷的宣页、](https://greensock.com/examples-showcases)

### AD 相关
>
>   [spark-timeseries holt-winter 开源实现版](https://github.com/sryza/spark-timeseries)
>
>   [小米人群广告](http://www.sohu.com/a/125591353_470008)
>
>   [计算广告学配套视频&免费版](https://study.163.com/course/introduction.htm?courseId=321007&_trace_c_p_k2_=af0cc993fdd349819ed28daa85a8807b)



# 随便唠嗑一下
>
>   上次 ARTS 打卡群里的小伙伴吐槽我的网站硬核，想了好久也没明白硬核的意思。
>   可能是说这个页面太丑了。
>   也可能是连目录都没有，让人感觉很不适、很不习惯。
>   也可能是因为在手机上看真的太丑了
>
>   本来是挑了一个自我感觉很不错的主题的。由于审美能力太差，也不擅长挑出美美的样式，最后被我弄着现在的惨状了。不过自己看还行，没啥太违和的地方。
>
>   目录不会加了，因为刚开始写，质量基本上都很差，没必要把目录公开出来。

    
