; Вариант 10
; задачи +10 4 +5 16 +21 +28 31 35 41 +45 48


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

(defun property (x y)
    (if (eq (get x y) nil ) nil t)
    )

(setf (get 'movie 'title) '(Harry Potter))
(setf (get 'movie 'director) '(Chris Columbus))
(setf (get 'books 'two-author) '(nil))


(print(property 'movie 'director))
(print(property 'movie 'title))
(print(property 'movie 'year))
(print(property 'movie 'two-author))

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
;(print(subset '(1 2 ) '(2 3 4 5)))
;(print(proper-subset '() '(1 2 3 4 5)))
;(print(proper-subset '(1 2 3) '(1 2 3 4 5 6)))

(print(subset '(1 2 3) '(1 2 3 4 5 6)))
(print(subset '(1 2 ) '(2 3 4 5)))
(print(proper-subset '() '(1 2 3 4 5)))
(print(proper-subset '(1 2 3) '(1 2 3 4 5 6)))

________________________________________________________________________________________________________________________________________
;10. Определите функцию, осуществляющую удаление указанного количества последних элементов исходного списка.


(defun del-last (lst)
((lambda (первый)
	(cond
		((null (cddr lst)) (list первый))
		(t (cons первый (del-last (cdr lst))))
	)
)
(car lst)); первый = (car lst)
)

(defun del-n-last (lst n)
	(cond
		((= n 0) lst)
		(t (del-n-last (del-last lst) (- n 1)))
	)
	 
)


(print(del-n-last '(1 2 9 5 8 4) 3))

; 5 Определите функцию, которая увеличивает элементы исходного списка на единицу.

(defun inc-list (lst) 
      (
                    cond
                       ((null lst) NIL)
                       (t (cons (+ (car lst) 1) 
                                (inc-list(cdr lst)))
                       )
      )
  )

(print(inc-list '(2 3 4)))

; 21 Определите функцию, удаляющую из списка первое вхождение данного элемента на верхнем уровне.

(defun Del (mainList forDelete)
   ((lambda (head tail) 
      (cond 
         ((null mainList) nil)
         ((equal head forDelete) tail)
         (t (cons head (Del tail forDelete)))
      )
    )
    (car mainList)
    (cdr mainList)
   )
)
(print( Del '((1 2 3) 4 5 (1 2 3) 6)  '(1 2 3))) ;

;45. Напишите функцию (РАССТОЯНИЕ a b), вычисляющую расстояние между городами а и b.

(defun Road (city1 &optional(city2 `Bahchisaray)) 
  (sqrt (+ (expt (- (get city1 'x) (get city2 'x)) 2)
           (expt (- (get city1 'y) (get city2 'y)) 2))
  )
)
 
(defun City(Name-of-the-city &key x y ) 
    (setf (get Name-of-the-city 'x) x)
    (setf (get Name-of-the-city 'y) y)
  
)

(City  'New_York :x 1770 :y -445)
(City  'Simferopol :x -300 :y 50)


(print(Road 'New_York 'Simferopol))
(print(Road 'Simferopol 'New_York))


; 28. Определите функцию, вычисляющую, сколько всего атомов в списке (списочной структуре).

(defun atomCnt (l)
((lambda (последний)
  (cond ((null l) 0)
    ((atom (car l)) (+ 1 (atomCnt последний)))
    (t (atomCnt последний))))
    (cdr l)); последний = (cdr l)
    )
	
(print(atomCnt '(2 91 3 5)))
(print(atomCnt '(2 (4) 1 1)))
