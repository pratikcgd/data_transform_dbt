with relation_columns as (

        
        select
            cast('COMMENT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CREATED' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('UPDATED' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('USER_ID' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('REACTION' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('SEVERITY' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('CREATEDBY' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ITEM_CODE' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ITEM_NAME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('ITEM_TYPE' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('UPDATEDBY' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('REACTION_CODE' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('RECORD_STATUS' as 
    string
) as relation_column,
            cast('FLOAT64' as 
    string
) as relation_column_type
        union all
        
        select
            cast('VISIT_UPDATED' as 
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
            cast('OMD_SOURCE_ROW_ID' as 
    string
) as relation_column,
            cast('FLOAT64' as 
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
            cast('OMD_EFFECTIVE_DATETIME' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('HUB_SITE_PATIENT_ALLERGY_SK' as 
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
            cast('_AIRBYTE_EMITTED_AT' as 
    string
) as relation_column,
            cast('STRING' as 
    string
) as relation_column_type
        union all
        
        select
            cast('_AIRBYTE_SAT_SITE_PATIENT_ALLERGY_PHC_BP_OMOP_HASHID' as 
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
            relation_column = 'HUB_SITE_PATIENT_ALLERGY_SK'
            and
            relation_column_type not in ('STRING')

    )
    select *
    from test_data