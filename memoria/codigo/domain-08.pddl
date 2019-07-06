(define (domain child-snack)

    (:requirements :typing :equality)
    (:types
    object
    child - object
    tray - object
    place - object)
    (:constants kitchen - place)

    (:predicates
        (allergic_gluten ?c - object)
        (not_allergic_gluten ?c - object)
        (served ?c - object)
        (at ?t - object ?p - object)
        (waiting ?c - object ?p - object))

    (:functions
        (Nbread-portion-at_kitchen_bread)
        (Nbread-portion-at_kitchen_bread_no_gluten_bread)
        (Ncontent-portion-at_kitchen_content)
        (Ncontent-portion-at_kitchen_content_no_gluten_content)
        (Nsandwich-at_kitchen_sandwich)
        (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich)
        (Nsandwich-ontray ?tray - object)
        (Nsandwich-ontray_no_gluten_sandwich ?tray - object))

    (:action make_sandwich_no_gluten 
        :parameters ()

        :precondition (and
            (>= (Nbread-portion-at_kitchen_bread_no_gluten_bread) 1)
            (>= (Ncontent-portion-at_kitchen_content_no_gluten_content) 1))

        :effect (and
            (increase (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich) 1)
            (decrease (Nbread-portion-at_kitchen_bread_no_gluten_bread) 1)
            (increase (Ncontent-portion-at_kitchen_content_no_gluten_content) 1))
    )

    (:action make_sandwich_gluten 
        :parameters ()

        :precondition (and
            (>= (Nbread-portion-at_kitchen_bread) 1)
            (>= (Ncontent-portion-at_kitchen_content) 1))

        :effect (and
            (increase (Nsandwich-at_kitchen_sandwich) 1)
            (decrease (Nbread-portion-at_kitchen_bread) 1)
            (increase (Ncontent-portion-at_kitchen_content) 1))
    )

    (:action make_sandwich_gluten_bread_no_gluten
        :parameters ()

        :precondition (and
            (>= (Nbread-portion-at_kitchen_bread_no_gluten_bread) 1)
            (>= (Ncontent-portion-at_kitchen_content) 1))

        :effect (and
            (increase (Nsandwich-at_kitchen_sandwich) 1)
            (decrease (Nbread-portion-at_kitchen_bread_no_gluten_bread) 1)
            (increase (Ncontent-portion-at_kitchen_content) 1))
    )

    (:action make_sandwich_gluten_content_no_gluten
        :parameters ()

        :precondition (and
            (>= (Nbread-portion-at_kitchen_bread) 1)
            (>= (Ncontent-portion-at_kitchen_content_no_gluten_content) 1))

        :effect (and
            (increase (Nsandwich-at_kitchen_sandwich) 1)
            (decrease (Nbread-portion-at_kitchen_bread) 1)
            (increase (Ncontent-portion-at_kitchen_content_no_gluten_content) 1))
    )


    (:action put_on_tray_gluten
        :parameters (?t - tray)

        :precondition (and
            (>= (Nsandwich-at_kitchen_sandwich) 1)
            (at ?t kitchen))

        :effect (and
            (increase (Nsandwich-ontray ?t) 1)
            (decrease (Nsandwich-at_kitchen_sandwich) 1))
    )


    (:action put_on_tray_no_gluten
        :parameters (?t - tray)

        :precondition (and
            (>= (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich) 1)
            (at ?t kitchen))

        :effect (and
            (increase (Nsandwich-ontray_no_gluten_sandwich ?t) 1)
            (decrease (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich) 1))
    )


    (:action serve_sandwich_no_gluten
        :parameters (?t - tray ?c - child ?p - place)

        :precondition (and
            (at ?t ?p)
            (>= (Nsandwich-ontray_no_gluten_sandwich ?t) 1)
            (waiting ?c ?p))

        :effect (and
            (not (waiting ?c ?p))
            (served ?c)
            (decrease (Nsandwich-ontray_no_gluten_sandwich ?t) 1))
    )


    (:action serve_sandwich_gluten
        :parameters (?t - tray ?c - child ?p - place)

        :precondition (and
            (at ?t ?p)
            (>= (Nsandwich-ontray ?t) 1)
            (waiting ?c ?p)
            (not_allergic_gluten ?c))

        :effect (and
            (not (waiting ?c ?p))
            (served ?c)
            (decrease (Nsandwich-ontray ?t) 1))
    )


    (:action move_tray
    :parameters (?t - tray ?p1 ?p2 - place)

    :precondition (and (at ?t ?p1))

    :effect (and
        (not (at ?t ?p1))
        (at ?t ?p2))
    )
)
