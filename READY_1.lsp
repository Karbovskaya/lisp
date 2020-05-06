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



