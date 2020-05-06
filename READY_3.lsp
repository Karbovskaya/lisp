;1.Определите макрос, который возвращает свой вызов

(defmacro myself (&rest args)
    `(quote (myself ,@args))
)


(print(myself 15))
(print(myself b c (g) e))

;3.Определите лисповскую форму (if условие p q) в виде макроса

(defmacro my_if (my_cond p q)
    `(if ,my_cond ,p ,q)
)
(print(my_if (> 4 7) t nil))
(print(my_if (> 8 1) t nil))
(print(my_if (atom '(3)) t nil))
