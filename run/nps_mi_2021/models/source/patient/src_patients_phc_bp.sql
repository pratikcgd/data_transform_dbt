

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_phc_bp`
  OPTIONS()
  as 

with patient_phc_bp as (

select
cast(satt.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
cast(hspo.SITE_ID as string) as SITE_ID,
cast(satt.CITY as string) as PATIENT_CITY,
cast(satt.POST_CODE as string) as PATIENT_POSTCODE,
cast(case 
		when satt.SEX_CODE = 1
		THEN '1'
		WHEN satt.SEX_CODE = 2
		THEN '2'
        WHEN satt.SEX_CODE = 3
		THEN '3'
        WHEN satt.SEX_CODE = 4
		THEN '9'
		ELSE
		'99'
		END AS STRING) as GENDER_CODE,
cast(case 
		when satt.SEX_CODE = 1
		THEN 'Male' 
		WHEN satt.SEX_CODE = 2
		THEN 'Female'
        WHEN satt.SEX_CODE = 3
		THEN 'Intersex or indeterminate'
        WHEN satt.SEX_CODE = 4
		THEN 'Not stated/inadequately described'
		ELSE
		'Not recorded'
		END AS STRING) as GENDER_NAME,
cast(satt.YOB as int) as YEAR_OF_BIRTH,
cast(satt.YOD as int) as YEAR_OF_DEATH,
cast(case 
        WHEN satt.PATIENT_STATUS = 3 OR satt.YOD is not NULL
        THEN 'Deceased'
        ELSE
        'Not Deceased' END as string) as DECEASED_INDICATOR,
cast(case 
		when satt.ORIGIN = 1
		THEN '1'
		WHEN satt.ORIGIN = 2
		THEN '2'
		when satt.ORIGIN = 3
		THEN '3'
		when satt.ORIGIN = 4
		THEN '4'
        when satt.ORIGIN = 8
		THEN '9'
        when satt.ORIGIN = 0
		THEN '99'
		END AS STRING) as ATSI_CODE,
cast(case 
		when satt.ORIGIN = 1
		THEN 'Aboriginal but not TSI origin'
		WHEN satt.ORIGIN = 2
		THEN 'TSI but not Aboriginal origin'
		when satt.ORIGIN = 3
		THEN 'Both Aboriginal and TSI origin'
		when satt.ORIGIN = 4
		THEN 'Neither Aboriginal nor TSI origin'
        when satt.ORIGIN = 8
		THEN 'Not stated/inadequately described'
		when satt.ORIGIN = 0
        THEN 'Not recorded'
		END AS STRING) as ATSI_NAME,
cast(case 
        when satt.PENSION_CODE = 1
        THEN '1'
        when satt.PENSION_CODE = 3
        THEN '3'
        when satt.PENSION_CODE = 4
        THEN '4'
        ELSE
        '99'
        END as string) as PENSION_CODE,
cast(case 
        when satt.PENSION_CODE = 1
        THEN 'No Concession Card (Pension/DVA)'
        when satt.PENSION_CODE = 3
        THEN 'Health Care Card'
        when satt.PENSION_CODE = 4
        THEN 'Commonwealth Seniors Health Card'
        ELSE
        'Not recorded'
        END as string) as PENSION_NAME,
cast(case
        WHEN satt.PATIENT_STATUS = 1
        then 'A'
        WHEN satt.PATIENT_STATUS = 2
        then 'I' 
        WHEN satt.PATIENT_STATUS = 3
        then 'D'
        END as string) as CIS_PATIENT_STATUS,
cast(case
        WHEN satt.PATIENT_STATUS = 1
        then 'Active'
        WHEN satt.PATIENT_STATUS = 2
        then 'Inactive' 
        WHEN satt.PATIENT_STATUS = 3
        then 'Deceased'
        END as string) as CIS_PATIENT_STATUS_NAME,
cast(case 
		when satt.PATIENT_STATUS = 1
		THEN 'RACGP Active'
		ELSE
		'RACGP Inactive'
		END AS STRING) as RACGP_PATIENT_STATUS_INDICATOR,
cast(satt.CREATED as string) as PATIENT_CREATED_DATE,
cast(satt.UPDATED as string) as PATIENT_MODIFIED_DATE,
cast(phn.PHN_CODE_2017 as string) as PHN_CODE,
cast(ss.POSTCODE_ORIGINAL as INT) as SITE_POSTCODE
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hspo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_BP_OMOP` satt
on hspo.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
INNER join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`SITE` ss
on hspo.SITE_ID = ss.HUB_SITE_SK
left join
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_postcode_phncode` phn 
on ss.POSTCODE_ORIGINAL = phn.POSTCODE_2019
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND satt.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from patient_phc_bp;

