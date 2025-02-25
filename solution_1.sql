
-- solution 1:
-- corrected table a dimension_2 with map.correct_dimension_2
with corrected_a as (
    select a.dimension_1
    ,map.correct_dimension_2 as dimension_2
    ,sum(measure_1) as measure_1_sum
    from sofomo.a
    inner join sofomo.map on map.dimension_1 = a.dimension_1
    group by a.dimension_1, map.correct_dimension_2
)
-- corrected table b dimension_2 with map.correct_dimension_2
,corrected_b as (
    select b.dimension_1
    ,map.correct_dimension_2 as dimension_2
    ,sum(measure_2) as measure_2_sum
    from sofomo.b
    inner join sofomo.map on map.dimension_1 = b.dimension_1
    group by b.dimension_1, map.correct_dimension_2
)
-- join corrected a and corrected b, keep values from both tables, coalesce to 0
select 
coalesce(ca.dimension_1, cb.dimension_1) as dimension_1
,coalesce(ca.dimension_2, cb.dimension_2) as dimension_2
,coalesce(measure_1_sum, 0) as measure_1
,coalesce(measure_2_sum, 0) as measure_2
from corrected_a as ca
full join corrected_b as cb on ca.dimension_1 = cb.dimension_1
    and ca.dimension_2 = cb.dimension_2
order by dimension_1