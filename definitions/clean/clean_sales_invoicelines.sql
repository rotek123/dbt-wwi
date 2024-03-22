with
    source as (select * from {{ source("raw_wwi", "ext_sales_invoicelines") }}),

    clean_sales_invoiceslines as (

        select

            cast(invoicelineid as string) as invoice_line_id,
            cast(invoiceid as string) as invoice_id,
            cast(stockitemid as string) as stock_item_id,
            cast(description as string) as description,
            cast(packagetypeid as string) as package_type_id,
            cast(quantity as int) as quantity,
            cast(unitprice as decimal) as unit_price,
            cast(taxrate as decimal) as tax_rate,
            cast(taxamount as decimal) as tax_amount,
            cast(lineprofit as decimal) as line_profit,
            cast(extendedprice as decimal) as extended_price,
            cast(lasteditedby as datetime) as last_edited_by,
            cast(lasteditedwhen as datetime) as last_edited_when

        from source

    )

select * from clean_sales_invoiceslines