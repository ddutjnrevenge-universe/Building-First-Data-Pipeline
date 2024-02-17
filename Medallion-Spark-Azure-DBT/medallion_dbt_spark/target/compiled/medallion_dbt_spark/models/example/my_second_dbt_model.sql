-- Use the `ref` function to select from other models

select *
from `hive_metastore`.`saleslt`.`my_first_dbt_model`
where id = 1