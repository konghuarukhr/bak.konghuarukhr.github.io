#lang eopl
;;; what is lost: store size is not dynamic any more

(define STORE-SIZE 1024)

(define empty-store
  (lambda () (make-vector STORE-SIZE)))

(define the-store 'uninitialized)
(define next-ref 'uninitialized)

(define get-store
  (lambda () the-store))

(define initialize-store!
  (lambda ()
    (set! the-store (empty-store))
    (set! next-ref -1)))

(define reference?
  (lambda (v)
    (integer? v)))

(define newref
  (lambda (val)
    (set! next-ref (+ next-ref 1))
    (vector-set! the-store next-ref val)
    next-ref))

(define deref
  (lambda (ref)
    (vector-ref the-store ref)))

(define setref!
  (lambda (ref val)
    (vector-set! the-store ref val)))
