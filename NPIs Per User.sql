declare @date datetime
set @date = dateadd(mm,datediff(m,0,convert(date, getdate()))-14,0)

SELECT
convert(date, trr.request_date_month) AS 'Month',
count(trr.request_id) AS 'Total Requests',
count(distinct trr.npi) AS 'Distinct NPIs',
u.npi
--count(distinct trr.submitting_user_id) AS 'Active Users'
--count(trr.request_id)/cast(count(distinct trr.submitting_user_id) as float) AS 'PA Per User'

from common.dbo.vw_t_reporting_request_phi trr
join common.dbo.t_reporting_user u on trr.submitting_user_id = u.user_id

where trr.real = 1
and trr.request_date_month >= @date
and u.can_create_realpa = 1
--AND trr.submitting_user_id='625157'
AND trr.submitting_user_id IN (564214, 631534, 719787, 756822, 770601)
--AND u.email LIKE '%@pcofiowa.com'

group by
convert(date, trr.request_date_month), u.npi
ORDER BY CONVERT(date, trr.request_date_month)

