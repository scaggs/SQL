SELECT
contact.cntct_key AS 'cntct_key',
CASE WHEN geo.cbsa_nm_tx IS NULL THEN 'None'
ELSE geo.cbsa_nm_tx END AS 'area',
tru.user_type AS 'User Type',
tru.user_category AS 'User Category',
tru.user_bucket AS 'User Bucket',
trr.submitting_user_id,
tru.username,
tru.organization_name,
trr.drug_name,
LOWER (creator_email) AS 'email',
LOWER (RIGHT (creator_email, LEN(creator_email) - CHARINDEX('@', creator_email))) AS 'Email Domain',
tru.display_name,
tru.city,
tru.state,
tru.zip,
tru.phone,
tru.office_contact
FROM 
incubation_studio.dbo.cvs_specialty_multiple_sclerosis_targets cvs
LEFT JOIN  common.dbo.vw_t_reporting_request_phi trr ON trr.npi=cast(cvs.NPI as varchar(225))
INNER JOIN common.dbo.t_reporting_user tru ON trr.submitting_user_id=tru.user_id
LEFT JOIN SFMC.dbo.contact contact ON tru.user_id=contact.cntct_cmm_user_id
LEFT JOIN common.dbo.cmm_dim_geo geo ON LEFT(tru.zip, 5)=geo.zip_cd
WHERE trr.created_month >= '20170101'
AND trr.ddid IN 
(137637,
137638,
137639,
000408,
185384,
149015,
187771,
AND tru.user_bucket!='PHARMACY'
AND (tru.user_category!='Navinet'
OR tru.user_category!='EasyButton')
ORDER BY trr.created_month