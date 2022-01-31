

with active_patients AS (
select HUB_PATIENT.HUB_SITE_PATIENT_SK from
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` HUB_PATIENT
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_MD_OMOP` SAT_PATIENT_GRH_MD
ON
	HUB_PATIENT.HUB_SITE_PATIENT_SK = SAT_PATIENT_GRH_MD.HUB_SITE_PATIENT_SK
WHERE 
	SAT_PATIENT_GRH_MD.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND SAT_PATIENT_GRH_MD.OMD_DELETED_RECORD_INDICATOR = 'N'

	UNION ALL
	
select HUB_PATIENT.HUB_SITE_PATIENT_SK from
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` HUB_PATIENT 
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_BP_OMOP` SAT_PATIENT_GRH_BP
ON
	HUB_PATIENT.HUB_SITE_PATIENT_SK = SAT_PATIENT_GRH_BP.HUB_SITE_PATIENT_SK
WHERE 
	SAT_PATIENT_GRH_BP.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND SAT_PATIENT_GRH_BP.OMD_DELETED_RECORD_INDICATOR = 'N'
	
	UNION ALL 
	
select HUB_PATIENT.HUB_SITE_PATIENT_SK from
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` HUB_PATIENT 
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_MD_OMOP` SAT_PATIENT_PHC_MD
ON
	HUB_PATIENT.HUB_SITE_PATIENT_SK = SAT_PATIENT_PHC_MD.HUB_SITE_PATIENT_SK
WHERE 
	SAT_PATIENT_PHC_MD.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND SAT_PATIENT_PHC_MD.OMD_DELETED_RECORD_INDICATOR = 'N'

		UNION ALL
	
select HUB_PATIENT.HUB_SITE_PATIENT_SK from
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` HUB_PATIENT 
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_PHC_BP_OMOP` SAT_PATIENT_PHC_BP
ON
	HUB_PATIENT.HUB_SITE_PATIENT_SK = SAT_PATIENT_PHC_BP.HUB_SITE_PATIENT_SK
WHERE 
	SAT_PATIENT_PHC_BP.OMD_CURRENT_RECORD_INDICATOR = 'Y'
	AND SAT_PATIENT_PHC_BP.OMD_DELETED_RECORD_INDICATOR = 'N'
)
select distinct HUB_SITE_PATIENT_SK from active_patients