## 再帰的プロセス版

* 手続き定義
```scheme
(define (f n)
  (if (< n 3)
	n
	(+ (f (- n 1))
	   (* 2 (f (- n 2)))
	   (* 3 (f (- n 3))))))
```

* 実行結果
```scheme
> (f 0)
0

> (f 1)
1

> (f 2)
2

> (f 3)
4

> (f 4)
11

> (f 5)
25
```

## 反復的プロセス

* 手続き定義
```scheme
(define (f n)
  (define (f-iter a b c count)
	(if (< count 3)
	  a
	  (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< n 3)
	n
	(f-iter 2 1 0 n)))
```

* 処理結果
```
> (f 0)
0

> (f 1)
1

> (f 2)
2

> (f 3)
4

> (f 4)
11

> (f 5)
25
```
