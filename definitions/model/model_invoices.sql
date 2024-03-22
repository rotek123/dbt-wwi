{{ config(materialized="incremental") }}

with
    invoice_lines as (select * from {{ ref("clean_sales_invoicelines") }}),
    invoices as (select * from {{ ref("clean_sales_invoices") }}),
    model_invoices as (
        select
            invoices.invoice_id,
            invoice_lines.invoice_line_id,
            invoices.customer_id,
            invoices.bill_to_customer_id,
            invoices.order_id,
            invoices.delivery_method_id,
            invoices.contact_person_id,
            invoices.accounts_person_id,
            invoices.salesperson_person_id,
            invoices.packed_by_person_id,
            invoice_lines.stock_item_id,
            invoice_lines.package_type_id,
            invoices.invoice_date,
            invoice_lines.quantity,
            invoice_lines.unit_price,
            invoice_lines.tax_rate,
            invoice_lines.tax_amount,
            invoice_lines.line_profit,
            invoice_lines.extended_price
        from invoice_lines
        left join invoices on invoice_lines.invoice_id = invoices.invoice_id
    )
select *
from model_invoices