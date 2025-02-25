## Task description:

- aggregation of measure_1 and measure_2
- for distinct pairs of dimenstion_1 and dimension_2
- to aggregate use SUM
- can use cte, result in single query
- nulls to 0
- using postgreSQL

### result schema:
- dimension_1 (char)
- dimension_2 (char)
- measure_1 (integer) (sum)
- measure_2 (integer) (sum)

## notes:
concerns: 
- duplicated records on the map table
- dimension_3 - since we are asked of distinct pairs of dimension_1 and dimension_2 we dont take it into account

- solution 1: allow duplicated records in map table (inflates sum values on measures)
- solution 2: select distinct records from map table (i think this is the correct one, but would contact for clarification)
- using postgreSQL

## intuition:
- use cte to correct the columns in tables a and b
- group by sums in ctes for corrected a and b
- use full join have the records from both a and b tables

## files:
- solution_1.sql - solution with duplicated records from map table
- solution_2.sql - solution with distinct records from map table
- schema.sql - used to create tables and insert data