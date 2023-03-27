
(define (domain production)

;remove requirements that are not needed
(:requirements :typing :conditional-effects)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    
    raw
)


(:predicates ;todo: define predicates here
    
    (available_raw ?r - raw)
    (processed_A ?r - raw)
    (processed_B ?r - raw)
    (processed_C ?r - raw)
)



(:action load_machine_A
    :parameters (?r - raw )
    :precondition (and 
        (available_raw ?r)

    )
    :effect (and 
        (processed_A ?r)
        (not (available_raw ?r))
    )
)
    
(:action load_machine_B
    :parameters (?r - raw )
    :precondition (and 
        (processed_A ?r))

    :effect (and 
        (not(processed_A ?r))
        (processed_B ?r)
    )
)
    
(:action load_machine_C
    :parameters (?r - raw )
    :precondition (and 
        (processed_B ?r)

    
    )
    :effect (and 
        (not(processed_B ?r))
        (processed_C ?r)
    )
)
)