; child-snack task with 6 children and 0.4 gluten factor 
; constant factor of 1.3
; random seed: 234324

(define (problem prob-snack)
  (:domain child-snack)
  (:objects
    number_0 number_1 number_2 number_3 number_4 number_5 number_6 - num
    child1 child2 child3 child4 child5 child6 - child
    tray1 tray2 - tray
    table1 table2 table3 - place
  )
  (:init
    (ontray number_0 number_0 tray2)
    (ontray number_0 number_0 tray1)
    (at_kitchen_content number_4 number_2)
    (at_kitchen_bread number_4 number_2)
    (at_kitchen_sandwich number_0 number_0)
    (next number_5 number_6)
    (next number_4 number_5)
    (next number_3 number_4)
    (next number_2 number_3)
    (next number_1 number_2)
    (next number_0 number_1)
    (served_childs number_0)
     (at tray1 kitchen)
     (at tray2 kitchen)
     (allergic_gluten child1)
     (allergic_gluten child5)
     (not_allergic_gluten child2)
     (not_allergic_gluten child3)
     (not_allergic_gluten child4)
     (not_allergic_gluten child6)
     (waiting child1 table2)
     (waiting child2 table1)
     (waiting child3 table3)
     (waiting child4 table2)
     (waiting child5 table1)
     (waiting child6 table1)
  )
  (:goal
    (served_childs number_6)
  )
)
