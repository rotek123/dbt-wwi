with
    source as (select * from {{ source("raw_wwi", "ext_warehouse_stockitem") }}),

    clean_warehouse_stockitem as (

        select

            cast(stockitemid as string) as stock_item_id,
            cast(stockitemname as string) as stock_item_name,
            cast(supplierid as string) as supplier_id,
            cast(colorid as string) as color_id,
            cast(unitpackageid as string) as unit_package_id,
            cast(outerpackageid as string) as outer_package_id,
            cast(brand as string) as brand,
            cast(size as string) as size,
            cast(leadtimedays as int) as lead_time_days,
            cast(quantityperouter as int) as quantity_per_outer,
            cast(ischillerstock as boolean) as is_chiller_stock,
            cast(barcode as string) as barcode,
            cast(taxrate as decimal) as tax_rate,
            cast(unitprice as decimal) as unit_price,
            cast(recommendedretailprice as decimal) as recommended_retail_price,
            cast(typicalweightperunit as decimal) as typical_weight_per_unit,
            cast(marketingcomments as string) as marketing_comments,
            cast(internalcomments as string) as internal_comments,
            cast(photo as string) as photo,
            cast(customfields as variant) as custom_fields,  -- Contains JSON data
            cast(tags as array) as tags, -- Data stored as arrays
            cast(searchdetails as string) as search_details,
            cast(lasteditedby as string) as last_edited_by,
            cast(validfrom as datetime) as valid_from,
            cast(validto as datetime) as valid_to

        from source

    )

select * from clean_warehouse_stockitem
