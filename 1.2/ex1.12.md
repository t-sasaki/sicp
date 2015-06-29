* http://sicp.iijlab.net/fulltext/x122.html#ex112

各要素をrow/col で指定し値を算出する `(pascal row col)` を定義する。  
以下、処理結果。

```scheme
> (pascal 1 1)
1

> (pascal 3 2)
2

> (pascal 2 3)
#f
```

`(pascal row col)` Pascal三角形 を表示するコードを定義してみる。  
以下、処理結果

```scheme
> (display-pascal-triangle 1)
1 

> (display-pascal-triangle 2)
1 
1 1 

> (display-pascal-triangle 3)
1 
1 1 
1 2 1 

> (display-pascal-triangle 4)
1 
1 1 
1 2 1 
1 3 3 1 

> (display-pascal-triangle 5)
1 
1 1 
1 2 1 
1 3 3 1 
1 4 6 4 1 
```
