SELECT
trr.npi,
trr.request_id,
trr.submitting_user_id,
tru.username,
tru.email,
tru.organization_name,
trr.drug_name,
trr.creator_email,
tru.display_name,
tru.city,
tru.state,
tru.zip,
tru.phone,
tru.office_contact
FROM 
incubation_studio.dbo.accredo_ms_targets esi
LEFT JOIN  common.dbo.vw_t_reporting_request_phi trr ON trr.npi=cast(esi.NPI as varchar(225))
INNER JOIN common.dbo.t_reporting_user tru ON trr.submitting_user_id=tru.user_id
WHERE trr.created_month >= '20170101'
ORDER BY trr.created_month