with
    source as (select * from {{ source("raw_wwi", "ext_warehouse_stockgroups") }}),

    clean_warehouse_stockgroups as (

        select

            cast(stockgroupid as string) as stock_group_id,
            cast(stockgroupname as string) as stock_group_name,
            cast(lasteditedby as string) as last_edited_by

        from source

    )

select * from clean_warehouse_stockgroups