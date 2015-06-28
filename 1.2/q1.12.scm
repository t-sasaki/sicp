(define (pascal row col)
  (cond ((< row col) #f)
   		((= col 1) 1)
		((= row col) 1)
		(else (+ (pascal (- row 1) (- col 1))
				 (pascal (- row 1) col)))))

(print (pascal 1 1))
(print (pascal 2 1) " " (pascal 2 2))
(print (pascal 3 1) " " (pascal 3 2) " " (pascal 3 3))
(print (pascal 4 1) " " (pascal 4 2) " " (pascal 4 3) " " (pascal 4 4))
(print (pascal 5 1) " " (pascal 5 2) " " (pascal 5 3) " " (pascal 5 4) " " (pascal 5 5))

(print (pascal 2 3))
