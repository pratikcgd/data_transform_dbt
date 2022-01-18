

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_practice_contact_phc_bp`
  OPTIONS()
  as 

SELECT
cast(hubb.OMD_NPS_SITE_ID as string) as SITE_ID,
cast(NULL as string) as PRACTICE_NAME,
cast(NULL as string) as PRACTICE_ID,
cast(NULL as string) as CRMID,
cast(hubb.PROVIDER_NUMBER as string) as PROVIDER_NUMBER,
cast(NULL as string) as CRM_CONTACT_ID,
cast(NULL as string) as CONTACT_SALUTATION,
cast(satt.FIRST_NAME as string) as CONTACT_FIRSTNAME,
cast(satt.SURNAME as string) as CONTACT_LASTNAME,
cast(NULL as string) as CONTACT_NPS_ROLE,
cast(NULL as string) as CONTACT_MEDICINEINSIGHT_ROLE
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PROVIDER_OMOP` hubb
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_LOGIN_SITE_PROVIDER_BP_OMOP` llsp 
on hubb.HUB_PROVIDER_SK = llsp.HUB_PROVIDER_SK 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PROVIDER_PHC_BP_OMOP` satt
on llsp.HUB_LOGIN_SK = satt.HUB_LOGIN_SK
where 
	satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND satt.OMD_DELETED_RECORD_INDICATOR = 'N';

