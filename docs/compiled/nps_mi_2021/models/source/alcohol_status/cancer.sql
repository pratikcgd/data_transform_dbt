

with cancer as (

select
w.DIAGNOSIS_REASON,
w.DIAGNOSIS_DATE,
w.PATIENT_NUMBER,
q.SITE_ID,
q.PATIENT_CITY,
q.PATIENT_POSTCODE,
q.GENDER_CODE,
q.GENDER_NAME,
q.YEAR_OF_BIRTH,
q.YEAR_OF_DEATH,
q.DECEASED_INDICATOR,
q.ATSI_CODE,
q.ATSI_NAME,
q.PENSION_CODE,
q.PENSION_NAME,
q.CIS_PATIENT_STATUS_CODE,
q.CIS_PATIENT_STATUS_NAME,
q.PATIENT_CREATED_DATE,    
q.PATIENT_MODIFIED_DATE,
q.PHN_CODE,
q.SITE_POSTCODE,
y.STATE,
e.ALCOHOL_CODE,
e.ALCOHOL_STATUS_NAME,
r.ALLERGY_STATUS_CODE,
r.ALLERGY_STATUS_NAME,
t.SMOKING_STATUS_CODE,
t.SMOKING_STATUS_NAME,
t.SMOKING_FREQUENCY,
t.SMOKES_PER_DAY
from `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021_VIEWS_ONLY`.`src_temp_cancer` w
left join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PATIENT` q 
on w.PATIENT_NUMBER = q.PATIENT_NUMBER
left join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`ALCOHOL_STATUS` e 
on w.PATIENT_NUMBER = e.PATIENT_NUMBER
left join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`ALLERGY_REACTION` r
on w.PATIENT_NUMBER = r.PATIENT_NUMBER
left join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`SMOKING_STATUS` t
on w.PATIENT_NUMBER = t.PATIENT_NUMBER
left join 
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`SITE` y
on q.SITE_ID = y.SITE_NUMBER
)

SELECT * from cancer