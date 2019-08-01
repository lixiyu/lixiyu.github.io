---

title: fourth_week
create_date: 2019-07-22
finish_date:
time_taken:

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

## Review
(阅读并点评至少一篇英文技术文章)


## Tips



## Share


一个学习 Linux 的网站，会教你从源码安装一个操作系统，但是需要 3个月到半年的时间才可能跑通一次
[Linux From Scratch LFS](http://www.linuxfromscratch.org/)

[耗子叔ARTS成果展](https://time.geekbang.org/column/article/107806)

[优秀的博客，各种好资源，好工具，常看看](https://elfgzp.cn/timeline.html)

[c语言 二维数组内存分配demo](https://blog.csdn.net/handsome_926/article/details/8233744)


### 好用的 API 文档工具

[YApi](https://hellosean1025.github.io/yapi/)

[swagger](https://swagger.io/)

[postman](https://www.getpostman.com/)


