(define (domain child-snack)
    (:requirements :typing :equality)
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

    (:action make_sandwich_move_tray_serve_sandwich_move_tray_kitchen
        :parameters (?t - tray ?p2 - place ?s - sandwich ?c - child ?b - bread-portion
        ?ct - content-portion)

        :precondition (and
            (at ?t kitchen)
            (at_kitchen_bread ?b)
            (at_kitchen_content ?ct)
            (notexist ?s)
            (waiting ?c ?p2)
            (not_allergic_gluten ?c))

        :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?ct))
            (not (at ?t kitchen))
            (at ?t kitchen)
            (not (ontray ?s ?t))
            (not (notexist ?s))
            (served ?c))
            (increase (total-cost) 4)
    )

    (:action make_sandwich_move_tray_serve_sandwich_no_gluten_move_tray_kitchen
        :parameters (?t - tray ?p2 - place ?s - sandwich ?c - child ?b - bread-portion
        ?ct - content-portion)

        :precondition (and
            (at ?t kitchen)
            (at_kitchen_bread ?b)
            (at_kitchen_content ?ct)
            (notexist ?s)
            (waiting ?c ?p2)
            (allergic_gluten ?c)
            (no_gluten_bread ?b)
            (no_gluten_content ?ct))

        :effect (and
            (not (at_kitchen_bread ?b))
            (not (at_kitchen_content ?ct))
            (not (at ?t kitchen))
            (at ?t kitchen)
            (not (ontray ?s ?t))
            (not (notexist ?s))
            (served ?c))
            (increase (total-cost) 4)
    )

    (:action move_tray
        :parameters (?t - tray ?p1 ?p2 - place)

        :precondition (and (at ?t ?p1))

        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2))
            (increase (total-cost) 1)
    )
)
