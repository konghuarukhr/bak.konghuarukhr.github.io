;;; n = 1: (one)
;;; n != 1: (diff diff-tree diff-tree)

(define (zero)
 '(diff (one) (one)))

(define (represent n)
 (if (equal? n '(one)) 1
  (- (represent (cadr n)) (represent (caddr n)))))

(define (is-zero? n)
 (= 0 (represent n)))

(define (successor n)
 (if (equal? '(one) n)
  '(diff (one) (diff (diff (one) (one)) (one)))
  (list 'diff (successor (cadr n)) (caddr n))))

(define (predecessor n)
 (if (equal? '(one) n)
  '(diff (one) (one))
  (list 'diff (predecessor (cadr n)) (caddr n))))
