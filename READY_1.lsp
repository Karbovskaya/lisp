
;31.Определите функцию (ПЕРВЫЙ-СОВПАДАЮЩИЙ х у), которая возвращает первый
;элемент, входящий в оба списка х и у, в противном случае NIL.


(defun f(a l)
      (cond
         ((null l) nil)
         ((eq a (car l)) a)
         (t( f a (cdr l)))
      )
)

(defun lis (l1 l2)
 ((lambda (first res)
      (cond
         ((null l1) nil)
         ((eq first (f first l2)) first)
         (t( lis res l2))
       )
         )(car l1)(cdr l1))
)


(print (lis '(1 2 3) '(4 9 0)))
(print (lis '(1 2 3) '(5 3 4)))


;48. Функция GET возвращает в качестве результата NIL в том случае, если у символа нет данного свойства, либо если значением этого свойства является NIL.
;Следовательно, функцией GET нельзя проверить, есть ли некоторое свойство в
;списке свойств. Напишите предикат (ИМЕЕТ-СВОЙСТВО символ свойство), который проверяет, обладает ли символ данным свойством.

(defun Property(x prop)
  (FindProp prop (symbol-plist x))
)


(defun FindProp(prop list)
  (cond
      ((null list) nil)
      ((equal prop (car list)) T)
      (T (FindProp prop (cddr list)))
  )
)

(setf (get 'movie 'title) '(Harry Potter))
(setf (get 'movie 'director) '(Chris Columbus))
(setf (get 'books 'two-author) '(nil))


(print(Property 'movie 'director))
(print(Property 'movie 'title))
(print(Property 'movie 'year))
(print(Property 'movie 'two-author))

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
