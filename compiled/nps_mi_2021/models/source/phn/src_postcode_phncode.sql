

with distinct_postcode as (

select distinct cast(POSTCODE_2019 as STRING) as POSTCODE_2019, cast(PHN_CODE_2017 as string) as PHN_CODE_2017 from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`POSTCODE`

),

string_joined as (
select POSTCODE_2019, STRING_AGG(PHN_CODE_2017, ',') as PHN_CODE_2017
From distinct_postcode
group by POSTCODE_2019
)

select * from string_joined