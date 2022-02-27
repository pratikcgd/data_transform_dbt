

  create or replace table `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PRACTICE_RECRUITMENT`
  
  
  OPTIONS()
  as (
    

WITH practice_bdv as (

select distinct HUB_SITE_SK, SITE_NAME, POSTCODE_ORIGINAL, STATE, 
CRM_SITE_RECRUITMENT_STATUS, CRM_SITE_RECRUITMENT_AGREED_SIGNED_DATE,
CRM_SITE_RECRUITMENT_WITHDRAWN_DATE , OMD_CURRENT_RECORD_INDICATOR, OMD_DELETED_RECORD_INDICATOR
FROM `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_BDV_SITE_OMOP`
), 

practice_recruitment as (
select 
cast(hub.HUB_SITE_SK as string) as SITE_ID,
cast(bdv.SITE_NAME as string) as PRACTICE_NAME,
cast(NULL as string) as PRACTICE_ID,
cast(NULL as string) as CRMID,
cast(NULL as string) as PRACTICE_ADDRESS_STREET1,
cast(NULL as string) as PRACTICE_ADDRESS_STREET2,
cast(NULL as string) as PRACTICE_SUBURB,
cast(bdv.POSTCODE_ORIGINAL as string) as PRACTICE_POSTCODE,
cast(bdv.STATE as string) as PRACTICE_STATE,
cast(NULL as string) as PRACTICE_NUMBER_OF_GP,
cast(NULL as string) as PRACTICE_CATEGORY,
cast(NULL as int ) as PRACTICE_FULLTIME_EMPLOYEES,
cast(NULL as string) as PRACTICE_RECRUITMENT_ONBOARDING_STATUS,
cast(bdv.CRM_SITE_RECRUITMENT_STATUS as string) as PRACTICE_RECRUITMENT_STATUS,
cast(NULL as string) as PROGRAM_NAME,
cast(NULL as string) as RECRUITMENT_CHANNEL,
cast(bdv.CRM_SITE_RECRUITMENT_AGREED_SIGNED_DATE as string) as RECRUITMENT_AGREED_SIGNED_DATE,
cast(bdv.CRM_SITE_RECRUITMENT_WITHDRAWN_DATE as string) as PRACTICE_RECRUITMENT_WITHDRAWN_DATE,
cast('BDV' as string) as SOURCE_SYSTEM,
cast('SAT_BDV_SITE_OMOP' as string) as SOURCE_TABLE
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_OMOP` hub
LEFT join 
practice_bdv bdv 
on hub.HUB_SITE_SK = bdv.HUB_SITE_SK 
where
    bdv.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND bdv.OMD_DELETED_RECORD_INDICATOR = 'N'

)


SELECT * FROM practice_recruitment
  );
  