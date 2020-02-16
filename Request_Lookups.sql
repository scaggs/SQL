SELECT
trr.npi,
trr.submitting_user_id,
trr.request_date,
trr.form_name,
trr.form_description,
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
FROM common.dbo.vw_t_reporting_request_phi trr
INNER JOIN common.dbo.t_reporting_user tru ON trr.submitting_user_id=tru.user_id

WHERE trr.request_date > '2017-10-23 00:00:00.000'
--AND tru.user_id='643135'
AND trr.form_id IN (54088, 54140, 54794, 54932, 53384, 53390, 53392, 53385, 53393, 53383, 54492, 54494)
ORDER BY trr.created_month ASC