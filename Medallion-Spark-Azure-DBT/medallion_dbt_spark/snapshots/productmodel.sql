{%snapshot productmodel_snapshot %}

{{
    config(
        file_format= "delta",
        location_root = "/mnt/silver/productmodel",
        target_schema = 'snapshots',
        invalidate_hard_deletes = True,
        unique_key = 'ProductModelID',
        strategy = 'check',
        check_cols = 'all'
    )
}}

with source_data as (
    select 
        ProductModelID,
        Name,
        CatalogDescription
    from {{ source('saleslt', 'productmodel') }}
)
select *
from source_data
{%endsnapshot%}