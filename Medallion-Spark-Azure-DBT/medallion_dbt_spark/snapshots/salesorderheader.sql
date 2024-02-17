{%snapshot salesorderheader_snapshot %}

{{
    config(
        file_format= "delta",
        location_root = "/mnt/silver/salesorderheader",
        target_schema = 'snapshots',
        invalidate_hard_deletes = True,
        unique_key = 'SalesOrderId',
        strategy = 'check',
        check_cols = 'all'
    )
}}

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
    from {{ source('saleslt', 'salesorderheader') }}
)
select *
from source_data
{%endsnapshot%}