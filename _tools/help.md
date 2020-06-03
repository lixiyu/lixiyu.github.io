
http://localhost:4000/arts/first_week.html

bundle exec jekyll serve


## 注意，容易内必须加上如下参数
bundle exec jekyll serve -H 0.0.0.0 
## 因为在电脑上访问时，由于端口映射，浏览器里的 http://127.0.0.1:4000/ 对于容器来说，并不是这个地址
