(define (problem problem_name)
    (:domain production_merged)
    (:objects R1 - raw robot_failed - othergoals)
    (:init (available_raw R1) (r_available_raw R1) (r_no_need_to_calibrate))
    (:goal (and (processed_C R1) (robot_failed)))
)