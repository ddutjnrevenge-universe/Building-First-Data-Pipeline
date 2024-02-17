
          
  
    
        create or replace table `hive_metastore`.`snapshots`.`salesorderheader_snapshot`
      
      
    using delta
      
      
      
      
      
    location '/mnt/silver/salesorderheader/salesorderheader_snapshot'
      
      
      as
      

    select *,
        md5(coalesce(cast(SalesOrderId as string ), '')
         || '|' || coalesce(cast(
    current_timestamp()
 as string ), '')
        ) as dbt_scd_id,
        
    current_timestamp()
 as dbt_updated_at,
        
    current_timestamp()
 as dbt_valid_from,
        nullif(
    current_timestamp()
, 
    current_timestamp()
) as dbt_valid_to
    from (
        



with source_data as (
    select 
        SalesOrderID,
        RevisionNumber,
        OrderDate,
        DueDate,
        ShipDate,
        Status,
        OnlineOrderFlag,
        SalesOrderNumber,
        PurchaseOrderNumber,
        AccountNumber,
        CustomerID,
        ShipToAddressID,
        BillToAddressID,
        ShipMethod,
        CreditCardApprovalCode,
        SubTotal,
        TaxAmt,
        Freight,
        TotalDue,
        Comment
    from `hive_metastore`.`saleslt`.`salesorderheader`
)
select *
from source_data
    ) sbq



  
      