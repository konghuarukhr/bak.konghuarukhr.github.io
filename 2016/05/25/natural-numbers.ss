;;; n = 0: <n> = ()
;;; n > 0: <n> = (r . <q>) where qN + r = n

(define (zero)
  '())

(define (is-zero? n)
  (null? n))

(define (successor n)
  (if (null? n)
      '(1)
    (let ((r (+ 1 (car n))) (q (cdr n)))
      (if (= N r)
          (cons 0 (successor q))
        (cons r q)))))

(define (predecessor n)
  (if (equal? '(1) n)
      '()
    (let ((r (car n)) (q (cdr n)))
      (if (= 0 r)
          (cons (- N 1) (predecessor q))
        (cons (- r 1) q)))))

(define (add n m)
  (if (is-zero? n)
      m
    (add (predecessor n) (successor m))))

(define (mul n m)
  (letrec ((inner-mul (lambda (n s)
                        (if (is-zero? n) s
                          (inner-mul (predecessor n) (add m s))))))
          (inner-mul n (zero))))

(define (fac n) (if (is-zero? n) (successor n) (mul n (fac (predecessor n)))))
