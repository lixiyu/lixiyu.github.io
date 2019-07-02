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

来源：力扣（LeetCode）<br/>
链接：https://leetcode-cn.com/problems/basic-calculator <br/>
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。<br/>


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

```

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
(学习至少一个技术技巧)


## Share
(分享一篇有观点和思考的技术文章)




[]()
