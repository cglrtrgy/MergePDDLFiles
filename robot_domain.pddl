
(define (domain robot_production)

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
    
    ;these predicates are not part of human model
    (no_bottleneck)
    (no_need_to_calibrate)
)

;this action is not in the human model
(:action wait_machines
    :parameters ()
    :precondition (and )
    
    

    :effect (and 
        (no_bottleneck)
    )
)


;this action is not in the human model
(:action calibrate_machines
    :parameters ()
    :precondition (and )

    :effect (and 
        (no_need_to_calibrate))
        
    
)


(:action load_machine_A
    :parameters (?r - raw )
    :precondition (and 
        
        (available_raw ?r)
        (no_bottleneck)
        (no_need_to_calibrate)
    )
    :effect (and 
        (not (available_raw ?r))
        (processed_A ?r)
    )
)
    
(:action load_machine_B
    :parameters (?r - raw  )
    :precondition (and 
        
        (processed_A ?r)
        (no_bottleneck)
        (no_need_to_calibrate)
        
        )

    :effect (and 
        (not (processed_A ?r))
        (processed_B ?r))
)



    
(:action load_machine_C
    :parameters (?r - raw )
    :precondition (and 
        
        (processed_B ?r)
        (no_bottleneck)
        (no_need_to_calibrate)
    
    )
    :effect (and 
        (not (processed_B ?r))
        (processed_C ?r)
    )
)
)