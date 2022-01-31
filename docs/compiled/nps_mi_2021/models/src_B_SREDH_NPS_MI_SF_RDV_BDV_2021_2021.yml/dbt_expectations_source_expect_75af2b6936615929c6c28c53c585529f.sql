

    with test_data as (

        select
            cast('LNK_BILLING_SERVICE_PATIENT_SK' as 
    string
) as column_name,
            8 as matching_column_index,
            True as column_index_matches

    )
    select *
    from test_data
    where
        not(matching_column_index >= 0 and column_index_matches)