# How to solve a problem in a short period of time (under 30 minutes)
#
# We presume that most (99999 out of 100000) of people can't find optimized attack strategy
# in a very short period of time. Since most discoveries we learn on textbook is worked
# by extremely smart individuals for years or decades. Some of them are actually the results
# of Nobel reconized researches.
#
# It's very unfair for majority of people to overcome multiple obstacles under 30 minutes.
# So for people who actually can solve hard problems must have some hidden advantages
# rather than pure genius, or to say, rather than full of sudden inspirations.
#
# Here we present these hidden secrects as:
#
# 1, better solving strategy. (which is just the following function.)
# 2, more data and functions stored in brain. (which can be inserted to brain by leanring.)
# 3, more grit or perseverance when they encounter difficulties and failures.
# (which is described as higher sick_level_threshold_value)

# A test shouldn't be a test for sudden inspirations. That's a random thing.
# A test should test a student's understanding of common defination and tricks, which are the building blocks
# for furthur creative activities.

# The core algorithm of human thinking can be broken into four major system.
# 1, Quick Blur Search system (by frequecies of occurrence, urgency level)
# 2, Quick Blur Sort System (by impulse level, assurance level)
# 3, Happy Sick Eval System (a span of happiness)
# 4, Safety Danger Eval System
# 5, Image Parser System
# 6, 

Human.more

  solve: problem
    # first attack attempt by subconscious
    intuitive_impulse = subconscious_database_query(problem)
    if intuitive_impulse.value > threshold_impulse.value return intuitive_impulse.attack

    # parse the problem and break it into dots
    conditions, purposes = parse problem
    dots = concat conditions, purposes

    conditions.each ->
      new_conditions?! = quick_results permu. conditions

    purposes.each ->
      new_purposes?! = quick_results permu. conditions

    dots.each ->
      # add attacks into a pool
      attacks_pool = concat dot.nearby_data, dot.nearby_function
      sorted_attacks_pool = attacks_pool.blur_sort_by_impulse
      # go through attacks
      sorted_attacks_pool.each ->
        # TODO I think we should add intelligence level here as a determinator