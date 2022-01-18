select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('EDC' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('LMP' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PARITY' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKER' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('EDCSCAN' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('GRAVIDA' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('LNMP_IRR' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALLERGIES' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALCOHOL_EX' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('LNMP_CYCLE' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_EX' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('BLOOD_GROUP' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('BREAST_FEEDS' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('MISCARRIAGES' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CEASED_SMOKING' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PREGNANCY_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKES_PER_DAY' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ELITE_SPORTSMAN' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_NPS_SITE_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_COMMENT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('STARTED_SMOKING' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALCOHOL_COMMENTS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CREATED_DATETIME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PREGNANCY_NUMBER' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('UPDATED_DATETIME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_SOURCE_ROW_ID' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_FREQUENCY' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALCOHOL_CONSUMPTION' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_EXPIRY_DATETIME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_HASH_FULL_RECORD' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_RECORD_SOURCE_ID' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PREGNANCY_TERMINATION' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_EFFECTIVE_DATETIME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALCOHOL_ASSESSMENT_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_ABSTINENCE_UNIT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_ASSESSMENT_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_CURRENT_RECORD_INDICATOR' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_DELETED_RECORD_INDICATOR' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_INSERT_MODULE_INSTANCE_ID' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_LAST_QUIT_ATTEMPT_DATE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('HUB_SITE_PATIENT_CLINICAL_MD_SK' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_STAGE_CHANGE_ASSESSMENT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PATIENT_CONCERNED_ABOUT_DRINKING' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ALCOHOL_PATTERN_CONSUMPTION_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SMOKING_LONGEST_ABSTINENCE_DURATION' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SIX_OR_MORE_STANDARD_DRINKS_ON_ONE_OCCASION' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('_AIRBYTE_EMITTED_AT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('_AIRBYTE_SAT_SITE_PATIENT_CLINICAL_MD_OMOP_HASHID' as 
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
            relation_column = 'HUB_SITE_PATIENT_CLINICAL_MD_SK'
            and
            relation_column_type not in ('STRING')

    )
    select *
    from test_data
      
    ) dbt_internal_test