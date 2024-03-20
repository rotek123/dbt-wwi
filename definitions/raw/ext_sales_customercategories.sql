with
    source as (select * from {{ source("raw_wwi", "ext_sales_customercategories") }}),

    ext_sales_customercategories as (

        select

            CustomerCategoryID,
            CustomerCategoryName,
            LastEditedBy,
            ValidFrom,
            ValidTo

        from source

    )

select * from ext_sales_customercategories