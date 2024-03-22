with
    source as (select * from {{ source("raw_wwi", "ext_sales_customers") }}),

    clean_sales_customers as (

        select

            cast(customerid as string) as customer_id,
            cast(customername as string) as customer_name,
            cast(billtocustomerid as string) as bill_to_customer_id,
            cast(customercategoryid as string) as customer_category_id,
            cast(buyinggroupid as string) as buying_group_id,
            cast(primarycontactpersonid as string) as primary_contact_person_id,
            cast(alternatecontactpersonid as string) as alternate_contact_person_id,
            cast(deliverymethodid as string) as delivery_method_id,
            cast(deliverycityid as string) as delivery_city_id,
            cast(postalcityid as string) as postal_city_id,
            cast(creditlimit as string) as credit_limit,
            cast(accountopeneddate as date) as account_opened_date,
            cast(standarddiscountpercentage as decimal) as standard_discount_percentage,
            cast(isstatementsent as boolean) as is_statement_sent,
            cast(isoncredithold as boolean) as is_on_credit_hold,
            cast(paymentdays as int) as payment_days,
            cast(phonenumber as string) as phone_number,
            cast(faxnumber as string) as fax_number,
            cast(deliveryrun as string) as delivery_run,
            cast(runposition as string) as run_position,
            cast(websiteurl as string) as website_url,
            cast(deliveryaddressline1 as string) as delivery_address_line1,
            cast(deliveryaddressline2 as string) as delivery_address_line2,
            cast(deliverypostalcode as string) as delivery_postal_code,
            cast(deliverylocation as string) as delivery_location,
            cast(postaladdressline1 as string) as postal_address_line1,
            cast(postaladdressline2 as string) as postal_address_line2,
            cast(postalpostalcode as string) as postal_postal_code,
            cast(lasteditedby as string) as last_edited_by,
            cast(validfrom as datetime) as valid_from,
            cast(validto as datetime) as valid_to

        from source

    )

select * from clean_sales_customers
