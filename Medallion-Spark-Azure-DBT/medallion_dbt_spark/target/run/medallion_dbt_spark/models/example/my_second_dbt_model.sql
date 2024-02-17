create or replace view `hive_metastore`.`saleslt`.`my_second_dbt_model`
  
  
  
  as
    -- Use the `ref` function to select from other models

select *
from `hive_metastore`.`saleslt`.`my_first_dbt_model`
where id = 1
