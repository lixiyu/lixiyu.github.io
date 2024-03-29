---
title: 为什么你电脑上的web服务不能直接给别人访问？
description: 记录一下所有找到的内网穿透方案
create_date: 2021-07-08
finish_date: 
time_taken: x day
---

## 问题背景

很小的时候学计算机网络科普的概念的时候好像只要所有的电脑都连到同一个局域网上就可以互相访问了，可以在网上邻居里看到其他电脑、可以通过 ip + 文件目录地址 访问其他电脑上的共享文件，还可以一起联机打游戏，还有发送广播等等神奇的技能。
然后还有一个广域网的概念，就是把全世界的电脑全部连接到一起的那个网络;局域网，连在一个路由器下的电脑直接可以互相连接起来。<br/>

是不是只要我的电脑可以正常上网，然后在电脑上搭建一个 web 服务，别人就可以通过 ip 访问到我电脑上搭的网站了呢？<br/>
答案是不能。你电脑上那个 192.168.xx.xx 的 IP 是路由器下的局域网的IP，除非其他电脑也连在这个路由器上面，不然拿着这个地址是根本找不到你的电脑的。<br/>

那其他电脑可以通过我家路由器的IP访问吗？我让路由器把请求转发到我的电脑上。<br/>
答案也是不能，因为你家路由器是连在运营商的某个交换机下的，路由器的 IP 也运营商的交换机下的局域网 IP，除非你能让运营商的交换机也给你把外面的请求转发到路由器上。<br/>

我用 IP 地址查询网站查到我电脑访问外面的服务器时用的 IP (`curl -L ip.tool.lu`)，是不是就可以在外面的电脑上用这个 ip 访问我的电脑上的网站了? <br/>
答案还是不能。因为这是运营商的某个交换机的 ip，只要从你家电脑到运营商这个交换机这条通道上，中间的任何一个路由设备没有给你提供请求转发功能，外面的电脑就不能直接通过这个公网ip 访问到你家电脑上的网站?

有的路由器上有“虚拟服务器”的功能，可以通过它开放指定的端口，在保证内网安全的前提下提供实现对指定端口的内网服务器的访问。这样能解决问题吗？
答案还是不能。因为你的路由器没有公网IP<br/>

路由器上的 “DMZ主机”功能，可以解决问题吗？它支持将内网中的某个设备设置为DMZ主机，此时该设备对外完全开放，您可以将一些需要对外共享的资源放在该设备中，互联网中的设备可直接访问该DMZ主机。<br/>
答案是依然不能。因为你的路由器没有公网IP<br/>

或许你会很纳闷。我的电脑只要连上网以后，就可以轻松访问各种网站、微信聊天、玩游戏看视频、上传下载文件。可以随时保持在线，随时接收到各种服务的通知，可以随时被外面的服务器连接到呀。这中间的一大堆路由器交换机什么都可以正常完成双向传输数据的需求呀。<br/>
为什么我自己搭的 web 服务，外面就死活不能访问到了呢？
虽然我也不知道里面用到全部技术，不过当我们去访问网上的资源的时候，我们先要拿到一个 ip地址，这个 ip地址 就是公网ip (这里就不讨论 DNS 的逻辑了，后面的内容也是简化描述只为了便于理解，只是为了解释清楚别人不能访问你自己电脑上的web服务这个问题，想了解更具体的工作原理请查阅计算机网络模型相关资料)。<br/>
拿到IP后，客户端会主动用这个 IP 去找服务器发起连接请求。虽然客户端(你的电脑)没有对外暴露的公网ip地址、虽然你家电脑藏在某个很深很深的局域网里面，但是它知道他要找的那个服务器的地址呀。他会把这个地址告诉路由器让路由器去找，路由器再去找交换机要，最终在众多路由器和交换机的共同努力下成功找到了服务器。当然这个数据包也会井井有条的贴上所有经手人的联系方式，服务器拿到数据时，会根据约定好的传输协议给客户端回消息对暗号，确认连接ok。
服务器去找客户端的这个过程，它会把返回给客户端的数据打包好，带上数据发过来时的一串联系方式，给到找到他的那个交换机，然后交换机会从这里面找到原来找他的那个交换机，最终这样原路返回找到你的电脑。

不过以上内容是我自己找到的理解方式，并不是专业的描述方式，可能存在谬误。比如原路返回的逻辑是我自己YY的，大体上应该差不多，需要确切信息的请仔细查阅权威资料<br/>
我觉得这个过程，似乎可以用一颗树来描述整个网络结构，如下图(此图也是瞎YY的，不专业哦)。

<div class="mermaid">
  graph LR
  A((总线))
  A --> B[移动运营商]
  A --> D[电信运营商]
  A --> A2[...]
  B --> H[北京总交换机]
  B --> I[哈尔滨总交换机]
  B --> J[...]
  H --> K[你家小区]
  H --> M[隔壁小区]
  H --> N[...]
  K --> O[你家路由器]
  K --> P[隔壁路由器]
  K --> Q[...]
  O --> R[你的电脑]
  O --> S[你的手机]
  O --> T[...]
  D --> X[微信服务器]
  D --> Y[百度服务器]
  D --> Z[...]
  I --> I2[...]
  I --> I1[别人家小区]
  I1 --> I12[...]
  I1 --> I11[别人家路由器]
  I11 --> IB[...]
  I11 --> IA[别人家电脑]
  
</div>

所有连进来的设备，不是每台机器都可以拥有公网ip的，因为机器太多了，ipv4 早就不够分了，虽然 ipv6 可以分配给地球上的每一粒沙子，但是因为和 ipv4 不兼容，迁移成本非常大，尽管很早以前就提出来了却迟迟没能在互联网应用程序中普及。<br/>
因此运营商使用 NAT (Network Address Translation) 技术，他可以让没有公网ip的机器也可以和外界通信。需要在 NAT路由器上将其本地地址转换成全球 IP 地址。

那么，为什么我可以随便访问外面的服务器，为什么我自己搭的 web 服务，外面就是不能来访问到了呢？<br/>
因为你去访问外面的服务器时，NAT 路由器会帮你将地址转换成公网 IP，并且帮你完成由你主动发起的连接请求和数据传输。
但是当外面的服务器拿他这个公网IP 来找你时，你没事先和他打招呼，他底下还连了一大堆设备，当服务器主动来找他时，他根本就不知道要找谁，所以根本就不可能把消息传给你。<br/>
再换一个比喻，你可以把你去连接外面的服务器的过程理解成打匿名电话，你拿着对方的电话号码，成功拨通了电话，然后就可以和人家聊了。但是一旦你挂了电话，人家就没办法通过你打过去的时候显示的那个号码打给你了。这就是为什么你可以访问外面的服务器，别人确没法访问你电脑上的服务的原因。


那么这个问题怎么解决呢？

第一个方案就是让运营商给你家的设备分配一个公网IP。不过IPv4的资源本来就很紧张了，不是谁随便找客服就可以要过来的，不同的运营商搞定的成本都不一样。如果你在家里的电脑搭一个网站只是为了学习交流，这个方案可能就不是很划算了。

第二个方案就是事先和 NAT路由器打招呼，告诉他如果有人来找你的 xxx 端口，那就是来找我的，你就直接接到我这来就好了。这和路由器上的“虚拟服务器”功能大概是一样的原理吧。不过 NAT路由器是运营商的，想让它帮你干活得先经过运营商的同意才行。

第三个方案是内网穿透。虽然运营商不给我面子，但是我外面有人，我有一台有公网IP的服务器。
我先给服务器打个匿名电话，然后这个电话就不挂了，让服务器把所有的找到他的请求全部通过电话的渠道转达到我这里来，我处理完再让服务器代为转达过去。
我可以在我家电脑上运行一个客户端程序，外面那个服务器上运行一个服务端程序，先让客户端程序主动去找到服务端程序，建立连接，就像用微信打视频电话一样，然后一直保持这个连接通道不挂断。
然后告诉服务端程序，如果有人来找你的服务器的 xxx 端口，你就把请求转发到我这来，等我回复你，然后再帮我把消息传回去。
然后客户端程序再把服务端程序那边传过来的数据，通过你电脑的本地传输通道转发给你的 web服务监听的那个端口。
这样别人就可以通过有公网IP的那个服务器的IP地址和端口号成功访问到运行在你电脑上的网站了。

如果我连有服务器都没有，只有家里的主机怎么办？<br/>
没关系，有厂商专门开发了内网穿透服务，你可以直接用他们的客户端、用他们的服务器就行了。<br/>
这三个是我找到的服务商：<br/>
1. 花生壳。它提供了免费体验版，可以建立一个映射，只需要交6块钱的认证费，效果还不错，学习交流的场景够用了。如果想用更稳定的可以花钱购买。
2. IOEE内网穿透。似乎连 6 块钱都不用花，也是1个免费的映射，可以试试。
3. 樱花FRP。樱花FRP公司规模可能比花生壳小很多，不过便宜，可以免费使用5条隧道。花生壳一个不够用的话，可以再试试这个。


第四个方案是用VPN服务。原理还没研究过，比内网穿透的原理更底层，实现起来更复杂，先占个坑吧。
VPN 比内网穿透更强大，不仅可以用来连接内网，它的 IPsec/L2TP 协议还可以让所有连在 VPN 上的机器像连在同一个局域网里一样互相通信，也就是说，可以让连在上面的两个机器直接通过 ip 地址互相访问，这个 ip 不需要是公网 ip，只需要用 VPN 服务器分配给设备的 ip 就可以了。<br/>
开源项目最热的是 hwdsl2/setup-ipsec-vpn, 16k关注人数，居然是用 shell 脚本写的，只支持linux 系统，不过文档写得很清晰很完善，同时有很详细的中文文档。<br/>
关注数排第二的是日本国立筑波大学开发的 SoftEther，8.1K关注人数，支持多种操作系统和手机。但是没有详细的中文文档，官网部分文档也打不开，而且软件操作界面很古老，对我这样的小白用户很不友好<br/>
排第三的是 OpenVPN，6.1k关注人数，文档还没有 SoftEther 详细。


参考资料: <br/>
https://github.com/hwdsl2/setup-ipsec-vpn   <br/>
https://github.com/SoftEtherVPN/SoftEtherVPN    <br/>
https://github.com/OpenVPN/openvpn              <br/>
https://help.aliyun.com/document_detail/64960.html <br/>
https://help.aliyun.com/document_detail/44848.html <br/>
https://help.aliyun.com/document_detail/65069.html <br/>
https://help.aliyun.com/document_detail/64984.html <br/>
https://help.aliyun.com/document_detail/175194.html <br/>



接下来继续介绍，怎么用云服务器和开源项目自己搭建一套内网穿透服务来用。


## 内网方案梳理

<div class="mermaid">
  graph TB
  内网穿透方案 --> 第三方服务提供商 & 开源项目自己搭建
  第三方服务提供商 --> 花生壳 & IOEE内网穿透 & 樱花FRP
  开源项目自己搭建 --> frp & ngrok & nps & shootback
  frp --> 这几个项目里热度最高的一个
  nps --> 最简单好用的一个
</div>


## nps 搭建步骤

经过反复对比，虽然 frp 关注的用户更多，但是配置文件里没找到客户端连接服务器时需要设置密码的说明。
担心使用这个项目会导致任何人客户端都可以连接到你的服务器上，然后随便用你的服务器....，因此最终选择了 nps 

官方文档：<br/>
https://ehang-io.github.io/nps/#/?id=nps    <br/> 
git仓库：<br/>
https://github.com/ehang-io/nps


搭建步骤: <br/>
1. 服务端启动 `nps.exe stop|restart`
2. 进入web界面，公网ip:web界面端口（默认8080），密码默认为123
3. 在web界面创建客户端，配置需要映射的端口
4. 客户端启动 ` ./npc -server=ip:port -vkey=web界面中显示的密钥`

## VPN方案简单记录

<div class="mermaid">
  graph TB
    A[VPN开源项目] --- hwdsl2/setup-ipsec-vpn --- server只支持Linux
    A --- SoftEther & OpenVPN
    SoftEther --- 支持多种操作系统和终端但是操作界面比较老旧
</div>


----------

<script src="https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
<script>mermaid.initialize({startOnLoad:true});</script>

