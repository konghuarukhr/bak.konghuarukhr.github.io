#lang eopl

;;; n = 0: <n> = ()
;;; n > 0: <n> = (r . <q>) where qN + r = n

(define N 100)
(define zero (lambda () '()))
(define is-zero? (lambda (n) (equal? n '())))
(define successor
  (lambda (n)
    (if (equal? n '()) '(1)
        (let ((r (+ (car n) 1)) (q (cdr n)))
          (if (< r N)
              (cons r q)
              (cons 0 (successor q)))))))
(define predecessor
  (lambda (n)
    (cond
      ((equal? n '()) (eopl:error 'predecessor "predecessor of zero not defined"))
      ((equal? n '(1)) '())
      (else
       (let ((r (- (car n) 1)) (q (cdr n)))
         (if (>= r 0)
             (cons r q)
             (cons (- N 1) (predecessor q))))))))
(define value
  (lambda (n)
    (if (equal? n '())
        0
        (+ (car n) (* (value (cdr n)) N)))))

(define plus
  (lambda (x y)
    (if (is-zero? x)
        y
        (plus (predecessor x) (successor y)))))
(define mul
  (lambda (x y)
    (letrec ((mul-inner (lambda (x p)
                          (if (is-zero? x)
                              p
                              (mul-inner (predecessor x) (plus y p))))))
      (mul-inner x (zero)))))
(define fac
  (lambda (n)
    (if (is-zero? n)
        (successor (zero))
        (mul n (fac (predecessor n))))))

(define one (lambda () (successor (zero))))
(define two (lambda () (successor (one))))
(define ten (lambda () (plus (two) (mul (mul (two) (two)) (two)))))
(time (fac (ten)))
(value (ten))
