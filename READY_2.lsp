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



;14.Определите функцию, которая возвращает в качестве значения свой вызов

(defun self (arg)
	(list 'defun 'self (list 'arg))
)


(print(self 5))

;12.Определите функцию, которая возвращает в качестве значения свой вызов


(defun yourself (&rest arg) 
	(if (atom arg)
		(list 'yourself arg)
		(append (list 'yourself) arg)
	)
)

(print(yourself 7))
(print(yourself 99))
(print(yourself '(1 2 3)) 
