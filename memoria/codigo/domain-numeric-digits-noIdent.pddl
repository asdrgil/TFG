(define (domain child-snack)
(:requirements :typing, :equality)
(:types 
    object
    child - object
    tray - object
    place - object
)

(:predicates 
    (allergic_gluten ?c - child)
    (not_allergic_gluten ?c - child)
    (served ?c - child)
    (waiting ?c - child ?p - place)
    (at ?t - tray ?p - place))

(:functions 
    ;;(notexist)
    (Nsandwich-ontray ?tray-1 - tray)
    (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich)
    (Nbread-portion-at_kitchen_bread_no_gluten_bread)
    (Ncontent-portion-at_kitchen_content_no_gluten_content)
    (Nbread-portion-at_kitchen_bread)
    (Ncontent-portion-at_kitchen_content)
    (Nsandwich-at_kitchen_sandwich)
    (Nsandwich-ontray_no_gluten_sandwich ?tray-0 - tray))

(:action make_sandwich_no_gluten_1_1
    :parameters ()
    
    :precondition (and
        (>= (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(>= (notexist ) 1)
        (>= (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1)
        )

    :effect (and
        (increase (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich ) 1)
        (decrease (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(decrease (notexist ) 1)
        (decrease (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1))
)

(:action make_sandwich_1_1
    :parameters ()

    :precondition (and
        (>= (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(>= (notexist ) 1)
        (>= (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1))

    :effect (and
        (increase (Nsandwich-at_kitchen_sandwich ) 1)
        (decrease (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(decrease (notexist ) 1)
        (decrease (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1))
)

(:action make_sandwich_2_1
    :parameters ()

    :precondition (and
        (>= (Nbread-portion-at_kitchen_bread ) 1)
        ;;(>= (notexist ) 1)
        (>= (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1))

    :effect (and
        (increase (Nsandwich-at_kitchen_sandwich ) 1)
        (decrease (Nbread-portion-at_kitchen_bread ) 1)
        ;;(decrease (notexist ) 1)
        (decrease (Ncontent-portion-at_kitchen_content_no_gluten_content ) 1))
)

(:action make_sandwich_3_1
    :parameters ()

    :precondition (and
        (>= (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(>= (notexist ) 1)
        (>= (Ncontent-portion-at_kitchen_content ) 1))

    :effect (and
        (increase (Nsandwich-at_kitchen_sandwich ) 1)
        (decrease (Nbread-portion-at_kitchen_bread_no_gluten_bread ) 1)
        ;;(decrease (notexist ) 1)
        (decrease (Ncontent-portion-at_kitchen_content ) 1))
)

(:action make_sandwich_4_1
    :parameters ()

    :precondition (and
        (>= (Nbread-portion-at_kitchen_bread ) 1)
        (>= (Ncontent-portion-at_kitchen_content ) 1)
        ;;(>= (notexist ) 1)
    )

    :effect (and
        (increase (Nsandwich-at_kitchen_sandwich ) 1)
        (decrease (Nbread-portion-at_kitchen_bread ) 1)
        (decrease (Ncontent-portion-at_kitchen_content ) 1)
        ;;(decrease (notexist ) 1))
)

(:action put_on_tray_1_1
    :parameters (?t - tray)

    :precondition (and
        (at ?t kitchen)
        (>= (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich ) 1))

    :effect (and
        (increase (Nsandwich-ontray_no_gluten_sandwich ?t) 1)
        (decrease (Nsandwich-at_kitchen_sandwich_no_gluten_sandwich ) 1))
)

(:action put_on_tray_2_1
    :parameters (?t - tray)

    :precondition (and
        (at ?t kitchen)
        (>= (Nsandwich-at_kitchen_sandwich ) 1))

    :effect (and
        (increase (Nsandwich-ontray ?t) 1)
        (decrease (Nsandwich-at_kitchen_sandwich ) 1))
)

(:action serve_sandwich_no_gluten_1_1
    :parameters (?p - place ?c - child ?t - tray)

    :precondition (and
        (at ?t ?p)
        (waiting ?c ?p)
        (allergic_gluten ?c)
        (>= (Nsandwich-ontray_no_gluten_sandwich ?t) 1))

    :effect (and
        (served ?c)
        (decrease (Nsandwich-ontray_no_gluten_sandwich ?t) 1))
)

(:action serve_sandwich_1_1
    :parameters (?p - place ?c - child ?t - tray)

    :precondition (and
        (at ?t ?p)
        (waiting ?c ?p)
        (not_allergic_gluten ?c)
        (>= (Nsandwich-ontray ?t) 1))

    :effect (and
        (served ?c)
        (decrease (Nsandwich-ontray ?t) 1))
)

(:action serve_sandwich_2_1
    :parameters (?p - place ?c - child ?t - tray)

    :precondition (and
        (at ?t ?p)
        (waiting ?c ?p)
        (not_allergic_gluten ?c)
        (>= (Nsandwich-ontray_no_gluten_sandwich ?t) 1))

    :effect (and
        (served ?c)
        (decrease (Nsandwich-ontray_no_gluten_sandwich ?t) 1))
)

(:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)

    :precondition (and (at ?t ?p1))

    :effect (and
        (not (at ?t ?p1))
        (at ?t ?p2))
)

)
