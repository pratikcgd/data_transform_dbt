

with prescription_grh_md as (
SELECT
    LNK_PRESCRIPTION.HUB_SITE_PATIENT_SK AS PATIENT_NUMBER,
    HUB_PRESCRIPTION.OMD_NPS_SITE_ID AS SITE_ID,
    HUB_PRESCRIPTION.SOURCE_SYSTEM AS SOURCE_SYSTEM,
    'SAT_PRESCRIPTION_MD_EXCLD_SENSITIVE_DATA_OMOP' AS SOURCE_TABLE,
    HUB_PRESCRIPTION.PRESCRIPTION_ID AS PRESCRIPTION_ID,
    CAST(SAT_PRESCRIPTION.CEASED AS STRING) AS RECORD_STATUS,
    SAT_PRESCRIPTION.DOSE AS DOSE,
    SAT_PRESCRIPTION.INSTRUCTIONS AS INSTRUCTIONS,
    SAT_MEDICINE.TRADE_NAME AS MEDICINE_NAME,
    SAT_MEDICINE.GENINT AS MEDICINE_ACTIVE_INGREDIENT,
    CAST(SAT_PRESCRIPTION.QUANTITY AS STRING) AS QUANTITY,
    SAT_PRESCRIPTION.REPEATS AS REPEATS,
    SAT_PRESCRIPTION.REPEAT_GAP AS REPEAT_INTERVAL,
    SAT_PRESCRIPTION.SCRIPT_CODE AS RESTRICTION_CODE,
    CAST(SAT_PRESCRIPTION.ROUTE_CODE AS STRING) AS ROUTE,
    CAST(SAT_PRESCRIPTION.FIRST_DATE AS STRING) AS FIRST_DATE,
    CAST(SAT_PRESCRIPTION.LAST_DATE AS STRING) AS LAST_DATE,
    CAST(NULL AS STRING) AS AUTHORITY_INDICATION,
    CAST(SAT_PRESCRIPTION.CEASED_DATE AS STRING) AS DELETION_DATE,
    SAT_PRESCRIPTION.REASON_DELETION AS DELETION_REASON,
    CAST(SAT_PRESCRIPTION.LIMITED AS STRING) AS RX_STATUS_LIMITED_MEDICATION,
    CAST(SAT_PRESCRIPTION.FREQUENCY AS STRING) AS FREQUENCY,
    SAT_PRESCRIPTION.REASON AS REASON,
    SAT_PRESCRIPTION.REASON_CODE AS REASON_CODE,
    CAST(SAT_PRESCRIPTION.PREVIOUS_AUTHORITY AS STRING) AS PREVIOUS_AUTHORITY,
    SAT_PRESCRIPTION.STAMP_CREATED_USER_ID AS CREATED_BY,
    SAT_PRESCRIPTION.STAMP_CREATED_DATETIME AS CREATED_DATETIME,
    SAT_PRESCRIPTION.STAMP_USER_ID AS UPDATED_BY,
    SAT_PRESCRIPTION.STAMP_DATETIME AS UPDATED_DATETIME,
    CAST(NULL AS STRING) AS BP_PRODUCT_ID,
    CAST(NULL AS STRING) AS MD_DRUG_NO,
    CAST(NULL AS STRING) AS STRENGTH,
    SAT_MEDICINE_SCRIPT_ITEM.THERAPEUTIC_CLASS AS FORM,
    SAT_MEDICINE_SCRIPT_ITEM.TRADE_NAME AS PRODUCT_NAME,
    CAST(SAT_PRESCRIPTION.GENERIC AS STRING) AS GENERIC_SUBSTITUTION_ALLOWED,
    CAST(NULL AS STRING) AS PBS_IDENTIFER,
    CAST(SAT_PRESCRIPTION.RPBS AS STRING) AS PBS_STATUS,
    CAST(SAT_PRESCRIPTION.SOURCE_CODE AS STRING) AS SOURCE_CODE,
    CAST(SAT_PRESCRIPTION.OMD_EFFECTIVE_DATETIME AS TIMESTAMP) AS OMD_EFFECTIVE_DATETIME,
    SAT_PRESCRIPTION.OMD_SOURCE_ROW_ID AS OMD_SOURCE_ROW_ID,
    SAT_PRESCRIPTION.OMD_INSERT_MODULE_INSTANCE_ID AS OMD_INSERT_MODULE_INSTANCE_ID,
    CAST(SAT_PRESCRIPTION.OMD_EXPIRY_DATETIME AS TIMESTAMP) AS OMD_EXPIRY_DATETIME,
    SAT_PRESCRIPTION.OMD_CURRENT_RECORD_INDICATOR AS OMD_CURRENT_RECORD_INDICATOR,
    SAT_PRESCRIPTION.OMD_DELETED_RECORD_INDICATOR AS OMD_DELETED_RECORD_INDICATOR,
    SAT_PRESCRIPTION.OMD_RECORD_SOURCE_ID AS OMD_RECORD_SOURCE_ID,
    SAT_PRESCRIPTION.OMD_HASH_FULL_RECORD AS OMD_HASH_FULL_RECORD
FROM 
/** PRESCRIPTION **/
    `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_PRESCRIPTION_OMOP` HUB_PRESCRIPTION
JOIN
    `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_PRESCRIPTION_MD_EXCLD_SENSITIVE_DATA_OMOP` SAT_PRESCRIPTION
ON
	HUB_PRESCRIPTION.HUB_PRESCRIPTION_SK = SAT_PRESCRIPTION.HUB_PRESCRIPTION_SK
JOIN
	 `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LNK_PRESCRIPTION_OMOP` LNK_PRESCRIPTION
ON
	SAT_PRESCRIPTION.HUB_PRESCRIPTION_SK = LNK_PRESCRIPTION.HUB_PRESCRIPTION_SK
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`LSAT_PRESCRIPTION_OMOP` LSAT_PRESCRIPTION
ON
	LNK_PRESCRIPTION.LNK_PRESCRIPTION_SK = LSAT_PRESCRIPTION.LNK_PRESCRIPTION_SK
JOIN
/** MEDICINE **/
    `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_MEDICINE_OMOP` HUB_MEDICINE
ON
	HUB_MEDICINE.HUB_MEDICINE_SK = LNK_PRESCRIPTION.HUB_MEDICINE_SK
JOIN
    `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_MEDICINE_PRESCRIPTION_MD_OMOP` SAT_MEDICINE
ON
	HUB_MEDICINE.HUB_MEDICINE_SK = SAT_MEDICINE.HUB_MEDICINE_SK
JOIN
/** MEDICINE SCRIPT ITEM **/
    `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_MEDICINE_SCRIPT_ITEM_MD_OMOP` SAT_MEDICINE_SCRIPT_ITEM
ON
	SAT_MEDICINE.HUB_MEDICINE_SK = SAT_MEDICINE_SCRIPT_ITEM.HUB_MEDICINE_SK
/** PATIENT **/
JOIN
	`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`HUB_SITE_PATIENT_OMOP` HUB_PATIENT
ON
	LNK_PRESCRIPTION.HUB_SITE_PATIENT_SK = HUB_PATIENT.HUB_SITE_PATIENT_SK
JOIN
`nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`SAT_SITE_PATIENT_MD_OMOP` SAT_PATIENT_GRH_MD
ON
	HUB_PATIENT.HUB_SITE_PATIENT_SK = SAT_PATIENT_GRH_MD.HUB_SITE_PATIENT_SK
/* Filters to retrieve non-deleted and current records */
WHERE
	SAT_PRESCRIPTION.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND SAT_PRESCRIPTION.OMD_DELETED_RECORD_INDICATOR = 'N'
	AND LSAT_PRESCRIPTION.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND LSAT_PRESCRIPTION.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND SAT_MEDICINE.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND SAT_MEDICINE.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND SAT_MEDICINE_SCRIPT_ITEM.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND SAT_MEDICINE_SCRIPT_ITEM.OMD_DELETED_RECORD_INDICATOR = 'N'
    AND SAT_PATIENT_GRH_MD.OMD_CURRENT_RECORD_INDICATOR = 'Y'
    AND SAT_PATIENT_GRH_MD.OMD_DELETED_RECORD_INDICATOR = 'N'
    
)

select * from prescription_grh_md