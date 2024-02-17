
  
    
        create or replace table `hive_metastore`.`saleslt`.`dim_product`
      
      
    using delta
      
      
      
      
      
    location '/mnt/silver/customer/dim_product'
      
      
      as
      
with product_snapshot as (
    select 
        ProductId,
        Name,
        ProductNumber,
        Color,
        StandardCost,
        ListPrice,
        Size,
        Weight,
        ProductCategoryID,
        ProductModelID,
        SellStartDate,
        SellEndDate,
        DiscontinuedDate
    from `hive_metastore`.`snapshots`.`product_snapshot` where dbt_valid_to is null
),
productmodel_snapshot as (
    select 
        ProductModelID,
        Name,
        CatalogDescription,
        row_number() over (order by name) as model_id
    from `hive_metastore`.`snapshots`.`productmodel_snapshot` where dbt_valid_to is null
),
transformed as (
    select
    row_number() over (order by product_snapshot.ProductId) as product_sk, -- auto-incrementing surrogate key
    product_snapshot.Name as product_name,
    product_snapshot.StandardCost,
    product_snapshot.ListPrice,
    product_snapshot.Size,
    product_snapshot.Weight,
    productmodel_snapshot.Name as model,
    productmodel_snapshot.CatalogDescription as description,
    product_snapshot.SellStartDate,
    product_snapshot.SellEndDate,
    product_snapshot.DiscontinuedDate
    from product_snapshot
    left join productmodel_snapshot on product_snapshot.ProductModelID = productmodel_snapshot.ProductModelID
)
select * from transformed
  