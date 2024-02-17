select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `hive_metastore`.`saleslt_dbt_test__audit`.`unique_dim_product_product_sk`
    
      
    ) dbt_internal_test