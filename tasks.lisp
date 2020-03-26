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

