(define (domain child-snack)
    (:requirements :typing :equality)
    (:types child bread-portion content-portion sandwich tray place num)
    (:constants kitchen - place)

    (:predicates
        (at_kitchen_bread ?b - bread-portion)
        (at_kitchen_content ?c - content-portion)
        (at_kitchen_sandwich ?s - sandwich)
        (no_gluten_bread ?b - bread-portion)
        (no_gluten_content ?c - content-portion)
        (ontray ?s - sandwich ?t - tray)
        (no_gluten_sandwich ?s - sandwich)
        (allergic_gluten ?ch - child)
        (not_allergic_gluten ?ch - child)
        (served ?ch - child)
        (waiting ?ch - child ?p - place)
        (at ?t - tray ?p - place)
        (notexist ?s - sandwich)
        (num_sandwich_no_gluten ?n - num)
        (num_sandwich_gluten ?n - num)
        (num_sandwich_ontray ?n - num)
        (next ?minor - num ?major - num)
        (not_trays_kitchen)
        (first_load))

    (:action make_sandwich_no_gluten 
        :parameters (?b - bread-portion ?c - content-portion ?n ?minor - num ?s - sandwich)

        :precondition (and
            (at_kitchen_bread ?b)
            (at_kitchen_content ?c)
            (no_gluten_bread ?b)
            (no_gluten_content ?c)
            (num_sandwich_no_gluten ?n)
            (next ?minor ?n)
            (notexist ?s))

         :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?c))
            (at_kitchen_sandwich ?s)
            (no_gluten_sandwich ?s)
            (not (num_sandwich_no_gluten ?n))
            (num_sandwich_no_gluten ?minor)
            (not (notexist ?s)))
    )

    (:action make_sandwich
        :parameters (?b - bread-portion ?c - content-portion ?n ?minor - num ?s - sandwich)

        :precondition (and
            (at_kitchen_bread ?b)
            (at_kitchen_content ?c)
            (num_sandwich_no_gluten number_0)
            (num_sandwich_gluten ?n)
            (next ?minor ?n)
            (notexist ?s))

        :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?c))
            (at_kitchen_sandwich ?s)
            (not (num_sandwich_gluten ?n))
            (num_sandwich_gluten ?minor)
            (not (notexist ?s)))
    )

    (:action move_tray_kitchen
        :parameters (?t - tray ?p- place)

        :precondition (and
            (at ?t ?p)
            (not_trays_kitchen))
        
        :effect (and
            (not (at ?t ?p))
            (at ?t kitchen)
            (not (not_trays_kitchen)))
    )


    (:action put_on_tray_first_load
        :parameters (?s - sandwich ?t - tray ?n ?minor - num)

        :precondition (and
            (at_kitchen_sandwich ?s)
            (at ?t kitchen)
            (not (not_trays_kitchen))
            (num_sandwich_ontray ?n)
            (next ?minor ?n)
            (first_load))

        :effect (and
            (not (at_kitchen_sandwich ?s))
            (not (num_sandwich_ontray ?n))
            (num_sandwich_ontray ?minor)
            (ontray ?s ?t)
            (not(first_load)))
    )

    (:action put_on_tray
        :parameters (?s ?s2 - sandwich ?t - tray ?n ?minor - num)

        :precondition (and
            (at_kitchen_sandwich ?s)
            (at ?t kitchen)
            (not (first_load))
            (num_sandwich_ontray ?n)
            (next ?minor ?n)
            (ontray ?s2 ?t))

        :effect (and
            (not (at_kitchen_sandwich ?s))
            (not (num_sandwich_ontray ?n))
            (num_sandwich_ontray ?minor)
            (ontray ?s ?t))
    )

    ;Restrict the movement of the tray in case there exist the possibility to
    ;serve a not allergic child.
    (:action move_tray
        :parameters (?t - tray ?p1 ?p2 - place ?ch - child ?s - sandwich)

        :precondition (and
            (at ?t ?p1)
            (num_sandwich_ontray number_0)
            (not(and (not_allergic_gluten ?ch)
            (waiting ?ch ?p1)
            (ontray ?s ?t))))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2))
    )

    (:action move_tray_no_gluten
        :parameters (?t - tray ?p1 ?p2 - place ?s - sandwich ?ch - child)

        :precondition (and
            (at ?t ?p1)
            (num_sandwich_ontray number_0)
            (not(and (no_gluten_sandwich ?s)
            (allergic_gluten ?ch)
            (waiting ?ch ?p1)
            (ontray ?s ?t))))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2))
    )

    (:action serve_sandwich

        :parameters (?ch - child ?p - place ?s - sandwich ?t - tray)

        :precondition (and
            (not_allergic_gluten ?ch)
            (waiting ?ch ?p)
            (ontray ?s ?t)
            (at ?t ?p))

        :effect (and
            (not (ontray ?s ?t))
            (served ?ch))
    )

    (:action serve_sandwich_no_gluten
        :parameters (?s - sandwich ?t - tray ?ch - child ?p - place)

        :precondition (and
            (allergic_gluten ?ch)
            (ontray ?s ?t)
            (waiting ?ch ?p)
            (no_gluten_sandwich ?s)
            (at ?t ?p))

        :effect (and
            (not (ontray ?s ?t))
            (served ?ch))
    )

)
