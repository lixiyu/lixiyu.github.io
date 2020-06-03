#dir_name=`pwd`'/'`dirname $0`
#cd ${dir_name}


## jekyll
#### RVN安装法，安装 ruby 2.5.0 以上版本 (坑预警: 系统自带 yum 源只能安装 2.0.0 版)。git 下载速度慢，但是这个方案稳定、持续可用
###### x.git 克隆代码不可行，以为网速慢，会直接失败
###### x.官方下载原码编译安装也不可行，因为打不开官网，且网速慢
###### x.官方教程(http://rvm.io/) 已无法正常跑通，且次网站很容易打不开
###### 脚本来自 https://get.rvm.io ，但是已经无法通过 curl 等方式自动下载。只能手动复制到本地使用
sh tools/rvm_install.sh
source /etc/profile.d/rvm.sh
rvm list known
###### rvm 安装，会自动帮你安装一大堆依赖的程序。运行过程可能会因网络连接问题失败，需要多重试几次
rvm install 2.7.1
ruby -v
#### 安装 RubyGems : gem
# done 安装 ruby 的时候同时安装好了
gem -v
#gem sources --remove https://rubygems.org/
#gem sources --add http://mirrors.aliyun.com/rubygems/ 
#gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/
#### 安装 GCC and Make
# done

#### 安装jekyll
gem install bundler jekyll

###############################################
##-- 总而言之，Ruby 是个大坑，能不用就别用 --##
##-- 因此，Jekyll 是一个大坑，能弃最好弃掉 --##
###############################################


### 初始化项目环境。 进入到 项目根目录，然后执行此命令
bundle install



### 安装好了，启动服务验证一下
bundle exec jekyll serve