; Ninty-Nine Lisp Problems

; Testings vars
(define x '(a b c a))

; P01: Find the last box of a list.
(define (find_last a)
  (car(reverse a))
  )
(find_last x)

; P02: Find the last but one box of a list.
(define (find_but_last a)
  (list-tail a 2)
  )
(find_but_last x)

; P03: Find the K'th element of a list.
(define (find_kth_ele a k)
  (list-ref a k)
  )
(find_kth_ele x 3)

; P04: Find the number of elements of a list.
(define (find_num_ele a)
  (length a)
  )
(find_num_ele x)

; P05: Reverse a list.
(define (reverse_list a)
  (reverse a)
  )
(reverse_list x)

; P06: Find if palindrome
(define palindrome
  (lambda (a si li) 
    (if (<= si li)
        (if (not(equal? (list-ref a si) (list-ref a li))) 
            #f
            (palindrome a (+ si 1) (- li 1))
            )
        #t
        )
    )
  )
(palindrome x 0 (- (length x) 1))

;P07: Flatten a nested list structure -- not working yet
;(define my-flatten
;  (lambda (a res ind)
;    (if (>= ind (length a))
;        res
;        (if (list? (list-ref a ind))
;            (my-flatten a (append (list-ref a ind) res) (+ ind 1))
;            (my-flatten a (list (list-ref a ind) res) (+ ind 1))
;            )    
;    )
;   )
;  )

;(my-flatten '((A B) (B (C D) E)) '() 0)

;P08 -- Pull out dublicates of the list
(define compress
  (lambda (n res ind)
    (if (>= ind (length n))
        res
        (if (member (list-ref n ind) res)
            (compress n res (+ ind 1))
            (compress n (cons (list-ref n ind) res) (+ ind 1))
            )
        )
    )
  )
(compress '(a a a a b c c a a d e e e e) '() 0)

; P14 -- Duplicate the elements of a list.
(define dupli
  (lambda (n res ind)
    (if (>= ind (length n))
        res
        (dupli n (append res (list (list-ref n ind) (list-ref n ind))) (+ ind 1))
        )
    )
  )
(dupli '(a b c c d) '() 0)

; P15 -- Replicate the elements of a list a given number of times.
(define its 
  (lambda (x i res)
    (if (> i 0)
        (its x (- i 1) (cons x res))
        res
        )
    )
  )
(define repli
  (lambda (n l res ind)
    (if (>= ind (length n))
        res
        (repli n l (append res (its (list-ref n ind) l '())) (+ ind 1))
        )
    )
  )
(repli '(a b c) 4 '() 0)