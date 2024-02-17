{%snapshot product_snapshot %}

{{
    config(
        file_format= "delta",
        location_root = "/mnt/silver/product",
        target_schema = 'snapshots',
        invalidate_hard_deletes = True,
        unique_key = 'ProductId',
        strategy = 'check',
        check_cols = 'all'
    )
}}

with source_data as (
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
        DiscontinuedDate,
        ThumbNailPhoto,
        ThumbnailPhotoFileName
    from {{ source('saleslt', 'product') }}
)
select *
from source_data
{%endsnapshot%}