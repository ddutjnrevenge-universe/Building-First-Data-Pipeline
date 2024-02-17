select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name
from `hive_metastore`.`saleslt`.`dim_product`
where name is null



      
    ) dbt_internal_test