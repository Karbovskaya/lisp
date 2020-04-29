;41. Реализовать генератор деревьев, чтобы выдаваемые им деревья имели количество вершин, точно соответствующее числу, указанному в его первом аргументе.

(defun tree1 (n k)
	
	(cond ((<= n k) nil)
		(t
        ((lambda (first)
            (list k (tree1 n first) (tree1 n (+ first 1))))
        (+ (* k 2) 1)))
	)

)
(defun tree(n)
        (tree1 n 0)
)
(print (tree 2))
(print (tree 3))
(print (tree 4))



;35 Определите функцию ПОДМНОЖЕСТВО, которая проверяет, является ли одно множество подмножеством другого. Определите также СОБСТ

(defun my-member(el lst)
	(cond
		((null lst) nil)
		((eq (car lst) el) t)
		(t (my-member el (cdr lst)))
	)
)

(defun subset(set1 set2)
	(cond
		((null set1) t)
		((my-member (car set1) set2) (subset (cdr set1) set2))
		(t nil)
	)
)

(defun proper-subset(set1 set2)
    (cond
        ((null set1) nil)
        ((and (subset set1 set2) (subset set2 set1)) t)
        (t nil)
    )
)

(print(subset '(1 2 3) '(1 2 3 4 5 6)))
(print(subset '(1 2 ) '(2 3 4 5)))
(print(proper-subset '() '(1 2 3 4 5)))
(print(proper-subset '(1 2 3) '(1 2 3 4 5 6)))
