select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select model
from `hive_metastore`.`saleslt`.`dim_product`
where model is null



      
    ) dbt_internal_test