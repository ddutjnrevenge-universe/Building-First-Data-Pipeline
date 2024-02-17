select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `hive_metastore`.`saleslt_dbt_test__audit`.`not_null_dim_product_product_name`
    
      
    ) dbt_internal_test