---

title: third_week
create_date:   2019-07-01

---


## AIgorithm


### [题目描述](https://leetcode-cn.com/problems/basic-calculator/)：


实现一个基本的计算器来计算一个简单的字符串表达式的值。

字符串表达式可以包含左括号 ( ，右括号 )，加号 + ，减号 -，非负整数和空格  。

示例 1:
```
输入: "1 + 1"
输出: 2
```
示例 2:
```
输入: " 2-1 + 2 "
输出: 3
```
示例 3:
```
输入: "(1+(4+5+2)-3)+(6+8)"
输出: 23
```



### 解题:

#### 数组版

```C

int calculate(char * s){
    int opts[10000] = {0};
    int nums[10000] = {0};
    int opts_len = 0, nums_len=0;
    int empty = ' ';
    int add = '+';
    int sub = '-';
    int zero = '0';
    int nine = '9';
    int l = '(';
    int r = ')';
    int end = '\0';
    int num;
    int this;
    
    while(1){
        this = *s;
        s++;
        if(end != this){
        }else{
            // printf("get the end %c, %d \n", this, this);
        }
        if(empty == this){
            continue;
        }
        if(this >= zero && this <= nine){
            num = this - zero;
            if(opts_len>0 && opts[opts_len-1]==0){
                nums[nums_len-1] = nums[nums_len-1]*10 + num;
            }else{
                opts[opts_len] = 0;
                opts_len++;
                nums[nums_len] = num;
                nums_len++;
            }
        }
        if(add == this || sub == this || l == this || r == this || end == this ){
            while(opts_len>=3 && nums_len>=2 && opts[opts_len-1]==0 && opts[opts_len-3]==0 && opts[opts_len-2]!=0){
                if(opts[opts_len-2] == sub){
                    nums[nums_len-2] = nums[nums_len-2] - nums[nums_len-1];
                    nums_len--;
                    opts_len-=2;
                    continue;
                }
                if(opts[opts_len-2] == add){
                    nums[nums_len-2] = nums[nums_len-2] + nums[nums_len-1];
                    nums_len--;
                    opts_len-=2;
                    continue;
                } 
                if(opts[opts_len-2] == l){
                    break;
                }
            }
            if(r == this)
            {
                if(opts_len>=2 && opts[opts_len-2]==l){
                    opts[opts_len-2] = opts[opts_len-1];
                    opts_len--;
                }else if(opts[opts_len-1]==l)
                {
                    opts_len--;
                }
            }
            if(add == this || sub == this || l == this ){
                opts[opts_len] = this;
                opts_len++;
            }  
            if(end == this){
                break;
            }
        }

    }
    return nums[0];
}


```

#### 链表版

> 这种方法原来比直接用数组蠢一些，运行时间更长了(上一版的4、5备)，占用内存更多了(上一版的5倍)。本来是想减小内存占用的...

```C

#include <stdlib.h> 

typedef struct Item {
    int type;     //1:数字, 2:+, 3:-， 4: (
    int num;
    struct Item *before;
} Item;

int calculate(char * s){
    
    Item *p_item;
    int len = 0;
    int num, this;
    
    while(1){
        this = *s;
        s++;
        if('\0' != this){
        }else{
            // printf("get the end %c, %d \n", this, this);
        }
        if(' ' == this){
            continue;
        }
        printf("this is %c \n", this);
        if(this >= '0' && this <= '9'){
            num = this - '0';
            if(len>0 && p_item->type == 1){
                p_item->num = p_item->num*10+num;
            }else{
                Item *item;
                item = (Item *) malloc(sizeof(Item));
                item->type = 1;
                item->num = num;
                item->before = p_item;
                p_item = item;
                len++;
            }
        }
        if('+' == this || '-' == this || '(' == this || ')' == this || '\0' == this ){
            while(
                len>=3 && p_item->type==1 && p_item->before->before->type==1 && 
                (p_item->before->type==2 || p_item->before->type==3)
            ){
                if( p_item->before->type == 2){
                    p_item->before->before->num += p_item->num;
                    len-=2;
                    Item *item = p_item->before->before;
                    free(p_item->before);
                    free(p_item);
                    p_item = item;
                }else
                if(p_item->before->type == 3){
                    p_item->before->before->num -= p_item->num;
                    len-=2;
                    Item *item = p_item->before->before;
                    free(p_item->before);
                    free(p_item);
                    p_item = item;
                } 
            }
            if(')' == this){
                if(len>=2 && p_item->before->type==4){
                    Item *item;
                    if(len>=3){
                        item = p_item->before->before;
                    }
                    free(p_item->before);
                    p_item->before = item;
                    len--;
                }else if(p_item->type==4)
                {
                    Item *item = p_item->before;
                    free(p_item);
                    p_item = item;
                    len--;
                }
            }
            if('+' == this ){
                Item *item;
                item = (Item *) malloc(sizeof(Item));
                item->type = 2;
                item->before = p_item;
                p_item = item;
                len++;
            }
            if('-' == this ){
                Item *item;
                item = (Item *) malloc(sizeof(Item));
                item->type = 3;
                item->before = p_item;
                p_item = item;
                len++;
            }
            if('(' == this ){
                Item *item;
                item = (Item *) malloc(sizeof(Item));
                item->type = 4;
                item->before = p_item;
                p_item = item;
                len++;
            }
            if('\0' == this){
                printf("breaked...");
                break;
            }
        }
    }   
    return p_item->num;
}

```

## Review
(阅读并点评至少一篇英文技术文章)


## Tips

> 分享几个特别特别小的Tips 吧。

### 1. kibana 里怎么模糊搜索，虽然很简单，但是被这个问题堵了好几次了，每次都不能很容易的搜到解决方案

   输入框里填上 `*your_key_words*`， `*`表示通配符，对，就是这么简单。<br/>
   但是千万不要往外加任何单双引号等任何东西，否则会导致什么也搜不到<br/>
   这个问题之所以烦人，是因为每次搜 kibana 模糊搜索 的时候，总是更容易看到一些用法特别复杂的博客<br/>
   因此附上一个质量较好的博客地址: [ELK：kibana使用的lucene查询语法](https://segmentfault.com/a/1190000002972420)

### 2. presot 如何给 json 里解出来的数组加上序号。并且只保留每个 json 里排序前三的数据。

>   就是把这个表:

   | id | value |
   |----|-------|
   | 1  | [{"n":"11494","s":587},{"n":"174647","s":344},{"n":"16394","s":343},{"n":"63573","s":333}] |
   | 2  | [{"n":"10129","s":56}] |

>   拆成这样,且只保留每行数据里的前三个:

   | id | num| value_n | value_s |
   |----|----|---------|---------|
   | 1  | 1  | 11494   |  587    |
   | 1  | 2  | 174647  |  344    |
   | 1  | 3  | 16394   |  343    |
   | 2  | 1  | 10129   |  56     |


>   方法就是这个(可能是最二的办法了, 思路直接看代码&查文档吧)：

```

    select
        id,
        explode_value['num'] as num,
        explode_value['n'] as vlaue_n,
        explode_value['s'] as value_s
    from
        table_name
    cross join UNNEST(filter(zip_with(sequence(1,3), cast(JSON_PARSE(value) as ARRAY(MAP(VARCHAR, integer))), (x,y)-> map_concat(y,map(ARRAY['num'],ARRAY[x]))), x-> x IS NOT NULL AND x['num'] IS NOT NULL)) as t(explode_value)

```



## Share
(分享一篇有观点和思考的技术文章)


docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock lazyteam/lazydocker


[ libra 官网 ](https://libra.org/zh-CN/?noredirect=zh-Hans-CN) <br/>
[如何学好C语言](https://coolshell.cn/articles/4102.html/comment-page-5) <br/>
[Syncd 自动化部署工具](https://syncd.cc/docs/#/) <br/>
[curl 花式用法](https://www.cnblogs.com/hujiapeng/p/8470099.html) <br/>
