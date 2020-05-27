;8.Напишите генератор натуральных чисел: 0, 1, 2, 3, 4, 5, ...

(defun generator()
	(let ((num 0))
		(lambda () (setq num (+ num 1)))
	)
)
 
(defun main ()
	(setq g1 (generator))
	(setq g2 (generator))
	(list 
		(funcall g1) 
		(funcall g1)
		(funcall g2) 
		(funcall g1) 
		(funcall g2)
		(funcall g1)
		(funcall g2)
	)
)
 
(print (main))


;10.Напишите генератор, порождающий последовательность (a), (b a), (a b a), (b a b a), ...

(defun generator ()
	(let 
		((lst nil) (next-el 'b))
		(lambda ()
			(if (eq next-el 'b) 
				(setq next-el 'a)
				(setq next-el 'b)
			)
			(setq lst (cons next-el lst))
		)
	)
)

(defun main ()
	(setq g1 (generator))
	(setq g2 (generator))
	(list 
		(funcall g1)
		(funcall g1)
		(funcall g1)
		(funcall g2)
		(funcall g1)
		(funcall g2)
		(funcall g2)
	)
)
(print (main))





;14.. Определите функцию, которая возвращает в качестве значения форму своего определения (DEFUN).


(defun self (arg)
	(list 'defun 'self (list 'arg))
)


(print(self 5))

;12.Определите функцию, которая возвращает в качестве значения свой вызов.


(defun yourself (&rest arg) 
	(if (atom arg)
		(list 'yourself arg)
		(append (list 'yourself) arg)
	)
)

(print(yourself 7))
(print(yourself 99))
(print(yourself '(1 2 3)) 
      
      
 ;2.Определите функционал (maplist fn список) для одного списочного аргумента

(defun MY_maplist (f lst)
	(cond
		((null lst) nil)
		(t 
			(cons (funcall f lst) 
			(MY_maplist f (cdr lst)))
		)
	)
)


(MY_maplist 'print '(1 3 5)) 
(MY_maplist 'print '(2 4 6 8)) 
