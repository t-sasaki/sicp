* http://sicp.iijlab.net/fulltext/x125.html#ex120

(gcd 206 40) の正規順序評価と作用的順序評価のreminderの実行回数について、を置換えモデルを使って示してみる

ちなみに 正規順序評価と作業的順序評価の話はこの辺り

* http://sicp.iijlab.net/fulltext/x115.html
   * 正規順序評価 … 「完全に展開し, 簡約する」評価方法
   * 作業的順序評価 … 「引数を評価し, 作用させる」方法


## 正規順序評価

```scheme
(if (= 40 0) ;; #f
    206
    (gcd 40
         (remainder 206 40)))

(if (= (remainder 206 40) 0) ;; 6 ... #f -> 1回作用
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))


(if (= (remainder 40 (remainder 206 40)) 0) ;; 4 ... #f -> 2回作用
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (reminader (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))

(if (= (reminader (remainder 206 40)
                  (remainder 40 (remainder 206 40))) 0) ;; 2 ... #f -> 4回作用
    (remainder 40 (remainder 206 40))
    (gcd (reminader (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (reminader (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))

(if (= (remainder (remainder 40 (remainder 206 40))
                  (reminader (remainder 206 40)
                             (remainder 40 (remainder 206 40)))) 0) ;; 0 ... #t -> 7回作用
    (reminader (remainder 206 40)
               (remainder 40 (remainder 206 40))) ;; 4回作用
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (reminader (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (reminader (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (reminader (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))
;; 18回作用
```

## 作用的順序

```scheme
(if (= 40 0) ;; #f
    206
    (gcd 40 (remainder 206 40)))

;; 1回作用
(if (= 40 0)
    206
    (gcd 40 6))

(if (= 6 0) ;; #f
    40
    (gcd 6 (remainder 40 6)))

;; 1回作用
(if (= 6 0)
    40
    (gcd 6 4))

(if (= 4 0) ;; #f
    6
    (gcd 4 (remaider 6 4)))

;; 1回作用
(if (= 4 0)
    6
    (gcd 4 2))

(if (= 2 0) ;; #f
    4
    (gcd 2 (remainder 4 2)))

;; 1回作用
(if (= 2 0)
    4
    (gcd 2 0))

(if (= 0 0) ;; #t
    2
    (gcd 0 (remainder 2 0)))

2

;; 4回作用
```
