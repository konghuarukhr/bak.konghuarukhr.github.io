#lang eopl

;;; n = 1: (one)
;;; n != 1: (diff diff-tree diff-tree)

(define zero (lambda () '(diff (one) (one))))
(define one (lambda () '(one)))
(define is-zero? (lambda (n) (= 0 (value n))))
(define successor
  (lambda (n)
    (list 'diff
          n
          (list 'diff (zero) (one)))))
(define predecessor
  (lambda (n)
    (list 'diff
          n
          (one))))
(define value
  (lambda (n)
    (if (equal? n '(one))
        1
        (- (value (cadr n)) (value (caddr n))))))
(define diff-tree-plus
  (lambda (x y)
    (let ((c (cadr y)) (d (caddr y)))
      (list 'diff x (list 'diff d c)))))