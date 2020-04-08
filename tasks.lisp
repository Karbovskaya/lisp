; Вариант 10
; задачи 10 4 5 16 21 28 31 35 41 45 48

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
  (cond ((null l) 0)
    ((atom (car l)) (+ 1 (atomCnt (cdr l))))
    (t (atomCnt (cdr l)))))
	
(print(atomCnt '(2 91 3)))
(print(atomCnt '(2 (4) 1 1)))

