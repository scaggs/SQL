SELECT DISTINCT
trr.npi
FROM common.dbo.vw_t_reporting_request_phi trr
INNER JOIN common.dbo.t_reporting_user tru ON trr.submitting_user_id=tru.user_id

WHERE trr.created_month > '2017-01-01 00:00:00.000'
AND trr.submitting_user_id='639004'
ORDER BY trr.npi ASC