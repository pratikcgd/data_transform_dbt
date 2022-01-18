select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      with relation_columns as (

        
        select
            cast('PATIENT_NUMBER' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('IMMUNISATION_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('GIVEN_HERE' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PROVIDER_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ADMINISTERED_BY' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('GIVEN_DATE' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('VACCINE_NAME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('VACCINE_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('BATCH_NUMBER' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SEQUENCE_NUMBER' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CONSENT_CODE' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CONSENT_PROVIDER' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SITE_CODE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ADMINISTERED_ROUTE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('VIVAS_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('VIVAS_PRINTED_DATE' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ACIR_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('AGE' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ACIR_TRANSMITTED_DATE' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('INTERNAL_AGE' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('INTERNAL_IMM' as 
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
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CREATED_BY' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('UPDATED_DATETIME' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('UPDATED_BY' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('RECORD_STATUS' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('PRINTED_DATETIME' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('DRUG_NO' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('INFLUENZA' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('INFLUENZA_SENT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SITE_ID' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SOURCE_SYSTEM' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_EFFECTIVE_DATETIME' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_SOURCE_ROW_ID' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_INSERT_MODULE_INSTANCE_ID' as 
    string
) as relation_column,
            cast('INT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('OMD_EXPIRY_DATETIME' as 
    string
) as relation_column,
            cast('TIMESTAMP' as 
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
            cast('OMD_RECORD_SOURCE_ID' as 
    string
) as relation_column,
            cast('INT64' as 
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
        
        
    ),
    test_data as (

        select
            *
        from
            relation_columns
        where
            relation_column = 'CREATED_DATETIME'
            and
            relation_column_type not in ('DATETIME')

    )
    select *
    from test_data
      
    ) dbt_internal_test