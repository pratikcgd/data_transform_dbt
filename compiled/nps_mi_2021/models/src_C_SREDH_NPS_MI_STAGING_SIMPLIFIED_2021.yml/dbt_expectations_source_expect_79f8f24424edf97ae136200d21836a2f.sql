with relation_columns as (

        
        select
            cast('SITE_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_NAME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CRMID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_ADDRESS_STREET1' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_ADDRESS_STREET2' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_SUBURB' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_POSTCODE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_STATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_NUMBER_OF_GP' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_CATEGORY' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_FULLTIME_EMPLOYEES' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_RECRUITMENT_ONBOARDING_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_RECRUITMENT_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PROGRAM_NAME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('RECRUITMENT_CHANNEL' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('RECRUITMENT_AGREED_SIGNED_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRACTICE_RECRUITMENT_WITHDRAWN_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'SITE_ID'
            and
            relation_column_type not in ('STRING')

    )
    select *
    from test_data