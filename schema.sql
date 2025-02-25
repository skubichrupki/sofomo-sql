-- DDL:
create schema sofomo

-- table A
create table sofomo.A (
    dimension_1 CHAR(1),
    dimension_2 CHAR(1),
    dimension_3 CHAR(1),
    measure_1 integer
)

-- table B
create table sofomo.B (
    dimension_1 CHAR(1),
    dimension_2 char(1),
    measure_2 integer
)

-- MAP table
create table sofomo.MAP (
    dimension_1 CHAR(1),
    correct_dimension_2 CHAR
)

-- insert values from assignment
insert into sofomo.a (
    dimension_1, 
    dimension_2, 
    dimension_3, 
    measure_1
  )
values
  ('a', 'I', 'K', 1), ('a', 'J', 'L', 7), ('b', 'I', 'M', 2) , ('c', 'J', 'N', 5);

insert into sofomo.b (
    dimension_1, 
    dimension_2, 
    measure_2
  )
values
  ('a', 'J', 7), ('b', 'J', 10), ('d', 'J', 4) 
  
insert into sofomo.map (
    dimension_1, 
    correct_dimension_2
)
values
('a', 'W'),('a', 'W'),('b', 'X'),('c', 'Y'),('b', 'X'),('d', 'Z');