select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      

    with test_data as (

        select
            cast('HUB_SITE_PATIENT_ALLERGY_SK' as 
    string
) as column_name,
            20 as matching_column_index,
            True as column_index_matches

    )
    select *
    from test_data
    where
        not(matching_column_index >= 0 and column_index_matches)
      
    ) dbt_internal_test