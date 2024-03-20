with
    source as (select * from {{ source("raw_wwi", "application_countries") }}),

    application_countries as (

        select

            CountryID,
            CountryName,
            FormalName,
            IsoAlpha3Code,
            IsoNumericCode,
            CountryType,
            LatestRecordedPopulation,
            Continent,
            Region,
            Subregion,
            LastEditedBy

        from source

    )

select *
from application_countries
