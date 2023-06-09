(define (domain production_merged)
    (:requirements :conditional-effects :typing)
    (:types othergoals raw)
    (:predicates 
        (available_raw ?r - raw)  
        (processed_A ?r - raw)  
        (processed_B ?r - raw)  
        (processed_C ?r - raw)  
        (r_available_raw ?r - raw) 
        (r_no_bottleneck)
        (r_no_need_to_calibrate) 
        (r_processed_A ?r - raw)  
        (r_processed_B ?r - raw)  
        (r_processed_C ?r - raw) 
        (robot_failed))
    (:action load_machine_A
        :parameters (?r - raw )
        :precondition (available_raw ?r)
        :effect (and (not (available_raw ?r)) (processed_A ?r)
         (when (not (and (r_available_raw ?r) (r_no_need_to_calibrate) (r_no_bottleneck))) (robot_failed)) 
         (when (and (r_available_raw ?r) (r_no_need_to_calibrate) (r_no_bottleneck)) 
         (and (not (r_available_raw ?r)) (r_processed_A ?r))))
    )
     (:action load_machine_B
        :parameters (?r - raw )
        :precondition (processed_A ?r)
        :effect (and (not (processed_A ?r))
         (processed_B ?r)
          (when (not (and (r_processed_A ?r) (r_no_need_to_calibrate) (r_no_bottleneck))) (robot_failed)) 
          (when (and (r_processed_A ?r) (r_no_need_to_calibrate) (r_no_bottleneck)) 
          (and (not (r_processed_A ?r)) (r_processed_B ?r))))
    )
     (:action load_machine_C
        :parameters (?r - raw )
        :precondition (processed_B ?r)
        :effect (and (not (processed_B ?r)) (processed_C ?r) 
        (when (not (and (r_processed_B ?r) (r_no_need_to_calibrate) (r_no_bottleneck))) (robot_failed)) 
        (when (and (r_processed_B ?r) (r_no_need_to_calibrate) (r_no_bottleneck))
         (and (not (r_processed_B ?r)) (r_processed_C ?r))))
    )
)