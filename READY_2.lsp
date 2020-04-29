; 5 Определите функциональный предикат (НЕКОТОРЫй пред список), который истинен, когда, являющейся функциональным аргументом предикат пред истинен хотя бы для одного элемента списка список.

(defun any (pred l)
	(not (null (mapcan pred l)))
    
)
(print (any (lambda (x) (if (> x 3) (list t) nil)) '(1 2 3))) 
(print (any (lambda (x) (if (> x 5) (list t) nil)) '(4 5 6))) 
(print (any (lambda (x) (if (> x 10) (list t) nil)) '(2 8 9)))
