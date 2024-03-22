{{ config(materialized="incremental") }}

with
    customer as (select * from {{ ref("clean_sales_customers") }}),
    customer_cat as (select * from {{ ref("clean_sales_customercategories") }}),
    model_customers as (
        select
            customer_id,
            delivery_city_id,
            postal_city_id,
            customer_name,
            customer_category_name,
            account_opened_date,
            delivery_postal_code
        from customer
        left join
            customer_cat
            on customer.customer_category_id = customer_cat.customer_category_id
    )
select *
from model_customers
