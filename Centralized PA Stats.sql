SELECT
count(trr.request_id) AS 'Total Requests'


from common.dbo.vw_t_reporting_request_phi trr
join common.dbo.t_reporting_user u on trr.submitting_user_id = u.user_id
LEFT JOIN CMM_Repl.dbo.T_UserGroupMembership gm ON gm.user_id = u.user_id

where trr.real = 1
and trr.request_date_month BETWEEN '2017-04-01 00:00:00:000' AND '2018-03-31 00:00:00:000'
and u.can_create_realpa = 1
--AND trr.revenue_source_category='Physician'
AND trr.revenue_source_category='Pharmacy'
AND trr.submitting_user_id='468736'
--OR trr.submitting_user_id='576160'
--OR trr.submitting_user_id='1214872'
--OR trr.submitting_user_id='496523'
--OR trr.submitting_user_id='407106')
--AND gm.group_id='39806'
--OR gm.group_id='67859'
--OR gm.group_id='69214'
--OR gm.group_id='62955'
--OR gm.group_id='77026')
--AND u.email LIKE '%@uchealth.org'
--OR u.email LIKE '%@carolinas.org')