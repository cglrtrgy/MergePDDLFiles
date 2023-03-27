(define (problem problem_name) (:domain robot_production)
(:objects 
    
    R1 - raw
)

(:init

    
    (available_raw R1)
    ;(no_bottleneck)
    (no_need_to_calibrate)
)

(:goal (and
    (processed_C R1)
))

)
