

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_long_md`
  OPTIONS()
  as 


select 
cast(hubb.SITE_ID as string) as SITE_ID,
cast(lsps.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
cast(case
        when satt.STATUS_CODE = '1'
        then '1'
        when satt.STATUS_CODE = '2'
        then '2'
        when satt.STATUS_CODE = '3'
        then '3'
        end as string) as CIS_PATIENT_STATUS_CODE,
cast(case
        when satt.STATUS_CODE = '1'
        then 'Active'
        when satt.STATUS_CODE = '2'
        then 'Inactive'
        when satt.STATUS_CODE = '3'
        then 'Deceased'
        end as string) as CIS_PATIENT_STATUS_NAME,
cast(satt.PATIENT_CREATED_DATETIME as timestamp) as RECORD_START_DATE,
cast(NULL as timestamp) as RECORD_END_DATE,
cast("GRH" as string) as DATA_PROVIDER,
cast("MD" as string) as SOURCE_SYSTEM,
cast(null as string) as IS_DELETED
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hubb 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_MD_OMOP` satt
on hubb.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_SITE_PATIENT_SITE_OMOP` lsps
on hubb.HUB_SITE_PATIENT_SK = lsps.HUB_SITE_PATIENT_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_SITE_PATIENT_SITE_OMOP` lssps
on lsps.LNK_SITE_PATIENT_SITE_SK = lssps.LNK_SITE_PATIENT_SITE_SK
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND satt.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND lssps.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND lssps.OMD_DELETED_RECORD_INDICATOR = 'N';

