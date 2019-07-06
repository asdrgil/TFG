(define (problem prob-snack)
(:domain child-snack)
(:objects
tray1 tray2  - tray
sandwich-property1-none notexist-true no_gluten_sandwich-true  - sandwich-property1
bread-portion-property1-none at_kitchen_bread-true  - bread-portion-property1
content-portion-property2-none no_gluten_content-true  - content-portion-property2
bread-portion-bag1 bread-portion-bag2  - bread-portion
bread-portion-property2-none no_gluten_bread-true  - bread-portion-property2
sandwich-bag1  - sandwich
sandwich-num1 sandwich-num2 sandwich-num3 sandwich-num4 sandwich-num5 sandwich-num6
sandwich-num7 sandwich-num8 sandwich-num0  - sandwich-num
bread-portion-num1 bread-portion-num2 bread-portion-num3 bread-portion-num4
bread-portion-num0  - bread-portion-num
content-portion-num1 content-portion-num2 content-portion-num3 content-portion-num4
content-portion-num0  - content-portion-num
content-portion-bag1 content-portion-bag2  - content-portion
sandwich-property2-none at_kitchen_sandwich-true notexist-true2  - sandwich-property2
content-portion-property1-none at_kitchen_content-true  - content-portion-property1
child1 child2 child3 child4 child5 child6  - child
kitchen table1 table2 table3  - place
)
(:init (at tray2 kitchen)
(waiting child2 table1)
(at tray1 kitchen)
(waiting child1 table2)
(waiting child3 table3)
(allergic_gluten child1)
(waiting child6 table1)
(allergic_gluten child5)
(waiting child4 table2)
(waiting child5 table1)
(bread-portion-less bread-portion-num1 bread-portion-num2)
(bread-portion-less bread-portion-num2 bread-portion-num3)
(bread-portion-less bread-portion-num3 bread-portion-num4)
(content-portion-less content-portion-num1 content-portion-num2)
(content-portion-less content-portion-num2 content-portion-num3)
(content-portion-less content-portion-num3 content-portion-num4)
(sandwich-less sandwich-num1 sandwich-num2)
(sandwich-less sandwich-num2 sandwich-num3)
(sandwich-less sandwich-num3 sandwich-num4)
(sandwich-less sandwich-num4 sandwich-num5)
(sandwich-less sandwich-num5 sandwich-num6)
(sandwich-less sandwich-num6 sandwich-num7)
(sandwich-less sandwich-num7 sandwich-num8)
(count-bread-portion bread-portion-bag1 at_kitchen_bread-true
bread-portion-property2-none bread-portion-num4)
(count-bread-portion bread-portion-bag2 at_kitchen_bread-true no_gluten_bread-true
bread-portion-num2)
(count-content-portion content-portion-bag1 at_kitchen_content-true
content-portion-property2-none content-portion-num4)
(count-content-portion content-portion-bag2 at_kitchen_content-true no_gluten_content-true
content-portion-num2)
(count-sandwich sandwich-bag1 notexist-true notexist-true2 sandwich-num8)
(bread-portion-less bread-portion-num0 bread-portion-num1)
(content-portion-less content-portion-num0 content-portion-num1)
(sandwich-less sandwich-num0 sandwich-num1)
(count-bread-portion bread-portion-bag1 bread-portion-property1-none
bread-portion-property2-none bread-portion-num0)
(count-bread-portion bread-portion-bag1 at_kitchen_bread-true no_gluten_bread-true
bread-portion-num0)
(count-bread-portion bread-portion-bag1 bread-portion-property1-none no_gluten_bread-true
bread-portion-num0)
(count-bread-portion bread-portion-bag2 bread-portion-property1-none
bread-portion-property2-none bread-portion-num0)
(count-bread-portion bread-portion-bag2 at_kitchen_bread-true
bread-portion-property2-none bread-portion-num0)
(count-bread-portion bread-portion-bag2 bread-portion-property1-none
no_gluten_bread-true bread-portion-num0)
(count-content-portion content-portion-bag1 content-portion-property1-none
content-portion-property2-none content-portion-num0)
(count-content-portion content-portion-bag1 at_kitchen_content-true
no_gluten_content-true content-portion-num0)
(count-content-portion content-portion-bag1 content-portion-property1-none
no_gluten_content-true content-portion-num0)
(count-content-portion content-portion-bag2 content-portion-property1-none
content-portion-property2-none content-portion-num0)
(count-content-portion content-portion-bag2 at_kitchen_content-true
content-portion-property2-none content-portion-num0)
(count-content-portion content-portion-bag2 content-portion-property1-none
no_gluten_content-true content-portion-num0)
(count-sandwich sandwich-bag1 sandwich-property1-none sandwich-property2-none
sandwich-num0)
(count-sandwich sandwich-bag1 notexist-true sandwich-property2-none sandwich-num0)
(count-sandwich sandwich-bag1 no_gluten_sandwich-true sandwich-property2-none
sandwich-num0)
(count-sandwich sandwich-bag1 no_gluten_sandwich-true at_kitchen_sandwich-true
sandwich-num0)
(count-sandwich sandwich-bag1 notexist-true at_kitchen_sandwich-true sandwich-num0)
(count-sandwich sandwich-bag1 sandwich-property1-none at_kitchen_sandwich-true
sandwich-num0)
(count-sandwich sandwich-bag1 sandwich-property1-none notexist-true2 sandwich-num0)
(count-sandwich sandwich-bag1 no_gluten_sandwich-true notexist-true2 sandwich-num0)
(count-sandwich sandwich-bag1 no_gluten_sandwich-true tray1 sandwich-num0)
(count-sandwich sandwich-bag1 notexist-true tray1 sandwich-num0)
(count-sandwich sandwich-bag1 sandwich-property1-none tray1 sandwich-num0)
(count-sandwich sandwich-bag1 sandwich-property1-none tray2 sandwich-num0)
(count-sandwich sandwich-bag1 notexist-true tray2 sandwich-num0)
(count-sandwich sandwich-bag1 no_gluten_sandwich-true tray2 sandwich-num0)
(bread-portion-bag-size bread-portion-bag1 bread-portion-num4)
(bread-portion-bag-size bread-portion-bag2 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num0 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num1 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num2 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num3 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num4 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num0 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num1 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num2 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num3 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num2 bread-portion-num0 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num2 bread-portion-num1 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num2 bread-portion-num2 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num3 bread-portion-num0 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num3 bread-portion-num1 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num4 bread-portion-num0 bread-portion-num4)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num0 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num1 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num0 bread-portion-num2 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num0 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num1 bread-portion-num1 bread-portion-num2)
(bread-portion-lte-sum bread-portion-num2 bread-portion-num0 bread-portion-num2)
(content-portion-bag-size content-portion-bag1 content-portion-num4)
(content-portion-bag-size content-portion-bag2 content-portion-num2)
(content-portion-lte-sum content-portion-num0 content-portion-num0 content-portion-num4)
(content-portion-lte-sum content-portion-num0 content-portion-num1 content-portion-num4)
(content-portion-lte-sum content-portion-num0 content-portion-num2 content-portion-num4)
(content-portion-lte-sum content-portion-num0 content-portion-num3 content-portion-num4)
(content-portion-lte-sum content-portion-num0 content-portion-num4 content-portion-num4)
(content-portion-lte-sum content-portion-num1 content-portion-num0 content-portion-num4)
(content-portion-lte-sum content-portion-num1 content-portion-num1 content-portion-num4)
(content-portion-lte-sum content-portion-num1 content-portion-num2 content-portion-num4)
(content-portion-lte-sum content-portion-num1 content-portion-num3 content-portion-num4)
(content-portion-lte-sum content-portion-num2 content-portion-num0 content-portion-num4)
(content-portion-lte-sum content-portion-num2 content-portion-num1 content-portion-num4)
(content-portion-lte-sum content-portion-num2 content-portion-num2 content-portion-num4)
(content-portion-lte-sum content-portion-num3 content-portion-num0 content-portion-num4)
(content-portion-lte-sum content-portion-num3 content-portion-num1 content-portion-num4)
(content-portion-lte-sum content-portion-num4 content-portion-num0 content-portion-num4)
(content-portion-lte-sum content-portion-num0 content-portion-num0 content-portion-num2)
(content-portion-lte-sum content-portion-num0 content-portion-num1 content-portion-num2)
(content-portion-lte-sum content-portion-num0 content-portion-num2 content-portion-num2)
(content-portion-lte-sum content-portion-num1 content-portion-num0 content-portion-num2)
(content-portion-lte-sum content-portion-num1 content-portion-num1 content-portion-num2)
(content-portion-lte-sum content-portion-num2 content-portion-num0 content-portion-num2)
(sandwich-bag-size sandwich-bag1 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num4 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num5 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num6 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num7 sandwich-num8)
(sandwich-lte-sum sandwich-num0 sandwich-num8 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num4 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num5 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num6 sandwich-num8)
(sandwich-lte-sum sandwich-num1 sandwich-num7 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num4 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num5 sandwich-num8)
(sandwich-lte-sum sandwich-num2 sandwich-num6 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num4 sandwich-num8)
(sandwich-lte-sum sandwich-num3 sandwich-num5 sandwich-num8)
(sandwich-lte-sum sandwich-num4 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num4 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num4 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num4 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num4 sandwich-num4 sandwich-num8)
(sandwich-lte-sum sandwich-num5 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num5 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num5 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num5 sandwich-num3 sandwich-num8)
(sandwich-lte-sum sandwich-num6 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num6 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num6 sandwich-num2 sandwich-num8)
(sandwich-lte-sum sandwich-num7 sandwich-num0 sandwich-num8)
(sandwich-lte-sum sandwich-num7 sandwich-num1 sandwich-num8)
(sandwich-lte-sum sandwich-num8 sandwich-num0 sandwich-num8)
)
(:goal (and
	  (served child1)
	  (served child2)
	  (served child3)
	  (served child4)
	  (served child5)
	  (served child6))
)
)
