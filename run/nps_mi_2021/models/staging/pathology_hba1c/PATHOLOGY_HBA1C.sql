

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PATHOLOGY_HBA1C`
  
  
  OPTIONS()
  as (
    

with pathology_hba1c as (
select
cast(lbpa.HUB_SITE_PATIENT_SK as STRING) as PATIENT_NUMBER,
cast(hbpo.SITE_ID as STRING) as SITE_ID,
cast(hbpo.PATHOLOGY_ID AS STRING) as PATHOLOGY_ID,
cast(sbph.PATHOLOGY_TEST_DATETIME as TIMESTAMP) AS PATHOLOGY_TEST_DATETIME,
cast(sbph.PATHOLOGY_TEST_TYPE as STRING) AS PATHOLOGY_TEST_TYPE,
cast(sbph.LOINC_CODE as STRING) AS LOINC_CODE,
cast(sbph.LOINC_CODE_VALID_INDICATOR as STRING) AS LOINC_CODE_VALID_INDICATOR,
cast(sbph.RESULT_VALUE_CIS as STRING) AS RESULT_VALUE_CIS,
cast(sbph.RESULT_VALUE_STND as STRING) AS RESULT_VALUE_STND,
cast(sbph.RESULT_VALUE_TYPE as STRING) AS RESULT_VALUE_TYPE,
cast(sbph.DETECTED_CIS_UNIT_OF_MEASURE as STRING) AS DETECTED_CIS_UNIT_OF_MEASURE,
cast(sbph.RESULT_AVAILABLE_INDICATOR as STRING) AS RESULT_AVAILABLE_INDICATOR,
cast(sbph.RESULT_VALID_RANGE_INDICATOR as STRING) AS RESULT_VALID_RANGE_INDICATOR,
cast(sbph.RESULT_VALID_FORMAT_INDICATOR as STRING) AS RESULT_VALID_FORMAT_INDICATOR,
cast(sbph.RESULT_INVALID_REASON as STRING) AS RESULT_INVALID_REASON,
cast(sbph.RESULT_IMPORT_INDICATOR as STRING) AS RESULT_IMPORT_INDICATOR,
cast(sbph.RESULT_HEADER_ONLY_INDICATOR as STRING) AS RESULT_HEADER_ONLY_INDICATOR,
cast(sbph.RESULT_TRANSMISSION_TYPE as STRING) AS RESULT_TRANSMISSION_TYPE,
cast('<48 mmol/mol' as STRING) AS HBA1C_RANGE_AIHW
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_BDV_PATHOLOGY_OMOP` hbpo
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_BDV_PATHOLOGY_HBA1C_OMOP` sbph 
on hbpo.HUB_BDV_PATHOLOGY_SK = sbph.HUB_BDV_PATHOLOGY_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_BDV_PATHOLOGY_OMOP` lbpa
on hbpo.HUB_BDV_PATHOLOGY_SK = lbpa.HUB_BDV_PATHOLOGY_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_BDV_PATHOLOGY_OMOP` lsbpa
on lbpa.LNK_BDV_PATHOLOGY_SK = lsbpa.LNK_BDV_PATHOLOGY_SK
WHERE 
	sbph.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sbph.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lsbpa.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND lsbpa.OMD_DELETED_RECORD_INDICATOR = 'N'

)

select * from pathology_hba1c
  );
  