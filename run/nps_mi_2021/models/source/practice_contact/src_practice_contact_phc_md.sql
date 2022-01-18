

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_practice_contact_phc_md`
  OPTIONS()
  as 

SELECT
cast(hpo.SITE_ID as string) as SITE_ID,
cast(NULL as string) as PRACTICE_NAME,
cast(hpo.PRACTITIONER_ID as string) as PRACTICE_ID,
cast(NULL as string) as CRMID,
cast(sspm.PROVIDER_NO as string) as PROVIDER_NUMBER,
cast(NULL as string) as CRM_CONTACT_ID,
cast(NULL as string) as CONTACT_SALUTATION,
cast(NULL as string) as CONTACT_FIRSTNAME,
cast(NULL as string) as CONTACT_LASTNAME,
cast(NULL as string) as CONTACT_NPS_ROLE,
cast(NULL as string) as CONTACT_MEDICINEINSIGHT_ROLE
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
	AND sspm.OMD_DELETED_RECORD_INDICATOR = 'N';

