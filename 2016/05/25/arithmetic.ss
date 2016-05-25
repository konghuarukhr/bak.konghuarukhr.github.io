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
