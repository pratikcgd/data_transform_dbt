

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_clinical_user_md`
  OPTIONS()
  as 

with clinical_user_md as (
select 
cast(hpo.SITE_ID as string) as SITE_ID,
cast(hpo.PRACTITIONER_ID  as string) as PROVIDER_ID,
cast(hpro.PRESCRIBER_NUMBER as string) as PRESCRIBER_NUMBER,
cast(hprov.PROVIDER_NUMBER as string) as PROVIDER_NUMBER,
cast("MD" as string) as SOURCE_SYSTEM,
cast(null as int) as CLINICAL_USER_TYPE_CODE,
cast(NULL as string) as CLINICAL_USER_TYPE_NAME,
cast(NULL as string) as DOCTOR_INDICATOR,
cast(NULL as string) as NURSE_INDICATOR,
cast(NULL as string) as PROVIDER_CIS_STATUS,
cast(NULL as string) as PROVIDER_WORK_STATUS,
cast(null as string) as PROVIDER_INACTIVE_DATE,
cast(sspm.PRACTITIONER_CREATED_DATETIME as string) as CREATE_DATETTIME,
cast(NULL as string) as PROVIDER_UPDATED_USER_ID,
cast(sspm.PRACTITIONER_UPDATED_DATETIME as string) as PROVIDER_UPDATED_DATETIME,
cast(NULL as string) as PRESCRIBER_NUMBER_VALID_FLAG,
cast(NULL as string) as PROVIDER_NUMBER_VALID_FLAG
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PROVIDER_MD_OMOP` hpo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_LOGIN_SITE_PROVIDER_MD_OMOP` llsp 
on hpo.HUB_SITE_PROVIDER_MD_SK = llsp.HUB_SITE_PROVIDER_MD_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PROVIDER_MD_OMOP` sspm 
on llsp.HUB_SITE_PROVIDER_MD_SK = sspm.HUB_SITE_PROVIDER_MD_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PRACTITIONER_OMOP` hpro 
on llsp.HUB_PRACTITIONER_SK = hpro.HUB_PRACTITIONER_SK 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PROVIDER_OMOP` hprov
on llsp.HUB_PROVIDER_SK = hprov.HUB_PROVIDER_SK 
where 
	sspm.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sspm.OMD_DELETED_RECORD_INDICATOR = 'N'
)


select * from clinical_user_md;

