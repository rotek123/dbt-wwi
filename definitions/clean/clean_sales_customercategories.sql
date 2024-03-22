with
    source as (select * from {{ source("raw_wwi", "ext_sales_customercategories") }}),

    clean_sales_customercategories as (

        select

            cast(customercategoryid as string) as customer_category_id,
            cast(customercategoryname as string) as customer_category_name,
            cast(lasteditedby as string) as last_edited_by,
            cast(validfrom as string) as valid_from,
            cast(validto as string) as valid_to,

        from source

    )

select * from clean_sales_customercategories