(define (domain child-snack)
    (:requirements :equality :typing)
    (:types child bread-portion content-portion sandwich tray place bread-portion-property1
    bread-portion-property2 bread-portion-num content-portion-property1
    content-portion-property2 content-portion-num sandwich-property1 sandwich-property2
    sandwich-num - object )
    (:constants at_kitchen_bread-true - bread-portion-property1 no_gluten_bread-true
    - bread-portion-property2 bread-portion-property1-none - bread-portion-property1
    at_kitchen_content-true - content-portion-property1 no_gluten_content-true -
    content-portion-property2 content-portion-property1-none - content-portion-property1
    notexist-true - sandwich-property1 notexist-true2 -sandwich-property2
    no_gluten_sandwich-true - sandwich-property1 at_kitchen_content-true -
    content-portion-property1 at_kitchen_sandwich-true - object sandwich-property1-none -
    sandwich-property1 kitchen - place sandwich-property2-none - sandwich-property2)
    
    (:predicates
        (allergic_gluten ?c - child)
        (served ?c - child)
        (waiting ?c - child ?p - place)
        (at ?t - tray ?p - place)
        (bread-portion-less ?l - bread-portion-num ?m - bread-portion-num)
        (count-bread-portion ?bread-portion - bread-portion ?bread-portion-property1 -
        bread-portion-property1 ?bread-portion-property2 - bread-portion-property2
        ?bread-portion-num - bread-portion-num)
        (content-portion-less ?l - content-portion-num ?m - content-portion-num)
        (count-content-portion ?content-portion - content-portion ?content-portion-property1
        - content-portion-property1 ?content-portion-property2 - content-portion-property2
        ?content-portion-num - content-portion-num)
        (sandwich-less ?l - sandwich-num ?m - sandwich-num)
        (count-sandwich ?sandwich - sandwich ?sandwich-property1 - sandwich-property1
        ?sandwich-property2 - object ?sandwich-num - sandwich-num)
        (bread-portion-lte-sum ?sum1 - bread-portion-num ?sum2 - bread-portion-num ?lte -
        bread-portion-num)
        (bread-portion-bag-size ?bag - bread-portion ?size - bread-portion-num)
        (content-portion-lte-sum ?sum1 - content-portion-num ?sum2 - content-portion-num
        ?lte - content-portion-num)
        (content-portion-bag-size ?bag - content-portion ?size - content-portion-num)
        (sandwich-lte-sum ?sum1 - sandwich-num ?sum2 - sandwich-num ?lte - sandwich-num)
        (sandwich-bag-size ?bag - sandwich ?size - sandwich-num))

    (:action make_sandwich_no_gluten
        :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?n1 -
        bread-portion-num ?n0 - bread-portion-num ?n2 - bread-portion-num ?n3 -
        bread-portion-num ?n4 - content-portion-num ?n5 - content-portion-num ?n6 -
        content-portion-num ?n7 - content-portion-num ?n8 - sandwich-num ?n9 - sandwich-num
        ?n10 - sandwich-num ?n11 - sandwich-num ?b-size - bread-portion-num ?c-size -
        content-portion-num ?s-size - sandwich-num)

        :precondition (and
            (count-bread-portion ?b at_kitchen_bread-true no_gluten_bread-true ?n1)
            (bread-portion-less ?n0 ?n1)
            (count-bread-portion ?b bread-portion-property1-none no_gluten_bread-true ?n2)
            (bread-portion-less ?n2 ?n3)
            (count-content-portion ?c at_kitchen_content-true no_gluten_content-true ?n4)
            (content-portion-less ?n5 ?n4)
            (count-content-portion ?c content-portion-property1-none no_gluten_content-true
            ?n6)
            (content-portion-less ?n6 ?n7)
            (count-sandwich ?s notexist-true notexist-true2 ?n8)
            (sandwich-less ?n9 ?n8)
            (count-sandwich ?s no_gluten_sandwich-true at_kitchen_sandwich-true ?n10)
            (sandwich-less ?n10 ?n11)
            (bread-portion-lte-sum ?n1 ?n2 ?b-size)
            (bread-portion-bag-size ?b ?b-size)
            (content-portion-lte-sum ?n4 ?n6 ?c-size)
            (content-portion-bag-size ?c ?c-size)
            (sandwich-lte-sum ?n8 ?n10 ?s-size)
            (sandwich-bag-size ?s ?s-size))

        :effect (and
            (count-bread-portion ?b at_kitchen_bread-true no_gluten_bread-true ?n0)
            (not (count-bread-portion ?b at_kitchen_bread-true no_gluten_bread-true ?n1))
            (count-bread-portion ?b bread-portion-property1-none no_gluten_bread-true
            ?n3)
            (not (count-bread-portion ?b bread-portion-property1-none no_gluten_bread-true
            ?n2))
            (count-content-portion ?c at_kitchen_content-true no_gluten_content-true ?n5)
            (not (count-content-portion ?c at_kitchen_content-true no_gluten_content-true
            ?n4))
            (count-content-portion ?c content-portion-property1-none no_gluten_content-true
            ?n7)
            (not (count-content-portion ?c content-portion-property1-none no_gluten_content-true
            ?n6))
            (count-sandwich ?s notexist-true notexist-true2 ?n9)
            (not (count-sandwich ?s notexist-true notexist-true2 ?n8))
            (count-sandwich ?s no_gluten_sandwich-true at_kitchen_sandwich-true ?n11)
            (not (count-sandwich ?s no_gluten_sandwich-true at_kitchen_sandwich-true ?n10)))
    )

    (:action make_sandwich
        :parameters (?s - sandwich ?b - bread-portion ?c - content-portion ?dc -
        bread-portion-property2 ?n1 - bread-portion-num ?n0 - bread-portion-num ?n2 -
        bread-portion-num ?n3 - bread-portion-num ?dc2 - content-portion-property2 ?n4 -
        content-portion-num ?n5 - content-portion-num ?n6 - content-portion-num ?n7 -
        content-portion-num ?n8 - sandwich-num ?n9 - sandwich-num ?n10 - sandwich-num ?n11 -
        sandwich-num ?b-size - bread-portion-num ?c-size - content-portion-num ?s-size -
        sandwich-num)

        :precondition (and
            (count-bread-portion ?b at_kitchen_bread-true ?dc ?n1)
            (bread-portion-less ?n0 ?n1)
            (count-bread-portion ?b bread-portion-property1-none ?dc ?n2)
            (bread-portion-less ?n2 ?n3)
            (count-content-portion ?c at_kitchen_content-true ?dc2 ?n4)
            (content-portion-less ?n5 ?n4)
            (count-content-portion ?c content-portion-property1-none ?dc2 ?n6)
            (content-portion-less ?n6 ?n7)
            (count-sandwich ?s notexist-true notexist-true2 ?n8)
            (sandwich-less ?n9 ?n8)
            (count-sandwich ?s sandwich-property1-none at_kitchen_sandwich-true ?n10)
            (sandwich-less ?n10 ?n11)
            (bread-portion-lte-sum ?n1 ?n2 ?b-size)
            (bread-portion-bag-size ?b ?b-size)
            (content-portion-lte-sum ?n4 ?n6 ?c-size)
            (content-portion-bag-size ?c ?c-size)
            (sandwich-lte-sum ?n8 ?n10 ?s-size)
            (sandwich-bag-size ?s ?s-size))

        :effect (and
            (count-bread-portion ?b at_kitchen_bread-true ?dc ?n0)
            (not (count-bread-portion ?b at_kitchen_bread-true ?dc ?n1))
            (count-bread-portion ?b bread-portion-property1-none ?dc ?n3)
            (not (count-bread-portion ?b bread-portion-property1-none ?dc ?n2))
            (count-content-portion ?c at_kitchen_content-true ?dc2 ?n5)
            (not (count-content-portion ?c at_kitchen_content-true ?dc2 ?n4))
            (count-content-portion ?c content-portion-property1-none ?dc2 ?n7)
            (not (count-content-portion ?c content-portion-property1-none ?dc2 ?n6))
            (count-sandwich ?s notexist-true notexist-true2 ?n9)
            (not (count-sandwich ?s notexist-true notexist-true2 ?n8))
            (count-sandwich ?s sandwich-property1-none at_kitchen_sandwich-true ?n11)
            (not (count-sandwich ?s sandwich-property1-none at_kitchen_sandwich-true ?n10)))
    )

    (:action put_on_tray
        :parameters (?s - sandwich ?t - tray ?dc - sandwich-property1 ?n1 - sandwich-num ?n0 -
        sandwich-num ?n2 - sandwich-num ?n3 - sandwich-num ?s-size - sandwich-num)

        :precondition (and
            (at ?t kitchen)
            (count-sandwich ?s ?dc at_kitchen_sandwich-true ?n1)
            (sandwich-less ?n0 ?n1)
            (count-sandwich ?s ?dc ?t ?n2)
            (sandwich-less ?n2 ?n3)
            (sandwich-lte-sum ?n1 ?n2 ?s-size)
            (sandwich-bag-size ?s ?s-size))

        :effect (and
            (count-sandwich ?s ?dc at_kitchen_sandwich-true ?n0)
            (not (count-sandwich ?s ?dc at_kitchen_sandwich-true ?n1))
            (count-sandwich ?s ?dc ?t ?n3)
            (not (count-sandwich ?s ?dc ?t ?n2)))
    )

    (:action move_tray_serve_sandwich
        :parameters (?t - tray ?p1 - place ?p2 - place ?s - sandwich ?c - child ?dc -
        sandwich-property1 ?n1 - sandwich-num ?n0 - sandwich-num ?n2 - sandwich-num ?n3 -
        sandwich-num ?s-size - sandwich-num)

        :precondition (and
            (at ?t ?p1)
            (waiting ?c ?p2)
            (count-sandwich ?s ?dc ?t ?n1)
            (sandwich-less ?n0 ?n1)
            (count-sandwich ?s ?dc sandwich-property2-none ?n2)
            (sandwich-less ?n2 ?n3)
            (sandwich-lte-sum ?n1 ?n2 ?s-size)
            (sandwich-bag-size ?s ?s-size))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (served ?c)
            (count-sandwich ?s ?dc ?t ?n0)
            (not (count-sandwich ?s ?dc ?t ?n1))
            (count-sandwich ?s ?dc sandwich-property2-none ?n3)
            (not (count-sandwich ?s ?dc sandwich-property2-none ?n2)))
    )

    (:action move_tray_serve_sandwich_no_gluten
        :parameters (?t - tray ?p1 - place ?p2 - place ?s - sandwich ?c - child ?n1 -
        sandwich-num ?n0 - sandwich-num ?n2 - sandwich-num ?n3 - sandwich-num ?s-size -
        sandwich-num)

        :precondition (and
            (at ?t ?p1)
            (waiting ?c ?p2)
            (allergic_gluten ?c)
            (count-sandwich ?s no_gluten_sandwich-true ?t ?n1)
            (sandwich-less ?n0 ?n1)
            (count-sandwich ?s no_gluten_sandwich-true sandwich-property2-none ?n2)
            (sandwich-less ?n2 ?n3)
            (sandwich-lte-sum ?n1 ?n2 ?s-size)
            (sandwich-bag-size ?s ?s-size))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (served ?c)
            (count-sandwich ?s no_gluten_sandwich-true ?t ?n0)
            (not (count-sandwich ?s no_gluten_sandwich-true ?t ?n1))
            (count-sandwich ?s no_gluten_sandwich-true sandwich-property2-none ?n3)
            (not (count-sandwich ?s no_gluten_sandwich-true sandwich-property2-none ?n2)))
    )

    (:action move_tray_kitchen
        :parameters (?t - tray ?p1 - place)

        :precondition (at ?t ?p1)

        :effect (and
            (not (at ?t ?p1))
            (at ?t kitchen))
    )

)
