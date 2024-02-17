select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
        select *
        from `hive_metastore`.`saleslt_dbt_test__audit`.`not_null_my_first_dbt_model_id`
    
      
    ) dbt_internal_test