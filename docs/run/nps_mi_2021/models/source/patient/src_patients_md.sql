

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_patients_md`
  OPTIONS()
  as 

with patient_md as (

select
cast(satt.HUB_SITE_PATIENT_SK as string) as PATIENT_NUMBER,
cast(hspo.SITE_ID as string) as SITE_ID,
cast(satt.CITY as string) as PATIENT_CITY,
cast(satt.POSTCODE as string) as PATIENT_POSTCODE,
cast(case 
		when satt.GENDER_CODE = 'M' OR satt.GENDER_CODE = 'm'
		THEN '1'
		WHEN satt.GENDER_CODE = 'F' OR satt.GENDER_CODE = 'f'
		THEN '2' 
		WHEN satt.GENDER_CODE = 'X'
		THEN '3'
		WHEN satt.GENDER_CODE = 'O' or satt.GENDER_CODE = '-' or satt.GENDER_CODE = '?' or satt.GENDER_CODE = ' '
		THEN '9'
		ELSE 
		'99'
		END AS STRING) as GENDER_CODE,
cast(case 
		when satt.GENDER_CODE = 'M' OR satt.GENDER_CODE = 'm'
		THEN 'Male'
		WHEN satt.GENDER_CODE = 'F' OR satt.GENDER_CODE = 'f'
		THEN 'Female'
		WHEN satt.GENDER_CODE = 'X'
		THEN 'Intersex or indeterminate'
		WHEN satt.GENDER_CODE = 'O' or satt.GENDER_CODE = '-' or satt.GENDER_CODE = '?' or satt.GENDER_CODE = ' '
		THEN 'Not stated/inadequately described'
		ELSE
		'Not recorded'
		END AS STRING) as GENDER_NAME,
cast(satt.YEAR_OF_BIRTH as int) as YEAR_OF_BIRTH,
cast(satt.YEAR_OF_DEATH as int) as YEAR_OF_DEATH,
cast(case 
		WHEN satt.STATUS_CODE = 'D' OR satt.YEAR_OF_DEATH is not NULL
		THEN 'Deceased'
		ELSE
		'Not Deceased' END as string) as DECEASED_INDICATOR,
cast(case 
		when satt.ATSI = '1' OR satt.ATSI = '1.00000'
		THEN '1'
		WHEN satt.ATSI = '2' OR satt.ATSI = '2.00000'
		THEN '2'
		when satt.ATSI = '3' OR satt.ATSI = '3.00000'
		THEN '3'
		when satt.ATSI = '4' OR satt.ATSI = '4.00000'
		THEN '4'
		when satt.ATSI = '9' OR satt.ATSI = '9.00000'
		THEN '9'
		ELSE
		'99'
		END AS STRING) as ATSI_CODE,
cast(case 
		when satt.ATSI = '1' OR satt.ATSI = '1.00000'
		THEN 'Aboriginal but not TSI origin'
		WHEN satt.ATSI = '2' OR satt.ATSI = '2.00000'
		THEN 'TSI but not Aboriginal origin'
		when satt.ATSI = '3' OR satt.ATSI = '3.00000'
		THEN 'Both Aboriginal and TSI origin'
		when satt.ATSI = '4' OR satt.ATSI = '4.00000'
		THEN 'Neither Aboriginal nor TSI origin'
		when satt.ATSI = '9' OR satt.ATSI = '9.00000'
		THEN 'Not stated/inadequately described'
		ELSE
		'Not recorded'
		END AS STRING) as ATSI_NAME,
cast(case 
		when satt.PENSION_CODE = 'P'
		THEN '2'
		when satt.PENSION_CODE = 'R'
		THEN '5'
		when satt.PENSION_CODE = 'N'
		THEN '1'
		when satt.PENSION_CODE = 'L'
		THEN '51'
		ELSE
		'99'
		END as string) as PENSION_CODE,
cast(case 
		when satt.PENSION_CODE = 'P'
		THEN 'Pensioner Concession Card'
		when satt.PENSION_CODE = 'R'
		THEN 'Pensioner or Health Care Card'
		when satt.PENSION_CODE = 'N'
		THEN 'No Concession Card (Pension/DVA)'
		when satt.PENSION_CODE = 'L'
		THEN 'Limited DVA (White, Lilac, Orange)'
		ELSE
		'Not recorded'
		END as string) as PENSION_NAME,
cast(satt.STATUS_CODE as string) as CIS_PATIENT_STATUS_CODE,
cast(case 
		when satt.STATUS_CODE = 'A'
		THEN 'Active'
		WHEN satt.STATUS_CODE = 'D'
		THEN 'Deceased'
		when satt.STATUS_CODE = 'I'
		THEN 'Inactive'
		when satt.STATUS_CODE = 'V'
		THEN 'Visitor'
		when satt.STATUS_CODE = 'K'
		THEN 'Next of Kin'
		when satt.STATUS_CODE = 'E'
		THEN 'Emergency Contact'
		END AS STRING) as CIS_PATIENT_STATUS_NAME,
cast(case 
		when satt.STATUS_CODE = 'A'
		THEN 'RACGP Active'
		ELSE
		'RACGP Inactive'
		END AS STRING) as RACGP_PATIENT_STATUS_INDICATOR,
cast(satt.PATIENT_CREATED_DATETIME as string) as PATIENT_CREATED_DATE,
cast(satt.PATIENT_UPDATED_DATETIME as string) as PATIENT_MODIFIED_DATE,
cast(phn.PHN_CODE_2017 as string) as PHN_CODE,
cast(ss.POSTCODE_ORIGINAL as INT) as SITE_POSTCODE
from 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` hspo 
inner join 
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_MD_OMOP` satt
on hspo.HUB_SITE_PATIENT_SK = satt.HUB_SITE_PATIENT_SK
INNER join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`SITE` ss
on hspo.SITE_ID = ss.SITE_NUMBER
left join
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`src_postcode_phncode` phn 
on ss.POSTCODE_ORIGINAL = phn.POSTCODE_2019
where
    satt.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND satt.OMD_DELETED_RECORD_INDICATOR = 'N'
)

select * from patient_md;

