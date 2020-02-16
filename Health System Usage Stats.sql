declare @date datetime
set @date = dateadd(mm,datediff(m,0,convert(date, getdate()))-14,0)

SELECT
convert(date, trr.request_date_month) AS 'Month',
count(trr.request_id) AS 'Total Requests',
count(distinct trr.npi) AS 'Distinct NPIs',
count(distinct trr.submitting_user_id) AS 'Active Users',
count(trr.request_id)/cast(count(distinct trr.submitting_user_id) as float) AS 'PA Per User'

from common.dbo.vw_t_reporting_request_phi trr
JOIN common.dbo.t_reporting_user u on trr.submitting_user_id = u.user_id
--LEFT JOIN CMM_Repl.dbo.T_UserGroupMembership gm ON gm.user_id = u.user_id


where trr.real = 1
--and trr.request_date_month >= @date
--AND trr.request_date_month BETWEEN '2018-06-01 00:00:00:000' AND '2018-07-08 00:00:00:000'
and u.can_create_realpa = 1
--AND trr.submitting_user_id='859281'
--OR trr.submitting_user_id='470272'
--AND gm.group_id='73802'
AND u.email LIKE '%@tgh.org'
--OR u.email LIKE '%@carolinas.org')
--AND u.user_bucket='PRESCRIBER'
--AND tax.taxonomy_code='1835N1003X'
group by
convert(date, trr.request_date_month)
ORDER BY CONVERT(date, trr.request_date_month)
