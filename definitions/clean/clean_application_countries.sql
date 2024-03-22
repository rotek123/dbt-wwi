with
    source as (select * from {{ source("raw_wwi", "application_countries") }}),

    clean_application_countries as (

        select

            cast(countryid as string) as country_id,
            cast(countryname as string) as country_name,
            cast(formalname as string) as formal_name,
            cast(isoalpha3code as string) as iso_alpha3_code,
            cast(isonumericcode as string) as iso_numeric_code,
            cast(countrytype as string) as country_type,
            cast(latestrecordedpopulation as int) as latest_recorded_population_countries,
            cast(continent as string) as continent,
            cast(region as string) as region,
            cast(subregion as string) as subregion,
            cast(lasteditedby as string) as last_edited_by

        from source

    )

select * from clean_application_countries
