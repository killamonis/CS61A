(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (define (count-index i s)
    (if (null? s)
      '()
      (cons (list i (car s)) (count-index (+ i 1) (cdr s)))
    )
  )
  (count-index 0 s)

)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  (cond ((null? list1) list2)
        ((null? list2) list1)
        ((comp (car list1) (car list2)) (append (car list1)  ))

  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    (define (helper1 s2)
      (cond ((null? s2) '())
            ((null? (cdr s2)) (list s2))
            ((> (car s2) (car (cdr s2)))
              (cons (list (car s2)) (helper1 (cdr s2)))
            )
            (else
              (define rest (helper1 (cdr s2)))
                (cons (list (car s2) (car next)) (cdr s2))
            )
    
      )
    )
    (helper1 s)
)
    ; END PROBLEM 17


(define (nondecreaselist s) 
  (cond ((null? s) '())
        ((null? (cdr s)) (list s))
        ((> (car s) (cadr s))
         (cons (list (car s))
               (nondecreaselist (cdr s))))
        (else
         (let ((next (nondecreaselist (cdr s))))
           (cons (cons (car s)
                       (car next))
                 (cdr next))))))