with
    source as (select * from {{ source("raw_wwi", "ext_sales_invoices") }}),

    clean_sales_invoices as (

        select

            cast(invoiceid as string) as invoice_id,
            cast(customerid as string) as customer_id,
            cast(billtocustomerid as string) as bill_to_customer_id,
            cast(orderid as string) as order_id,
            cast(deliverymethodid as string) as delivery_method_id,
            cast(contactpersonid as string) as contact_person_id,
            cast(accountspersonid as string) as accounts_person_id,
            cast(salespersonpersonid as string) as salesperson_person_id,
            cast(packedbypersonid as string) as packed_by_person_id,
            cast(invoicedate as date) as invoice_date,
            cast(customerpurchaseordernumber as string) as customer_purchase_order_number,
            cast(iscreditnote as boolean) as is_credit_note,
            cast(creditnotereason as string) as credit_note_reason,
            cast(comments as string) as comments,
            cast(deliveryinstructions as string) as delivery_instructions,
            cast(internalcomments as string) as internal_comments,
            cast(totaldryitems as int) as total_dry_items,
            cast(totalchilleritems as int) as total_chiller_items,
            cast(deliveryrun as string) as delivery_run,
            cast(runposition as string) as run_position,
            cast(returneddeliverydata as variant) as returned_delivery_data, -- Contains JSON data
            cast(confirmeddeliverytime as datetime) as confirmed_delivery_time,
            cast(confirmedreceivedby as string) as confirmed_received_by,
            cast(lasteditedby as string) as last_edited_by,
            cast(lasteditedwhen as datetime) as last_edited_when

        from source

    )

select * from clean_sales_invoices