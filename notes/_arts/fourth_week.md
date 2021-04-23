---

title: fourth_week
create_date: 2019-07-22
finish_date: 2020-10-8
time_taken: more then 1 year

---


## AIgorithm


### [题目描述](https://leetcode-cn.com/problems/repeated-dna-sequences/submissions/)：

所有 DNA 由一系列缩写为 A，C，G 和 T 的核苷酸组成，例如：“ACGAATTCCG”。在研究 DNA 时，识别 DNA 中的重复序列有时会对研究非常有帮助。

编写一个函数来查找 DNA 分子中所有出现超多一次的10个字母长的序列（子串）。

示例:
```
输入: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"

输出: ["AAAAACCCCC", "CCCCCAAAAA"]
```



### 解题:

> 暴力搜索是O(n^2)的复杂度,超出了时间限制，Hash Table + Bit Map 可以达到 O(n) 的复杂度。
> 这两种思路差异还挺大的，主要是需要考虑和计算的细节不一样。第二种思路，不仅最终效果好，而且代码更简短，但是对 Hash Table 不够熟悉的情况下，更容易想清楚的还是波暴力搜索。
> Bit Map 对比把找到的 hash_key 直接放到数组里然后每次挨个比对是否刚好出现过1次， 这两种方案 占内存和运行效率上好像没什么差异。

```c

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
char ** findRepeatedDnaSequences(char * s, int *returnSize){
    char **res;
    *returnSize = 0;
    char bit_map[1<<20] = {0};                  // char 只占 1 byte, int 占 4 byte

    res = (char **)malloc((1)*sizeof(char *));
    int s_len = 0;
    while('\0' != *(s+s_len)){
        s_len++;
        if(s_len>=10){
            int hash = 0;
            for(int i=0;i<10;i++){
                switch(*(s+s_len-i-1)){
                    case 'A':hash += 0<<(i*2);break;
                    case 'C':hash += 1<<(i*2);break;
                    case 'G':hash += 2<<(i*2);break;
                    case 'T':hash += 3<<(i*2);break;
                    default: hash += 3<<(i*2);break;
                }
            }

            //printf(" hash is %d, cnt is %d \n", hash, cnt);
            if( 1 == bit_map[hash] ){
                (*returnSize)++;
                res = (char **)realloc(res, (*returnSize)*sizeof(char *));
                res[*returnSize-1] = (char *)malloc(11*sizeof(char));
                strncpy(res[*returnSize-1], s+s_len-10, 10);
                res[*returnSize-1][10] = '\0';
                bit_map[hash]++;
                //printf("find one -> %s\n", res[*returnSize-1]);
            }else if(0 == bit_map[hash]){
                bit_map[hash]++;
            }
        }
    }
    return res;
}

```
<!--
## Review
(阅读并点评至少一篇英文技术文章)
-->

## Tips

### 如何隐藏cmd窗口？

cmd启动一个进程后，如果直接关掉cmd窗口，进程也会跟着关掉。
如过想让这个进程悄悄的再后台执行，不要在任务栏留着一个窗口碍事，可以在脚本开头添加如下代码。

```bat
   @echo off       
   if "%1"=="h" goto begin       
   start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
   :begin
   rem 后面添加你自己的代码
```
 
开机启动脚本，把脚本或者快捷方式放到这个目录里：`C:\Users\sborg\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

## Share

### 管理定时任务的项目

最近准备折腾一下开源的定时任务管理项目。不需要分布式，只需要能远程启动任务，监控任务执行状态，失败自动重试等。满足核心需求以外，越简单越好，越轻量级越好。

为什么不用 系统自带的 crontab 呢？因为他们有以下几个痛点
1. 文本形式的定时任务可读性非常差，时间长了就很难想起每个任务都是干啥的。而且如果一不小心全部删除了，恢复起来相当麻烦。
2. 当定时任务散落在多台机器上的时候，统一管理很麻烦。效率很低下
3. 日志不能集中化管理，散落在各种目录里，对定时任务运行状况分析和故障排除都比较麻烦。
4. 任务之间的依赖关系，只能手动编程处理。特别是异常情况任务失败时的处理，每一个任务都需要重试机制、和判断上级任务是否成功执行，产生了大量的重复开发和功能冗余。如果有一个统一的调度器来处理这些，开发的工作量和代码的可靠性都能有极大的提升
 
准备尝试一下gocron，go语言开发的，看起来相当的轻量级，非常好上手。完美满足所有需求，而且没有多余的功能。
gocron 项目地址：
[https://github.com/ouqiang/gocron]()

### 学习资料推荐

服务器推送技术分享
[https://www.bilibili.com/video/av54754510]()

一个学习 Linux 的网站，会教你从源码安装一个操作系统，但是需要 3个月到半年的时间才可能跑通一次
[Linux From Scratch LFS](http://www.linuxfromscratch.org/)

[耗子叔ARTS成果展](https://time.geekbang.org/column/article/107806)

[ARTS优秀案例](https://elfgzp.cn/timeline.html)

[c语言 二维数组内存分配demo](https://blog.csdn.net/handsome_926/article/details/8233744)



### 好用的 API 文档工具

[YApi](https://hellosean1025.github.io/yapi/)

[swagger](https://swagger.io/)

[postman](https://www.getpostman.com/)


