---
name: first_week
title: ARTS 第一周
url: https://lixiyu.github.io/arts/first_week.html
---


## AIgorithm

(第一周做题，先挑一个最简单的热热身吧。本来想用C语言的，但是不太熟，简单的输出一下调试信息都特别费劲。只能先换Python完成任务了。
但是Python写这个算法题真的太没劲了，一点精髓都get不到，只剩下这么几行简单没营养的代码了。或者下周学习一下C语言，改写成C语言版的吧。)

### 题目描述：
 给定字符串`J` 代表石头中宝石的类型，和字符串 `S`代表你拥有的石头。 `S` 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。

 `J` 中的字母不重复，`J` 和 `S`中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
示例 1:
```
输入: J = "aA", S = "aAAbbbb"
输出: 3
```
示例 2:
```
输入: J = "z", S = "ZZ"
输出: 0
```
注意:

    * `S` 和 `J` 最多含有50个字母。
    * `J` 中的字符不重复。

### 解题:
```python
class Solution(object):
    def numJewelsInStones(self, J, S):
        """
        :type J: str
        :type S: str
        :rtype: int
        """
        cnt = 0
        for i in S:
            if i in J:
                cnt +=1
        return cnt

```


## Review

读了一下 jekylly 的官方文档。因为是 GitHub Pages site 官方用的。
它支持以 Markdown 形式写文章，然后自动转化成 web 页面。
用 Markdown 文件来管理你的博客&笔记，同时又能以个人网站的形式展现。
非常赞。以后就用这种方式打卡了。

[jekyll step by step document](https://jekyllrb.com/docs/step-by-step/01-setup/)


在本地调试 git-pages 生成的样例，光看官方文档不管用。
代码拉下来后，参考这个文档就可以在本地成功运行了。

[git pages themes ReadMe](https://github.com/pages-themes/hacker)

接下来就是深度定制化，把菜单导航页什么的加上，需要结合 jekyll 官方文档上的知识点。

还需要具备的知识点是，Mastering Markdown

[Mastering Markdown 官方文档](https://guides.github.com/features/mastering-markdown/)

## Tips

kylin 的 topN 度量。当需要查询 topN 的时候，加上这个，可以极大的优化查询速度。
如果不加，它可能把所有的数据都扫一遍才能算出结果。
加上之后就会预计算出一些topN,查询的时候只需要在预计算好的结果里再取就好了。
但是也有人说，在某些条件下，取出来的数据会不是特别的精确。

一直没有抽时间好好详读 kylin 的官方文档，没有把每个功能的都介绍到了的官方文档好好读一下，导致工作中不断踩坑。

耗子叔分享过这一点，先花时间把官方文档读透能事半功倍。
但是实际操作中总是各种没时间，或者这件事情在实际操作过程中总是优先级靠后，导致最后没有时间干这个。


## Share
 share 一下 bash 的快捷键吧，用好快捷键，事半功倍。
 又是需要看好几遍的东西，下周再自己整理一遍不太熟悉的，作为Tips吧。
 
 [英文版 bash 快捷键](https://www.howtogeek.com/howto/ubuntu/keyboard-shortcuts-for-bash-command-shell-for-ubuntu-debian-suse-redhat-linux-etc/)

 [中文版 bash 快捷键](https://linuxtoy.org/archives/bash-shortcuts.html)
