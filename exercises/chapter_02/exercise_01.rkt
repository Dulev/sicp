#lang sicp

(define (gcd a b)
    (if (= b 0)
        (abs a)
        (gcd b (remainder a b))))

(define (make-rat n0 d0)
    (define (reduce n d)
        (let ((g (gcd n d)))
            (cons (/ n g) (/ d g))))
    (define (fix-signs n d)
        (let ((negative (< (* n d) 0)))
            (if negative
                (reduce (- (abs n)) (abs d))
                (reduce (abs n) (abs d)))))
    (fix-signs n0 d0))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))
(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))
(define (equal-rat? x y)
    (= (* (numer x) (denom y))
       (* (numer y) (denom x))))

(define (print-rat x)
    (display (numer x))
    (display "/")
    (display (denom x))
    (newline))