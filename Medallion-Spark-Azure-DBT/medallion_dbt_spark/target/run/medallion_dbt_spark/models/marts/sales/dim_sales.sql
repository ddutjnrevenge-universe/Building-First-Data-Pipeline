
  
    
        create or replace table `hive_metastore`.`saleslt`.`dim_sales`
      
      
    using delta
      
      
      
      
      
    location '/mnt/silver/customer/dim_sales'
      
      
      as
      
with product_snapshot as (
    select 
        ProductID,
        Name,
        ProductNumber,
        Color,
        StandardCost,
        ListPrice,
        Size,
        Weight,
        SellStartDate,
        SellEndDate,
        DiscontinuedDate,
        ThumbNailPhoto,
        ThumbnailPhotoFileName
    from `hive_metastore`.`saleslt`.`product` 
),
salesorderdetail_snapshot as (
    select 
        SalesOrderID,
        SalesOrderDetailID,
        OrderQty,
        ProductID,
        UnitPrice,
        UnitPriceDiscount,
        LineTotal
    from `hive_metastore`.`snapshots`.`salesorderdetail_snapshot` 
),
salesorderheader_snapshot as (
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
        Comment,
        row_number() over (partition by SalesOrderID order by SalesOrderID) as row_num
    from `hive_metastore`.`saleslt`.`salesorderheader` 
),
transformed as (
    select
    product_snapshot.Name,
    product_snapshot.ProductNumber,
    product_snapshot.Color,
    product_snapshot.StandardCost,
    product_snapshot.ListPrice,
    product_snapshot.Size,
    product_snapshot.Weight,
    product_snapshot.SellStartDate,
    product_snapshot.SellEndDate,
    product_snapshot.DiscontinuedDate,
    product_snapshot.ThumbNailPhoto,
    product_snapshot.ThumbnailPhotoFileName,
    salesorderdetail_snapshot.SalesOrderID,
    salesorderdetail_snapshot.SalesOrderDetailID,
    salesorderdetail_snapshot.OrderQty,
    salesorderdetail_snapshot.ProductID,
    salesorderdetail_snapshot.UnitPrice,
    salesorderdetail_snapshot.UnitPriceDiscount,
    salesorderdetail_snapshot.LineTotal,
    salesorderheader_snapshot.RevisionNumber,
    salesorderheader_snapshot.OrderDate,
    salesorderheader_snapshot.DueDate,
    salesorderheader_snapshot.ShipDate,
    salesorderheader_snapshot.Status,
    salesorderheader_snapshot.OnlineOrderFlag,
    salesorderheader_snapshot.SalesOrderNumber,
    salesorderheader_snapshot.PurchaseOrderNumber,
    salesorderheader_snapshot.AccountNumber,
    salesorderheader_snapshot.CustomerID,
    salesorderheader_snapshot.BillToAddressID,
    salesorderheader_snapshot.ShipToAddressID,
    salesorderheader_snapshot.ShipMethod,
    salesorderheader_snapshot.CreditCardApprovalCode,
    salesorderheader_snapshot.SubTotal,
    salesorderheader_snapshot.TaxAmt,
    salesorderheader_snapshot.Freight,
    salesorderheader_snapshot.TotalDue,
    salesorderheader_snapshot.Comment
    from product_snapshot
    left join salesorderdetail_snapshot on product_snapshot.ProductID = salesorderdetail_snapshot.ProductID
    left join salesorderheader_snapshot on salesorderdetail_snapshot.SalesOrderID = salesorderheader_snapshot.SalesOrderID
)

select * from transformed
  