

with clinical_user_phc_md as (
select 
cast(hpo.SITE_ID as string) as SITE_ID,
cast(hpo.PRACTITIONER_ID  as string) as PROVIDER_ID,
cast(sspm.PRESCRIBER_NO as string) as PRESCRIBER_NUMBER,
cast(sspm.PROVIDER_NO as string) as PROVIDER_NUMBER,
cast("PHC_MD" as string) as SOURCE_SYSTEM,
cast(null as int) as CLINICAL_USER_TYPE_CODE,
cast(NULL as string) as CLINICAL_USER_TYPE_NAME,
cast(NULL as string) as DOCTOR_INDICATOR,
cast(NULL as string) as NURSE_INDICATOR,
cast(NULL as string) as PROVIDER_CIS_STATUS,
cast(NULL as string) as PROVIDER_WORK_STATUS,
cast(null as string) as PROVIDER_INACTIVE_DATE,
cast(sspm.STAMP_CREATED_DATETIME as string) as CREATE_DATETTIME,
cast(NULL as string) as PROVIDER_UPDATED_USER_ID,
cast(null as string) as PROVIDER_UPDATED_DATETIME,
cast(NULL as string) as PRESCRIBER_NUMBER_VALID_FLAG,
cast(NULL as string) as PROVIDER_NUMBER_VALID_FLAG
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PROVIDER_MD_OMOP` hpo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_LOGIN_SITE_PROVIDER_MD_OMOP` llsp 
on hpo.HUB_SITE_PROVIDER_MD_SK = llsp.HUB_SITE_PROVIDER_MD_SK
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PROVIDER_PHC_MD_OMOP` sspm 
on llsp.HUB_SITE_PROVIDER_MD_SK = sspm.HUB_SITE_PROVIDER_MD_SK
where 
	sspm.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND sspm.OMD_DELETED_RECORD_INDICATOR = 'N'
)


select * from clinical_user_phc_md