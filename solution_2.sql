

-- solution 2: get only distinct data from map table
-- distinct records from map table
with distinct_map as (
    select DISTINCT dimension_1
    ,correct_dimension_2
    from sofomo.map
)
-- corrected table a dimension_2 with map.correct_dimension_2
,corrected_a as (
    select a.dimension_1
    ,map.correct_dimension_2 as dimension_2
    ,sum(measure_1) as measure_1_sum
    from sofomo.a
    inner join distinct_map as map on map.dimension_1 = a.dimension_1
    group by a.dimension_1, map.correct_dimension_2
)
-- corrected table b dimension_2 with map.correct_dimension_2
,corrected_b as (
    select b.dimension_1
    ,map.correct_dimension_2 as dimension_2
    ,sum(measure_2) as measure_2_sum
    from sofomo.b
    inner join distinct_map as map on map.dimension_1 = b.dimension_1
    group by b.dimension_1, map.correct_dimension_2
)
-- join tables with all values included (full)
select 
coalesce(ca.dimension_1, cb.dimension_1) as dimension_1
,coalesce(ca.dimension_2, cb.dimension_2) as dimension_2
,coalesce(measure_1_sum, 0) as measure_1
,coalesce(measure_2_sum, 0) as measure_2
from corrected_a as ca
full join corrected_b as cb on ca.dimension_1 = cb.dimension_1
    and ca.dimension_2 = cb.dimension_2
order by dimension_1