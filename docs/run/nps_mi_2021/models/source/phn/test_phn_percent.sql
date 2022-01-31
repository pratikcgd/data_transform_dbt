

  create or replace view `nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`test_phn_percent`
  OPTIONS()
  as 

with phn_percent as (
SELECT SA2_MAINCODE_2016 ,SUM(PHN_CODE_2017_PERCENTAGE) AS  SA2_PHN_SUMS
FROM
`nps-omop-project`.`C_SREDH_NPS_MI_STAGING_SIMPLIFIED_2021`.`PRIMARY_HEALTH_NETWORK`
GROUP BY SA2_MAINCODE_2016 having (SA2_PHN_SUMS > 99)
)

select * from phn_percent;
