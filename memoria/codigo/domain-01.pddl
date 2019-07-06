(define (domain child-snack)
    (:requirements :typing :equality :action-costs)
    (:types child bread-portion content-portion sandwich tray place)
    (:constants kitchen - place)

    (:predicates
        (at_kitchen_bread ?b - bread-portion)
        (at_kitchen_content ?c - content-portion)
        (at_kitchen_sandwich ?s - sandwich)
        (no_gluten_bread ?b - bread-portion)
        (no_gluten_content ?c - content-portion)
        (ontray ?s - sandwich ?t - tray)
        (no_gluten_sandwich ?s - sandwich)
        (allergic_gluten ?c - child)
        (not_allergic_gluten ?c - child)
        (served ?c - child)
        (waiting ?c - child ?p - place)
        (at ?t - tray ?p - place)
        (notexist ?s - sandwich))

    (:functions (total-cost) - number)

    (:action make_sandwich_no_gluten 
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)

        :precondition (and
            (at_kitchen_bread ?b)
            (at_kitchen_content ?c)
            (no_gluten_bread ?b)
            (no_gluten_content ?c)
            (notexist ?s))

        :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?c))
            (at_kitchen_sandwich ?s)
            (no_gluten_sandwich ?s)
            (not (notexist ?s))
            (increase (total-cost) 1))
    )


    (:action make_sandwich
        :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)

        :precondition (and
            (at_kitchen_bread ?b)
            (at_kitchen_content ?c)
            (notexist ?s))

        :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?c))
            (at_kitchen_sandwich ?s)
            (not (notexist ?s))
            (increase (total-cost) 1))
    )


    (:action put_on_tray
        :parameters (?s - sandwich ?t - tray)

        :precondition (and
            (at_kitchen_sandwich ?s)
            (at ?t kitchen))

        :effect (and
            (not (at_kitchen_sandwich ?s))
            (ontray ?s ?t))
   )

    (:action move_tray_serve_sandwich_no_gluten
        :parameters (?t - tray ?p1 ?p2 - place ?s - sandwich ?c - child)
    
        :precondition (and
            (at ?t ?p1)
            (waiting ?c ?p2)
            (ontray ?s ?t)
            (allergic_gluten ?c)
            (no_gluten_sandwich ?s))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (not (ontray ?s ?t))
            (served ?c)
            (increase (total-cost) 2))
    )

    (:action move_tray_serve_sandwich
        :parameters (?t - tray ?p1 ?p2 - place ?s - sandwich ?c - child)
        :precondition (and
            (at ?t ?p1)
            (waiting ?c ?p2)
            (ontray ?s ?t))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (not (ontray ?s ?t))
            (served ?c)
            (increase (total-cost) 1))
    )

    (:action move_tray_kitchen
         :parameters (?t - tray ?p1 - place)

         :precondition (and (at ?t ?p1))

         :effect (and
            (not (at ?t ?p1))
            (at ?t kitchen)
            (increase (total-cost) 1))
    )
                    
)
