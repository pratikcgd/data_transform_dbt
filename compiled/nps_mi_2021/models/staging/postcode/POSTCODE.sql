

select 
POSTCODE_ID	,
CAST(POSTCODE_2019 AS INT) AS POSTCODE_2019,
SA2_MAINCODE_2016,
CITY,
CAST(PHN_CODE_2017 AS STRING) AS PHN_CODE_2017,
IRSAD_SCORE_2016,
IRSAD_DECILE_2016,
IRSD_SCORE_2016,
IRSD_DECILE_2016,
IER_SCORE_2016,
IER_DECILE_2016,
IEO_SCORE_2016,
IEO_DECILE_2016,
USUAL_RESIDENT_POPULATION_2016,
IRSAD_SCORE_2011,
IRSAD_DECILE_2011,
IRSD_SCORE_2011,
IRSD_DECILE_2011,
IER_SCORE_2011,
IER_DECILE_2011,
IEO_SCORE_2011,
IEO_DECILE_2011,
ASGS_RA_CODE_2016,
ASGS_RA_NAME_2016,
REMOTENESS_AREA_RATIO_2016,
ASGS_RA_CODE_2011,
ASGS_RA_NAME_2011,
REMOTENESS_AREA_RATIO_2011,
ASGS_RA_CODE_2011_MODIFIED,
ASGS_RA_CODE_2016_MODIFIED,
ASGS_RA_NAME_2011_MODIFIED,
ASGS_RA_NAME_2016_MODIFIED,
IEO_QUINTILE_2011,
IEO_QUINTILE_2016,
IER_QUINTILE_2011,
IER_QUINTILE_2016,
IRSAD_QUINTILE_2011,
IRSAD_QUINTILE_2016,
IRSD_QUINTILE_2011,
IRSD_QUINTILE_2016
from `nps-omop-project`.`B_SREDH_NPS_MI_SF_RDV_BDV_2021`.`POSTCODE_DATA`