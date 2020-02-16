declare @date datetime
set @date = dateadd(mm,datediff(m,0,convert(date, getdate()))-12,0)

SELECT
convert(date, trr.request_date_month) AS 'Month',
count(trr.request_id) AS 'Total Requests',
count(distinct trr.npi) AS 'Distinct NPIs',
count(distinct trr.submitting_user_id) AS 'Active Users',
count(trr.request_id)/cast(count(distinct trr.submitting_user_id) as float) AS 'PA Per User',
SUM (case when trev.gross_pharma_revenue > 0 then 1 else 0 end) as 'Sponsored Volume',
SUM (trev.Gross_Pharma_Revenue+trev.Gross_Plan_Revenue) AS 'Total Revenue'

from common.dbo.vw_t_reporting_request_phi trr
join common.dbo.t_reporting_user u on trr.submitting_user_id = u.user_id
LEFT JOIN Finance.dbo.RequestRevenue trev ON trev.Request_ID=trr.request_id

where trr.real = 1
and trr.request_date_month >= @date
and u.can_create_realpa = 1
AND trr.ddid IN (select ddid from incubation_studio.dbo.oral_oncology_drug_list)

group by
convert(date, trr.request_date_month)
ORDER BY CONVERT(date, trr.request_date_month)
