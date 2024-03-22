with
    source as (
        select * from {{ source("raw_wwi", "ext_warehouse_stockitemstockgroups") }}
    ),

    clean_warehouse_stockitemstockgroups as (

        select

            cast(stockitemstockgroupid as string) as stock_item_stock_group_id,
            cast(stockitemid as string) as stock_item_id,
            cast(stockgroupid as string) as stock_group_id,
            cast(lasteditedby as datetime) as last_edited_by,
            cast(lasteditedwhen as datetime) as last_edited_when

        from source

    )

select * from clean_warehouse_stockitemstockgroups
