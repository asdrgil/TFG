(define (domain child-snack)
    (:requirements :typing :equality)
    (:types num tray place )
    (:constants kitchen - place)

    (:predicates
        (at_kitchen_bread ?gluten - num ?no-gluten - num)
        (at_kitchen_content ?gluten - num ?no-gluten - num)
        (at_kitchen_sandwich ?gluten - num ?no-gluten - num)
        (at ?t - tray ?p - place)
        (next ?minor - num ?major - num)
        (ontray ?gluten - num ?no-gluten - num ?t - tray)
        (served_childs ?served - num)
        (allergic_gluten ?c - child)
        (not_allergic_gluten ?c - child)
        (waiting ?c - child ?p - place))


    (:action make_sandwich_no_gluten
        :parameters (?bread-gluten ?bread-no-gluten ?content-gluten ?content-no-gluten
        ?sandwich-gluten ?sandwich-no-gluten ?bread-no-gluten-minor ?content-no-gluten-minor
        ?sandwich-no-gluten-major - num)

        :precondition (and
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten)
            (at_kitchen_content ?content-gluten ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (next ?bread-no-gluten-minor ?bread-no-gluten)
            (next ?content-no-gluten-minor ?content-no-gluten)
            (next ?sandwich-no-gluten ?sandwich-no-gluten-major))

        :effect (and
            (not (at_kitchen_bread ?bread-gluten ?bread-no-gluten))
            (not (at_kitchen_content ?content-gluten ?content-no-gluten))
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))

            (at_kitchen_bread ?bread-gluten ?bread-no-gluten-minor)
            (at_kitchen_content ?content-gluten ?content-no-gluten-minor)
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten-major))
    )

    (:action make_sandwich_gluten
        :parameters (?bread-gluten ?bread-no-gluten ?content-gluten ?content-no-gluten
        ?sandwich-gluten ?sandwich-no-gluten ?bread-gluten-minor ?content-gluten-minor
        ?sandwich-gluten-major - num)

        :precondition (and
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten)
            (at_kitchen_content ?content-gluten ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (next ?bread-gluten-minor ?bread-gluten)
            (next ?content-gluten-minor ?content-gluten)
            (next ?sandwich-gluten ?sandwich-gluten-major)
        )

        :effect(and
            (not (at_kitchen_bread ?bread-gluten ?bread-no-gluten))
            (not (at_kitchen_content ?content-gluten ?content-no-gluten))
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))
            (at_kitchen_bread ?bread-gluten-minor ?bread-no-gluten)
            (at_kitchen_content ?content-gluten-minor ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten-major ?sandwich-no-gluten))
    )

    (:action make_sandwich_gluten_bread_no_gluten
        :parameters (?bread-gluten ?bread-no-gluten ?content-gluten ?content-no-gluten
        ?sandwich-gluten ?sandwich-no-gluten ?bread-no-gluten-minor ?content-gluten-minor
        ?sandwich-gluten-major - num)

        :precondition (and
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten)
            (at_kitchen_content ?content-gluten ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (next ?bread-no-gluten-minor ?bread-no-gluten)
            (next ?content-gluten-minor ?content-gluten)
            (next ?sandwich-gluten ?sandwich-gluten-major))

        :effect (and
            (not (at_kitchen_bread ?bread-gluten ?bread-no-gluten))
            (not (at_kitchen_content ?content-gluten ?content-no-gluten))
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten-minor)
            (at_kitchen_content ?content-gluten-minor ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten-major ?sandwich-no-gluten))
    )


    (:action make_sandwich_gluten_content_no_gluten
        :parameters (?bread-gluten ?bread-no-gluten ?content-gluten ?content-no-gluten
        ?sandwich-gluten ?sandwich-no-gluten ?bread-no-gluten-minor ?content-gluten-minor
        ?sandwich-gluten-major - num)

        :precondition (and
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten)
            (at_kitchen_content ?content-gluten ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (next ?bread-no-gluten-minor ?bread-no-gluten)
            (next ?content-gluten-minor ?content-gluten)
            (next ?sandwich-gluten ?sandwich-gluten-major))

        :effect (and
            (not (at_kitchen_bread ?bread-gluten ?bread-no-gluten))
            (not (at_kitchen_content ?content-gluten ?content-no-gluten))
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))
            (at_kitchen_bread ?bread-gluten ?bread-no-gluten-minor)
            (at_kitchen_content ?content-gluten-minor ?content-no-gluten)
            (at_kitchen_sandwich ?sandwich-gluten-major ?sandwich-no-gluten))
    )

    (:action put_on_tray
        :parameters (?sandwich-gluten ?sandwich-no-gluten ?sandwich-gluten-2
        ?sandwich-no-gluten-2 ?sandwich-gluten-minor ?sandwich-gluten-2-major - num ?t - tray)

        :precondition (and
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (ontray ?sandwich-gluten-2 ?sandwich-no-gluten-2 ?t)
            (at ?t kitchen)
            (next ?sandwich-gluten-minor ?sandwich-gluten)
            (next ?sandwich-gluten-2 ?sandwich-gluten-2-major))

        :effect (and
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))
            (not (ontray ?sandwich-gluten-2 ?sandwich-no-gluten ?t))
            (at_kitchen_sandwich ?sandwich-gluten-minor ?sandwich-no-gluten)
            (ontray ?sandwich-gluten-2-major ?sandwich-no-gluten-2 ?t))
    )



    (:action put_on_tray_no_gluten
        :parameters (?sandwich-gluten ?sandwich-no-gluten ?sandwich-gluten-2
        ?sandwich-no-gluten-2 ?sandwich-no-gluten-minor ?sandwich-no-gluten-2-major - num
        ?t - tray)
        :precondition (and
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten)
            (ontray ?sandwich-gluten-2 ?sandwich-no-gluten-2 ?t)
            (at ?t kitchen)
            (next ?sandwich-no-gluten-minor ?sandwich-no-gluten)
            (next ?sandwich-no-gluten-2 ?sandwich-no-gluten-2-major))

        :effect (and
            (not (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten))
            (not (ontray ?sandwich-gluten-2 ?sandwich-no-gluten ?t))
            (at_kitchen_sandwich ?sandwich-gluten ?sandwich-no-gluten-minor)
            (ontray ?sandwich-gluten-2 ?sandwich-no-gluten-2-major ?t))
    )

    (:action move_tray
        :parameters (?t - tray ?p1 ?p2 - place)

        :precondition (and (at ?t ?p1))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2))
    )

    (:action serve_sandwich_no_gluten
        :parameters (?c - child ?p - place ?t - tray ?sandwich-gluten ?sandwich-no-gluten
        ?served ?sandwich-no-gluten-minor ?served-major - num)

        :precondition (and
            (allergic_gluten ?c)
            (ontray ?sandwich-gluten ?sandwich-no-gluten ?t)
            (waiting ?c ?p)
            (at ?t ?p)
            (served_childs ?served)
            (next ?sandwich-no-gluten-minor ?sandwich-no-gluten)
            (next ?served ?served-major))

        :effect (and
            (not (ontray ?sandwich-gluten ?sandwich-no-gluten ?t))
            (not (waiting ?c ?p))
            (ontray ?sandwich-gluten ?sandwich-no-gluten-minor ?t)
            (served_childs ?served-major))
    )

    (:action serve_sandwich_gluten
    :parameters (?c - child ?p - place ?t - tray ?sandwich-gluten ?sandwich-no-gluten
    ?served ?sandwich-gluten-minor ?served-major - num)

        :precondition (and
            (ontray ?sandwich-gluten ?sandwich-no-gluten ?t)
            (at ?t ?p)
            (waiting ?c ?p)
            (not_allergic_gluten ?c)
            (served_childs ?served)
            (next ?sandwich-gluten-minor ?sandwich-gluten)
            (next ?served ?served-major))

        :effect (and
            (not (ontray ?sandwich-gluten ?sandwich-no-gluten ?t))
            (not (waiting ?c ?p))
            (ontray ?sandwich-gluten-minor ?sandwich-no-gluten ?t)
            (served_childs ?served-major))
    )

)
